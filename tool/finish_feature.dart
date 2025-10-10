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
void main(List<String> args) => runZonedGuarded(() async {
      await _checkForUncommittedChanges();
      final featureBranch = await _selectFeatureBranch(args);
      await _formatAndCommitChanges(featureBranch);
      await _squashCommits(featureBranch);
      await _mergeBranch(featureBranch);
      await _checkCommitInMaster(featureBranch);
      await _deleteBranch(featureBranch);
    }, (ex, st) {
      error(ex.toString());
      io.exit(1);
    });

Future<String> _run(String cmd, List<String> args) async {
  final result = await io.Process.run(cmd, args);
  if (result.exitCode != 0) {
    throw Exception('Error running $cmd ${args.join(" ")}: ${result.stderr}');
  }
  return (result.stdout as String).trim();
}

Future<void> _checkForUncommittedChanges() async {
  info('Checking for uncommitted changes...');
  final status = await _run('git', [
    'status',
    '--porcelain',
  ]);

  if (status.isNotEmpty) {
    throw Exception(
        'Uncommitted changes detected. Please commit them before proceeding.');
  }
}

Future<String> _selectFeatureBranch(List<String> args) async {
  info('Selecting feature branch...');
  final allBranchesStr =
      await _run('git', ['branch', '--format', '%(refname:short)']);

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

Future<void> _formatAndCommitChanges(String featureBranch) async {
  info('Formatting and committing changes...');
  final filesStr = await _run(
    'git',
    ['diff', '--name-only', '$masterBranch..$featureBranch'],
  );
  final files = filesStr.split('\n').where((it) => it.endsWith('.dart'));

  if (files.isNotEmpty) {
    info('Formatting files: ${files.join(", ")}');
    await _run('dart', ['format', ...files]);

    final status = await _run('git', [
      'status',
      '--porcelain',
    ]);
    if (status.isNotEmpty) {
      info('Committing formatted files...');
      await _run('git', [
        'add',
        '.',
      ]);
      await _run('git', ['commit', '-m', 'chore: Format dart files']);
    }
  }
}

Future<void> _squashCommits(String featureBranch) async {
  info('Squashing commits...');
  final countStr = await _run(
    'git',
    ['rev-list', '--count', '$masterBranch..$featureBranch'],
  );
  final commitsToSquash = int.tryParse(countStr) ?? 0;

  if (commitsToSquash <= 0) {
    info('No new commits to squash.');
    io.exit(0);
  }

  info('Branch $featureBranch has $commitsToSquash commits to squash.');

  if (commitsToSquash > 1) {
    info('Please complete the rebase in the opened editor. '
        'After saving and closing the editor, restart the script.');
    await _run('git', ['checkout', featureBranch]);

    await _run('git', ['rebase', '-i', 'HEAD~$commitsToSquash']);

    io.exit(0);
  } else {
    info('Only one commit to squash. Nothing to do.');
  }
}

Future<void> _mergeBranch(String featureBranch) async {
  info('Merging branch...');
  info('Checking out to $masterBranch...');
  await _run('git', ['checkout', masterBranch]);

  info('Fast-forward merging $featureBranch into $masterBranch...');
  await _run('git', ['merge', '--ff-only', featureBranch]);
}

Future<void> _checkCommitInMaster(String featureBranch) async {
  info('Checking commit in $masterBranch...');

  final lastCommit = await _run('git', ['rev-parse', featureBranch]);

  // Check if the last commit from the feature branch is in master.
  final result = await io.Process.run(
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

Future<void> _deleteBranch(String featureBranch) async {
  info('Deleting feature branch $featureBranch...');
  await _run('git', ['branch', '-D', featureBranch]);

  // Check if the branch exists on the remote 'origin'
  // before trying to delete it.
  final remoteCheckResult = await io.Process.run(
      'git', ['ls-remote', '--exit-code', 'origin', featureBranch]);

  if (remoteCheckResult.exitCode == 0) {
    info('Deleting remote branch $featureBranch from origin...');
    await _run('git', ['push', 'origin', '--delete', featureBranch]);
  }
}
