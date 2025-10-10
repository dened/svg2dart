import 'package:test/test.dart';
import '../tool/check_version.dart';

void main() {
  group('contentHasCorrectVersion', () {
    const packageInfo = (name: 'my_package', version: '1.2.3');

    for (final testCase in _testCases.entries) {
      test(testCase.key, () {
        expect(
          contentHasCorrectVersion(testCase.value.content, packageInfo),
          testCase.value.expected,
        );
      });
    }
  });
}

Map<String, ({String content, Matcher expected})> _testCases = {
  'should return true when content has the correct version': (
    content: '''
dependencies:
  my_package: ^1.2.3
''',
    expected: isTrue,
  ),
  'should return false when content has an incorrect version': (
    content: '''
dependencies:
  my_package: ^1.2.0
''',
    expected: isFalse,
  ),
  'should return false when package is not in content': (
    content: '''
dependencies:
  other_package: ^1.0.0
''',
    expected: isFalse,
  ),
  'should return false for empty content': (
    content: '',
    expected: isFalse,
  ),
  'should handle multiple dependencies and find the correct one': (
    content: '''
dependencies:
  other_package: ^1.0.0
  my_package: ^1.2.3
  another_package: ^2.0.0
''',
    expected: isTrue,
  ),
  'should return false if only incorrect versions are present': (
    content: 'my_package: ^1.2.2',
    expected: isFalse,
  ),
  'should return true when multiple occurrences are all correct': (
    content: '''
dependencies:
  my_package: ^1.2.3
dev_dependencies:
  my_package: ^1.2.3
''',
    expected: isTrue,
  ),
  'should return false when one of multiple versions is incorrect': (
    content: '''
dependencies:
  my_package: ^1.2.3
dev_dependencies:
  my_package: ^1.2.0
''',
    expected: isFalse,
  ),
};
