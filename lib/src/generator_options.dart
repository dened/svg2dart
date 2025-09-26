import 'package:build/build.dart' show BuilderOptions;
import 'package:meta/meta.dart';
import 'package:svg2dart/src/code_generator.dart';

/// Options for the generator.
@internal
@immutable
class GeneratorOptions {
  /// Constructor
  const GeneratorOptions({
    required this.input,
    required this.output,
    required this.convertTo,
    this.optimizations = false,
  });

  /// Constructor from [BuilderOptions]
  factory GeneratorOptions.fromOptions(BuilderOptions options) {
    final map = options.config;

    return GeneratorOptions(
      input: map['input'] as String? ?? 'assets/svg',
      output: map['output'] as String? ?? 'lib/generated/svg',
      convertTo: OutputClassType.fromString(map['convertTo'] as String?),
      optimizations: map['optimizations'] as bool? ?? false,
    );
  }

  /// The input directory containing SVG files.
  final String input;

  /// The output directory for generated Dart files.
  final String output;

  /// The type of class to generate.
  final OutputClassType convertTo;

  /// Enable optimizations.
  final bool optimizations;
}
