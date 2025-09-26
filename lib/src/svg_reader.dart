import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;
import 'package:svg2dart/src/code_generator.dart';
import 'package:vector_graphics_codec/vector_graphics_codec.dart'
    show VectorGraphicsCodec;
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart';

/// Generates a Dart CustomPainter widget from the given SVG content.
Future<void> generateWidgets(String inputFilePath, String outputFilePath,
    {OutputClassType convertTo = OutputClassType.record}) async {
  final svgContent = File(inputFilePath).readAsStringSync();

  final assetFilename = p.basenameWithoutExtension(inputFilePath);
  final generatedCode =
      generateFromContent(svgContent, assetFilename, convertTo: convertTo);

  // Create the output directory if it doesn't exist.
  final outputDir = p.dirname(outputFilePath);
  await Directory(outputDir).create(recursive: true);

  final file = File(outputFilePath);
  await file.writeAsString(generatedCode);
}

///
String generateFromContent(String svgContent, String assetFilename,
    {OutputClassType convertTo = OutputClassType.record,
    bool enableOptimizations = false}) {
  final bytes = encodeSvg(
    xml: svgContent,
    debugName: 'Svg loader',
    enableClippingOptimizer: enableOptimizations,
    enableMaskingOptimizer: enableOptimizations,
    enableOverdrawOptimizer: enableOptimizations,
  );

  const codec = VectorGraphicsCodec();
  final generator = CodeGenerator(classType: convertTo);
  final response = codec.decode(
    bytes.buffer.asByteData(),
    generator,
  );
  if (!response.complete) {
    codec.decode(bytes.buffer.asByteData(), generator, response: response);
  }

  final widgetName = _snakeToPascalCase(assetFilename);
  final painterName = '${widgetName}Painter';

  return _formatter.format(generator.getFileContent(widgetName, painterName));
}

final _formatter = DartFormatter(
  languageVersion: DartFormatter.latestLanguageVersion,
);

String _snakeToPascalCase(String snakeCase) => snakeCase
    .split(RegExp('[_-]'))
    .where((s) => s.isNotEmpty)
    .map((s) => s[0].toUpperCase() + s.substring(1))
    .join('');
