import 'dart:async';

import 'package:build/build.dart';
import 'package:path/path.dart' as p;
import 'package:svg2dart/src/code_parser.dart';

/// Pubspec builder
Builder svg2dartBuilder(BuilderOptions options) => Svg2DartBuilder(options);

/// A builder that converts SVG assets into Dart CustomPainter widgets.
class Svg2DartBuilder implements Builder {
  /// Creates a [Svg2DartBuilder] with the given [options].
  Svg2DartBuilder(BuilderOptions options)
      : _inputDirectory =
            options.config['input_dir'] as String? ?? 'assets/svg',
        _outputDirectory =
            options.config['output_dir'] as String? ?? 'lib/generated/svg';

  @override
  Map<String, List<String>> get buildExtensions => {
        '$_inputDirectory/{{}}.svg': ['$_outputDirectory/{{}}.dart'],
      };

  final String _inputDirectory;
  final String _outputDirectory;

  @override
  Future<void> build(BuildStep buildStep) async {
    final assetId = buildStep.inputId;
    final svgContent = await buildStep.readAsString(assetId);
    final assetFilename = p.basenameWithoutExtension(assetId.path);
    final generatedCode = generateFromContent(svgContent, assetFilename);

    final relativePath = p.relative(assetId.path, from: _inputDirectory);
    final baseOutputPath = p.withoutExtension(relativePath);

    final outputId = AssetId(
      assetId.package,
      p.join(
        _outputDirectory,
        p.setExtension('$baseOutputPath.svg', '.dart').replaceAll('-', '_'),
      ),
    );

    await buildStep.writeAsString(outputId, generatedCode);
  }
}
