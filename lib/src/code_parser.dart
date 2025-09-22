import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:svg2dart/src/code_generator.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart';

///
/// Generates a Flutter widget and painter from an SVG file.
///
Future<void> generateWidgets(String inputPath, String outputPath) async {
  final svgString = await File(inputPath).readAsString();
  final instructions = parseWithoutOptimizers(svgString);
  final generator = _playInstructions(instructions);

  final assetFilename = p.basenameWithoutExtension(inputPath);
  final widgetName = _snakeToPascalCase(assetFilename);
  final painterName = '${widgetName}Painter';
  final generatedCode = generator.getFileContent(widgetName, painterName);

  // Create the output directory if it doesn't exist.
  final outputDir = p.dirname(outputPath);
  await Directory(outputDir).create(recursive: true);

  await File(outputPath).writeAsString(generatedCode);
  stdout.writeln('Generated $outputPath');
}

String _snakeToPascalCase(String snakeCase) => snakeCase
    .split(RegExp('[_-]'))
    .where((s) => s.isNotEmpty)
    .map((s) => s[0].toUpperCase() + s.substring(1))
    .join('');

CustomPainterGenerator _playInstructions(
  VectorInstructions instructions,
) {
  final generator = CustomPainterGenerator()
    ..onSize(instructions.width, instructions.height);

  final fillIds = <int, int>{};
  final strokeIds = <int, int>{};
  final shaderIds = <Gradient, int>{};
  var nextShaderId = 0;

  for (final paint in instructions.paints) {
    if (paint.fill?.shader != null) {
      final shader = paint.fill!.shader!;
      if (!shaderIds.containsKey(shader)) {
        final shaderId = nextShaderId++;
        shaderIds[shader] = shaderId;
        if (shader is LinearGradient) {
          generator.onLinearGradient(
            shader.from.x,
            shader.from.y,
            shader.to.x,
            shader.to.y,
            Int32List.fromList(shader.colors!.map((c) => c.value).toList()),
            shader.offsets == null
                ? null
                : Float32List.fromList(shader.offsets!),
            shader.tileMode!.index,
            shaderId,
          );
        } else if (shader is RadialGradient) {
          generator.onRadialGradient(
            shader.center.x,
            shader.center.y,
            shader.radius,
            shader.focalPoint?.x,
            shader.focalPoint?.y,
            Int32List.fromList(shader.colors!.map((c) => c.value).toList()),
            shader.offsets == null
                ? null
                : Float32List.fromList(shader.offsets!),
            shader.transform?.toMatrix4(),
            shader.tileMode!.index,
            shaderId,
          );
        }
      }
    }
    // The same for stroke shader
    if (paint.stroke?.shader != null) {
      final shader = paint.stroke!.shader!;
      if (!shaderIds.containsKey(shader)) {
        final shaderId = nextShaderId++;
        shaderIds[shader] = shaderId;
        if (shader is LinearGradient) {
          generator.onLinearGradient(
            shader.from.x,
            shader.from.y,
            shader.to.x,
            shader.to.y,
            Int32List.fromList(shader.colors!.map((c) => c.value).toList()),
            shader.offsets == null
                ? null
                : Float32List.fromList(shader.offsets!),
            shader.tileMode!.index,
            shaderId,
          );
        } else if (shader is RadialGradient) {
          generator.onRadialGradient(
            shader.center.x,
            shader.center.y,
            shader.radius,
            shader.focalPoint?.x,
            shader.focalPoint?.y,
            Int32List.fromList(shader.colors!.map((c) => c.value).toList()),
            shader.offsets == null
                ? null
                : Float32List.fromList(shader.offsets!),
            shader.transform?.toMatrix4(),
            shader.tileMode!.index,
            shaderId,
          );
        }
      }
    }
  }

  var nextPaintId = 0;
  for (final paint in instructions.paints) {
    final fill = paint.fill;
    final stroke = paint.stroke;

    if (fill != null) {
      final shaderId = shaderIds[fill.shader];
      generator.onPaintObject(
        color: fill.color.value,
        blendMode: paint.blendMode.index,
        shaderId: shaderId,
        paintStyle: 0, // fill
        id: nextPaintId,
        strokeCap: null, strokeJoin: null, strokeMiterLimit: null,
        strokeWidth: null,
      );
      fillIds[nextPaintId] = nextPaintId;
    }
    if (stroke != null) {
      final shaderId = shaderIds[stroke.shader];
      generator.onPaintObject(
        color: stroke.color.value,
        strokeCap: stroke.cap?.index ?? 0,
        strokeJoin: stroke.join?.index ?? 0,
        blendMode: paint.blendMode.index,
        strokeMiterLimit: stroke.miterLimit ?? 4.0,
        strokeWidth: stroke.width ?? 1.0,
        shaderId: shaderId,
        paintStyle: 1, // stroke
        id: nextPaintId,
      );
      strokeIds[nextPaintId] = nextPaintId;
    }
    nextPaintId += 1;
  }

  final pathIds = <int, int>{};
  var nextPathId = 0;
  for (final path in instructions.paths) {
    pathIds[nextPathId] = nextPathId;
    generator.onPathStart(nextPathId, path.fillType.index);
    for (final command in path.commands) {
      switch (command.type) {
        case PathCommandType.move:
          final move = command as MoveToCommand;
          generator.onPathMoveTo(move.x, move.y);
          break;
        case PathCommandType.line:
          final line = command as LineToCommand;
          generator.onPathLineTo(line.x, line.y);
          break;
        case PathCommandType.cubic:
          final cubic = command as CubicToCommand;
          generator.onPathCubicTo(
              cubic.x1, cubic.y1, cubic.x2, cubic.y2, cubic.x3, cubic.y3);
          break;
        case PathCommandType.close:
          generator.onPathClose();
          break;
      }
    }
    generator.onPathFinished();
    nextPathId += 1;
  }

  var nextTextPositionId = 0;
  for (final position in instructions.textPositions) {
    generator.onTextPosition(
        nextTextPositionId++,
        position.x,
        position.y,
        position.dx,
        position.dy,
        position.reset,
        position.transform?.toMatrix4());
  }

  var nextTextId = 0;
  for (final textConfig in instructions.text) {
    generator.onTextConfig(
        textConfig.text,
        textConfig.fontFamily,
        textConfig.xAnchorMultiplier,
        textConfig.fontWeight.index,
        textConfig.fontSize,
        textConfig.decoration.mask,
        textConfig.decorationStyle.index,
        textConfig.decorationColor.value,
        nextTextId++);
  }

  for (final command in instructions.commands) {
    switch (command.type) {
      case DrawCommandType.path:
        if (fillIds.containsKey(command.paintId)) {
          generator.onDrawPath(pathIds[command.objectId]!,
              fillIds[command.paintId]!, command.patternId);
        }
        if (strokeIds.containsKey(command.paintId)) {
          generator.onDrawPath(pathIds[command.objectId]!,
              strokeIds[command.paintId]!, command.patternId);
        }
        break;
      case DrawCommandType.vertices:
        final vertices = instructions.vertices[command.objectId!];
        final fillId = fillIds[command.paintId]!;
        generator.onDrawVertices(vertices.vertices, vertices.indices, fillId);
        break;
      case DrawCommandType.saveLayer:
        generator.onSaveLayer(fillIds[command.paintId]!);
        break;
      case DrawCommandType.restore:
        generator.onRestoreLayer();
        break;
      case DrawCommandType.clip:
        generator.onClipPath(pathIds[command.objectId]!);
        break;
      case DrawCommandType.mask:
        generator.onMask();
        break;
      case DrawCommandType.pattern:
        final patternData = instructions.patternData[command.patternDataId!];
        generator.onPatternStart(
          command.patternDataId!,
          patternData.x,
          patternData.y,
          patternData.width,
          patternData.height,
          patternData.transform.toMatrix4(),
        );
        break;
      case DrawCommandType.textPosition:
        generator.onUpdateTextPosition(command.objectId!);
        break;
      case DrawCommandType.text:
        generator.onDrawText(
          command.objectId!,
          fillIds[command.paintId],
          strokeIds[command.paintId],
          command.patternId,
        );
        break;
      case DrawCommandType.image:
        final drawImageData = instructions.drawImages[command.objectId!];
        generator.onDrawImage(
          drawImageData.id,
          drawImageData.rect.left,
          drawImageData.rect.top,
          drawImageData.rect.width,
          drawImageData.rect.height,
          drawImageData.transform?.toMatrix4(),
        );
        break;
    }
  }
  return generator;
}
