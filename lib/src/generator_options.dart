import 'dart:developer';

import 'package:build/build.dart' show BuilderOptions;
import 'package:meta/meta.dart';

/// Options for the generator.
@internal
@immutable
class GeneratorOptions {
  /// Constructor
  const GeneratorOptions({
    required this.input,
    required this.output,
    this.optimizations = false,
  });

  /// Constructor from [BuilderOptions]
  factory GeneratorOptions.fromOptions(BuilderOptions options) {
    final map = options.config;
    final optimizations = map['optimizations'] as bool? ?? false;
    if (optimizations) {
      log('WARNING: Optimizations flag is not supported with build_runner.',
          level: 900);
    }
    return GeneratorOptions(
      input: map['input'] as String? ?? 'assets/svg',
      output: map['output'] as String? ?? 'lib/generated/svg',
      optimizations: map['optimizations'] as bool? ?? false,
    );
  }

  /// The input directory containing SVG files.
  final String input;

  /// The output directory for generated Dart files.
  final String output;

  /// Enable optimizations.
  final bool optimizations;
}
