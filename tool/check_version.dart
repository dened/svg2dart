import 'dart:async';
import 'dart:io' as io;

import 'package:meta/meta.dart';

import 'src/logger.dart';

const pubspecPath = 'pubspec.yaml';
const readmePath = 'README.md';

typedef PackageInfo = ({String name, String version});

void main() => runZonedGuarded(() {
      if (!checkVersion()) {
        throw Exception('Version mismatch between pubspec.yaml and README.md');
      }
    }, (e, st) {
      error(e.toString());
      io.exit(1);
    });

bool checkVersion() {
  final packageInfo = parsePubspec();

  final readme = io.File(readmePath);
  final readmeContent = readme.readAsStringSync();

  return contentHasCorrectVersion(readmeContent, packageInfo);
}

PackageInfo parsePubspec() {
  final pubspec = io.File(pubspecPath);
  final pubspecContent = pubspec.readAsStringSync();
  final nameMatch = RegExp('name: (.*)').firstMatch(pubspecContent);
  final versionMatch = RegExp('version: (.*)').firstMatch(pubspecContent);
  final name = nameMatch?.group(1);
  final version = versionMatch?.group(1);
  if (name == null || version == null) {
    throw Exception('Failed to parse pubspec.yaml, name or version not found.');
  }
  return (name: name, version: version);
}

@visibleForTesting
bool contentHasCorrectVersion(String content, PackageInfo packageInfo) {
  final name = packageInfo.name;
  final version = packageInfo.version;

  final regex =
      RegExp('$name:\\s*\\^?[0-9]+\\.[0-9]+\\.[0-9]+(?:[-+][A-Za-z0-9\\.-]+)?');
  final versionList = regex.allMatches(content);

  if (versionList.isEmpty) {
    return false;
  }

  return versionList.every((match) => match.group(0) == '$name: ^$version');
}
