import 'dart:io' as io;
import 'src/logger.dart';

/// A tool to set up git hooks.
///
/// This script creates a pre-commit hook that runs `tool/pre_commit.dart`.
///
/// Usage: `dart tool/setup_hooks.dart`
void main() {
  const preCommitToolPath = 'tool/pre_commit.dart';

  final gitHookDir = io.Directory('.git/hooks');
  final preCommitTool = io.File(preCommitToolPath);

  if (!preCommitTool.existsSync()) {
    error('No tool/pre_commit.dart file found.');
    io.exit(1);
  }

  if (!gitHookDir.existsSync()) {
    error('No .git/hooks directory found.');
    io.exit(1);
  }

  final preCommitPath = '${gitHookDir.path}/pre-commit';

  final preCommitFile = io.File(preCommitPath);
  if (preCommitFile.existsSync()) {
    info('pre-commit file already exists.');
    io.exit(0);
  }

  preCommitFile.writeAsStringSync('#!/usr/bin/env bash\n'
      'dart run $preCommitToolPath');

  if (!io.Platform.isWindows) {
    io.Process.runSync('chmod', ['+x', preCommitFile.path]);
  }

  info('pre-commit hook created at $preCommitPath');
}
