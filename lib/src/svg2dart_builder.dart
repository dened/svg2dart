import 'dart:async';

import 'package:build/build.dart';
import 'package:path/path.dart' as p;
import 'package:svg2dart/src/svg_reader.dart';
import 'package:svg2dart/src/generator_options.dart';

/// Pubspec builder
Builder svg2dartBuilder(BuilderOptions options) =>
    Svg2DartBuilder(GeneratorOptions.fromOptions(options));

/// A builder that converts SVG assets into Dart CustomPainter widgets.
class Svg2DartBuilder implements Builder {
  final GeneratorOptions _options;

  /// Creates a new [Svg2DartBuilder] with the given [options].
  Svg2DartBuilder(GeneratorOptions options) : _options = options;

  @override
  Map<String, List<String>> get buildExtensions => {
        '${_options.input}/{{}}.svg': ['${_options.output}/{{}}.dart'],
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    final assetId = buildStep.inputId;
    final svgContent = await buildStep.readAsString(assetId);
    final assetFilename = p.basenameWithoutExtension(assetId.path);
    final generatedCode = generateFromContent(svgContent, assetFilename);

    final relativePath = p.relative(assetId.path, from: _options.input);
    final baseOutputPath = p.withoutExtension(relativePath);

    final outputId = AssetId(
      assetId.package,
      p.join(
        _options.output,
        p.setExtension('$baseOutputPath.svg', '.dart').replaceAll('-', '_'),
      ),
    );

    await buildStep.writeAsString(outputId, generatedCode);
  }
}
