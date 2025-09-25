import 'package:build/build.dart' show BuilderOptions;
import 'package:meta/meta.dart';

/// Options for the generator.
@internal
@immutable
class GeneratorOptions {
  /// Constructor
  const GeneratorOptions({required this.input, required this.output});

  /// Constructor from [BuilderOptions]
  factory GeneratorOptions.fromOptions(BuilderOptions options) {
    final map = options.config;

    return GeneratorOptions(
      input: map['input'] as String? ?? 'assets/svg',
      output: map['output'] as String? ?? 'assets/svg',
    );
  }

  /// The input directory containing SVG files.
  final String input;

  /// The output directory for generated Dart files.
  final String output;
}
