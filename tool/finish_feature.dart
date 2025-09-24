import 'dart:io' as io;

const masterBranch = 'master';

final _log = io.stdout.writeln; // Log to stdout
final _err = io.stderr.writeln; // Log to stderr

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
void main(List<String> args) async {
  await _checkForUncommittedChanges();
  final featureBranch = await _selectFeatureBranch(args);
  await _formatAndCommitChanges(featureBranch);
  await _squashCommits(featureBranch);
  await _mergeBranch(featureBranch);
  await _checkCommitInMaster(featureBranch);
  await _deleteBranch(featureBranch);
}

Future<String> _run(String cmd, List<String> args) async {
  final result = await io.Process.run(cmd, args);
  if (result.exitCode != 0) {
    _err('Error running $cmd ${args.join(" ")}: ${result.stderr}');
    io.exit(result.exitCode);
  }
  return (result.stdout as String).trim();
}

Future<void> _checkForUncommittedChanges() async {
  _log('Checking for uncommitted changes...');
  final status = await _run('git', [
    'status',
    '--porcelain',
  ]);

  if (status.isNotEmpty) {
    _err('Uncommitted changes detected. Please commit them before proceeding.');
    io.exit(1);
  }
}

Future<String> _selectFeatureBranch(List<String> args) async {
  _log('Selecting feature branch...');
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
    _log('Selected branch from arguments: $branch');
    return branch;
  }

  _log('Branch not specified or not found.');
  _log('Select a branch to merge into $masterBranch:');
  for (var i = 0; i < allBranches.length; i++) {
    _log('${i + 1}. ${allBranches[i]}');
  }
  _log('Write the number of the branch:');
  final input = io.stdin.readLineSync();
  if (input == null || input.isEmpty) {
    _err('No input provided. Exiting.');
    io.exit(1);
  }
  final index = int.tryParse(input);
  if (index == null || index < 1 || index > allBranches.length) {
    _err('Invalid input. Exiting.');
    io.exit(1);
  }
  final branch = allBranches[index - 1];
  _log('Selected branch: $branch');
  return branch;
}

Future<void> _formatAndCommitChanges(String featureBranch) async {
  _log('Formatting and committing changes...');
  final filesStr = await _run(
    'git',
    ['diff', '--name-only', '$masterBranch..$featureBranch'],
  );
  final files = filesStr.split('\n').where((it) => it.endsWith('.dart'));

  if (files.isNotEmpty) {
    _log('Formatting files: ${files.join(", ")}');
    await _run('dart', ['format', ...files]);

    final status = await _run('git', [
      'status',
      '--porcelain',
    ]);
    if (status.isNotEmpty) {
      _log('Committing formatted files...');
      await _run('git', [
        'add',
        ...files,
      ]);
      await _run('git', ['commit', '-m', 'chore: Format dart files']);
    }
  }
}

Future<void> _squashCommits(String featureBranch) async {
  _log('Squashing commits...');
  final countStr = await _run(
    'git',
    ['rev-list', '--count', '$masterBranch..$featureBranch'],
  );
  final commitsToSquash = int.tryParse(countStr) ?? 0;

  if (commitsToSquash <= 0) {
    _log('No new commits to squash.');
    return;
  }

  _log('Branch $featureBranch has $commitsToSquash commits to squash.');

  if (commitsToSquash > 1) {
    _log('Squashing $commitsToSquash commits...');
    await _run('git', ['checkout', featureBranch]);
    await _run('git', ['rebase', '-i', 'HEAD~$commitsToSquash']);
  } else {
    _log('Only one commit to squash. Nothing to do.');
  }
}

Future<void> _mergeBranch(String featureBranch) async {
  _log('Merging branch...');
  _log('Checking out to $masterBranch...');
  await _run('git', ['checkout', masterBranch]);

  _log('Fast-forward merging $featureBranch into $masterBranch...');
  await _run('git', ['merge', '--ff-only', featureBranch]);
}

Future<void> _checkCommitInMaster(String featureBranch) async {
  _log('Checking commit in $masterBranch...');

  final lastCommit = await _run('git', ['rev-parse', featureBranch]);

  // Check if the last commit from the feature branch is in master.
  final result = await io.Process.run(
    'git',
    ['merge-base', '--is-ancestor', lastCommit, 'master'],
  );

  if (result.exitCode == 0) {
    _log('Merging is successefuly completed.');
  } else {
    _err('The last commit from $featureBranch is not in $masterBranch. '
        'Merge failed.');
    io.exit(1);
  }
}

Future<void> _deleteBranch(String featureBranch) async {
  _log('Deleting feature branch $featureBranch...');
  await _run('git', ['branch', '-D', featureBranch]);
  await _run('git', ['push', 'origin', '--delete', featureBranch]);
}
