import 'dart:async';
import 'dart:io' as io;
import 'check_version.dart';
import 'src/logger.dart';

void main() => runZonedGuarded(() {
      info('Running pre-commit checks...');

      final diffResult =
          io.Process.runSync('git', ['diff', '--cached', '--name-only']);
      if (diffResult.exitCode != 0) {
        throw Exception('Failed to get git diff: ${diffResult.stderr}');
      }
      final diffOutput = diffResult.stdout as String;
      final changedFiles = diffOutput.split('\n');

      if (!changedFiles.contains(pubspecPath)) {
        info('No staged changes to $pubspecPath detected. Skipping.');
        io.exit(0);
      }

      // read name and version from pubspec
      final packageInfo = parsePubspec();
      final name = packageInfo.name;
      final version = packageInfo.version;

      // update readme
      final readme = io.File(readmePath);
      final readmeContent = readme.readAsStringSync();
      final updatedReadmeContent = readmeContent.replaceAllMapped(
        RegExp(
            '$name:\\s*\\^?[0-9]+\\.[0-9]+\\.[0-9]+(?:[-+][A-Za-z0-9\\.-]+)?'),
        (m) => '$name: ^$version',
      );

      if (updatedReadmeContent == readmeContent) {
        info('$readmePath is already up-to-date. Nothing to do.');
        io.exit(0);
      }

      readme.writeAsStringSync(updatedReadmeContent);
      final addResult = io.Process.runSync('git', ['add', '"$readmePath"']);
      if (addResult.exitCode != 0) {
        throw Exception(
            'Failed to add $readmePath to git: ${addResult.stderr}');
      }

      info('Updated $readmePath with new version.');
    }, (e, st) {
      error(e.toString());
      io.exit(1);
    });
