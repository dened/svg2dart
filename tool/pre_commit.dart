import 'dart:io' as io;
import 'src/logger.dart';

const pubspecPath = 'pubspec.yaml';
const readmePath = 'readme.md';

void main() {
  info('Running pre-commit checks...');

  final diffResult =
      io.Process.runSync('git', ['diff', '--cached', '--name-only']);
  if (diffResult.exitCode != 0) {
    error('Failed to get git diff: ${diffResult.stderr}');
  }
  final diffOutput = diffResult.stdout as String;
  final changedFiles = diffOutput.split('\n');

  if (!changedFiles.contains(pubspecPath)) {
    complete('No changes to $pubspecPath detected.');
  }

  // read name and version from pubspec
  final pubspec = io.File(pubspecPath);
  final pubspecContent = pubspec.readAsStringSync();
  final nameMatch = RegExp(r'name: (.*)').firstMatch(pubspecContent);
  final versionMatch = RegExp(r'version: (.*)').firstMatch(pubspecContent);
  final name = nameMatch?.group(1);
  final version = versionMatch?.group(1);
  if (name == null || version == null) {
    error('Failed to parse pubspec.yaml, name or version not found.');
  }

  // update readme
  final readme = io.File(readmePath);
  final readmeContent = readme.readAsStringSync();
  final updatedReadmeContent = readmeContent.replaceAllMapped(
    RegExp('$name:\\s*\\^?[0-9]+\\.[0-9]+\\.[0-9]+(?:[-+][A-Za-z0-9\\.-]+)?'),
    (m) => '$name: ^$version',
  );

  if (updatedReadmeContent == readmeContent) {
    complete('No changes to $readmePath detected.');
  }

  readme.writeAsStringSync(updatedReadmeContent);
  final addResult = io.Process.runSync('git', ['add', '"$readmePath"']);
  if (addResult.exitCode != 0) {
    error('Failed to add $readmePath to git: ${addResult.stderr}');
  }

  info('Updated $readmePath with new version.');
}
