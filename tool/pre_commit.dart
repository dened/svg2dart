import 'dart:io' as io;

enum _Level { info, error }

void _log(_Level level, String message) {
  // ignore: avoid_print
  print('[${level.name.toUpperCase()}] $message');
}

void _info(String message) => _log(_Level.info, message);

void _error(String message) {
  _log(_Level.error, message);
  io.exit(1);
}

void _complete(String message) {
  _log(_Level.info, message);
  io.exit(0);
}

const pubspecPath = 'pubspec.yaml';
const readmePath = 'readme.md';

void main() {
  _info('Running pre-commit checks...');

  final diffResult =
      io.Process.runSync('git', ['diff', '--cached', '--name-only']);
  if (diffResult.exitCode != 0) {
    _error('Failed to get git diff: ${diffResult.stderr}');
  }
  final diffOutput = diffResult.stdout as String;
  final changedFiles = diffOutput.split('\n');

  if (!changedFiles.contains(pubspecPath)) {
    _complete('No changes to $pubspecPath detected.');
  }

  // read name and version from pubspec
  final pubspec = io.File(pubspecPath);
  final pubspecContent = pubspec.readAsStringSync();
  final nameMatch = RegExp(r'name: (.*)').firstMatch(pubspecContent);
  final versionMatch = RegExp(r'version: (.*)').firstMatch(pubspecContent);
  final name = nameMatch?.group(1);
  final version = versionMatch?.group(1);
  if (name == null || version == null) {
    _error('Failed to parse pubspec.yaml, name or version not found.');
  }

  // update readme
  final readme = io.File(readmePath);
  final readmeContent = readme.readAsStringSync();
  final updatedReadmeContent = readmeContent.replaceAllMapped(
    RegExp('$name:\\s*\\^?[0-9]+\\.[0-9]+\\.[0-9]+(?:[-+][A-Za-z0-9\\.-]+)?'),
    (m) => '$name: ^$version',
  );

  if (updatedReadmeContent == readmeContent) {
    _complete('No changes to $readmePath detected.');
  }

  readme.writeAsStringSync(updatedReadmeContent);
  final addResult = io.Process.runSync('git', ['add', '"$readmePath"']);
  if (addResult.exitCode != 0) {
    _error('Failed to add $readmePath to git: ${addResult.stderr}');
  }

  _info('Updated $readmePath with new version.');
}
