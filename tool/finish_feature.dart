import 'dart:async';
import 'dart:io' as io;

import 'src/logger.dart';

const masterBranch = 'master';

/// A tool to automate the process of merging a feature branch
/// into the master branch.
///
/// This script performs the following steps:
/// 1. Checks for uncommitted changes in the working directory.
/// 2. Selects a feature branch to be merged. The branch can be passed as
///    an argument or selected from a list of available branches.
/// 3. Formats all changed `.dart` files between the master and feature branch
///    and creates a new commit if any files were changed by the formatter.
/// 4. Squashes all commits in the feature branch into a single commit via an
///    interactive rebase.
/// 5. Merges the feature branch into the master branch using
///    a fast-forward merge.
/// 6. Deletes the feature branch both locally and on the remote 'origin'.
///
/// Usage:
/// `dart tool/finish_feature.dart [feature-branch-name]`
///
/// If `feature-branch-name` is not provided, the script will prompt
/// to select one.
void main(List<String> args) => runZonedGuarded(() {
      _checkForUncommittedChanges();
      final featureBranch = _selectFeatureBranch(args);
      _formatAndCommitChanges(featureBranch);
      _trySyncFeatureBranch(featureBranch);
      _squashCommits(featureBranch);
      _mergeBranch(featureBranch);
      _checkCommitInMaster(featureBranch);
      _deleteBranch(featureBranch);
    }, (ex, st) {
      error(ex.toString());
      io.exit(1);
    });

String _run(String cmd, List<String> args) {
  final result = io.Process.runSync(cmd, args);
  if (result.exitCode != 0) {
    throw Exception('Error running $cmd ${args.join(" ")}: ${result.stderr}');
  }
  return (result.stdout as String).trim();
}

void _checkForUncommittedChanges() {
  info('Checking for uncommitted changes...');
  final status = _run('git', [
    'status',
    '--porcelain',
  ]);

  if (status.isNotEmpty) {
    throw Exception(
        'Uncommitted changes detected. Please commit them before proceeding.');
  }
}

String _selectFeatureBranch(List<String> args) {
  info('Selecting feature branch...');
  final allBranchesStr =
      _run('git', ['branch', '--format', '%(refname:short)']);

  final allBranches = allBranchesStr
      .split('\n')
      .map((it) => it.trim())
      .where((it) => it.isNotEmpty)
      .where((it) => it != masterBranch)
      .toList();

  if (args.isNotEmpty && allBranches.contains(args.first)) {
    final branch = args.first;
    info('Selected branch from arguments: $branch');
    return branch;
  }

  info('Branch not specified or not found.');
  info('Select a branch to merge into $masterBranch:');
  for (var i = 0; i < allBranches.length; i++) {
    info('${i + 1}. ${allBranches[i]}');
  }
  info('Write the number of the branch:');
  final input = io.stdin.readLineSync();
  if (input == null || input.isEmpty) {
    throw Exception('No input provided. Exiting.');
  }
  final index = int.tryParse(input);
  if (index == null || index < 1 || index > allBranches.length) {
    throw Exception('Invalid input. Exiting.');
  }
  final branch = allBranches[index - 1];
  info('Selected branch: $branch');
  return branch;
}

void _trySyncFeatureBranch(String featureBranch) {
  if (_isBranchBehindMaster(featureBranch)) {
    info('Please complete the rebase in the opened editor. '
        'After saving and closing the editor, restart the script.');
    _run('git', ['checkout', featureBranch]);
    _run('git', ['rebase', masterBranch]);
    io.exit(0);
  }
}

bool _isBranchBehindMaster(String branch) {
  final result = _run('git', [
    'rev-list',
    '--count',
    '$branch..$masterBranch',
  ]);

  return (int.tryParse(result) ?? 0) > 0;
}

void _formatAndCommitChanges(String featureBranch) {
  info('Formatting and committing changes...');
  final filesStr = _run(
    'git',
    ['diff', '--name-only', '$masterBranch..$featureBranch'],
  );
  final files = filesStr.split('\n').where((it) => it.endsWith('.dart'));

  if (files.isNotEmpty) {
    info('Formatting files: ${files.join(", ")}');
    _run('dart', ['format', ...files]);

    final status = _run('git', [
      'status',
      '--porcelain',
    ]);
    if (status.isNotEmpty) {
      info('Committing formatted files...');
      _run('git', [
        'add',
        '.',
      ]);
      _run('git', ['commit', '-m', 'chore: Format dart files']);
    }
  }
}

void _squashCommits(String featureBranch) {
  info('Squashing commits...');
  final countStr = _run(
    'git',
    ['rev-list', '--count', '$masterBranch..$featureBranch'],
  );
  final commitsToSquash = int.tryParse(countStr) ?? 0;

  if (commitsToSquash <= 0) {
    info('No new commits to squash.');
    io.exit(0);
  }

  info('Branch $featureBranch has $commitsToSquash commits to squash.');

  if (commitsToSquash == 1) {
    info('Only one commit to squash. Nothing to do.');
    return;
  }

  info('Must squashed commits [y/n]?');
  final input = io.stdin.readLineSync();
  if (input == 'y') {
    info('Please complete the rebase in the opened editor. '
        'After saving and closing the editor, restart the script.');
    _run('git', ['checkout', featureBranch]);

    _run('git', ['rebase', '-i', 'HEAD~$commitsToSquash']);

    io.exit(0);
  }
}

void _mergeBranch(String featureBranch) {
  info('Merging branch...');
  info('Checking out to $masterBranch...');
  _run('git', ['checkout', masterBranch]);

  info('Fast-forward merging $featureBranch into $masterBranch...');
  _run('git', ['merge', '--ff-only', featureBranch]);
}

void _checkCommitInMaster(String featureBranch) {
  info('Checking commit in $masterBranch...');

  final lastCommit = _run('git', ['rev-parse', featureBranch]);

  // Check if the last commit from the feature branch is in master.
  final result = io.Process.runSync(
    'git',
    ['merge-base', '--is-ancestor', lastCommit, 'master'],
  );

  if (result.exitCode == 0) {
    info('Merging is successefuly completed.');
  } else {
    throw Exception(
        'The last commit from $featureBranch is not in $masterBranch. '
        'Merge failed.');
  }
}

void _deleteBranch(String featureBranch) {
  info('Deleting feature branch $featureBranch...');
  _run('git', ['branch', '-D', featureBranch]);

  // Check if the branch exists on the remote 'origin'
  // before trying to delete it.
  final remoteCheckResult = io.Process.runSync(
      'git', ['ls-remote', '--exit-code', 'origin', featureBranch]);

  if (remoteCheckResult.exitCode == 0) {
    info('Deleting remote branch $featureBranch from origin...');
    _run('git', ['push', 'origin', '--delete', featureBranch]);
  }
}
