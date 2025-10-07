import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;
import 'package:svg2dart/src/code_generator.dart';
import 'package:svg2dart/src/not_supported_exception.dart';
import 'package:vector_graphics_codec/vector_graphics_codec.dart'
    show VectorGraphicsCodec;
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart';

/// Generates a Dart CustomPainter widget from the given SVG content.
void generateWidgets(String inputFilePath, String outputFilePath) {
  final svgContent = File(inputFilePath).readAsStringSync();

  final assetFilename = p.basenameWithoutExtension(inputFilePath);
  final generatedCode = generateFromContent(svgContent, assetFilename);

  // Create the output directory if it doesn't exist.
  final outputDir = p.dirname(outputFilePath);
  Directory(outputDir).createSync(recursive: true);

  File(outputFilePath).writeAsStringSync(generatedCode);
}

///
String generateFromContent(String svgContent, String assetFilename,
    {bool enableOptimizations = false}) {
  Uint8List bytes;
  try {
    bytes = encodeSvg(
      xml: svgContent,
      debugName: 'Svg loader',
      enableClippingOptimizer: enableOptimizations,
      enableMaskingOptimizer: enableOptimizations,
      enableOverdrawOptimizer: enableOptimizations,
    );
  } on Object catch (ex, st) {
    log("Can't read SVG file.", error: ex, stackTrace: st, level: 1200);
    throw const NotSupportedException("Can't read SVG file.");
  }

  const codec = VectorGraphicsCodec();
  final generator = CodeGenerator();
  final response = codec.decode(
    bytes.buffer.asByteData(),
    generator,
  );
  if (!response.complete) {
    codec.decode(bytes.buffer.asByteData(), generator, response: response);
  }

  final widgetName = '${_snakeToPascalCase(assetFilename)}Svg';
  var code = generator.getFileContent(widgetName);
  try {
    code = _formatter.format(code);
  } on FormatterException catch (ex, st) {
    log("Can't format code.", error: ex, stackTrace: st, level: 1200);

    throw const NotSupportedException("Can't generate valid code.");
  }
  return code;
}

final _formatter = DartFormatter(
  languageVersion: DartFormatter.latestLanguageVersion,
);

String _snakeToPascalCase(String snakeCase) => snakeCase
    .split(RegExp('[_-]'))
    .where((s) => s.isNotEmpty)
    .map((s) => s[0].toUpperCase() + s.substring(1))
    .join('');
