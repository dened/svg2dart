// ignore_for_file: lines_longer_than_80_chars

import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:svg2dart/src/not_supported_exception.dart';
import 'package:svg2dart/src/templates.dart';
import 'package:vector_graphics_codec/vector_graphics_codec.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart';

@internal
class CodeGenerator implements VectorGraphicsCodecListener {
  final Map<int, String> _paints = <int, String>{};
  final Map<int, String> _paths = <int, String>{};
  final Map<int, String> _shaders = <int, String>{};
  final List<_TextConfig> _textConfig = <_TextConfig>[];
  final List<_TextPosition> _textPositions = <_TextPosition>[];

  bool _usesTypedData = false;

  final StringBuffer _definitions = StringBuffer();
  final StringBuffer _drawCommands = StringBuffer();
  bool _isAddedDrawTextFunction = false;
  bool _isDefineDrawTextVars = false;

// convert to grayscale (https://www.w3.org/Graphics/Color/sRGB) and
// use them as transparency
  static const String _grayscaleDstInPaint = '''
Paint()
    ..blendMode = BlendMode.dstIn
    ..colorFilter = const ColorFilter.matrix(<double>[
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0,
      0, 0, 0, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
    ])''';

  StringBuffer? _currentPathBuffer;

  Size _size = Size.zero;
  String _colorToCode(int value) =>
      'const Color(0x${(value & 0xFFFFFFFF).toRadixString(16).padLeft(8, '0')})';

  double _textPositionX = 0;
  double _textPositionY = 0;
  Float64List? _textTransform;

  String getFileContent(String widgetName) => generateCodeFromTemplate(
        widgetName: widgetName,
        useTypedDataImport: _usesTypedData,
        definitions: _definitions,
        drawCommands: _drawCommands,
        size: _size,
      );

  @override
  void onSize(double width, double height) {
    _size = Size(width, height);
  }

  @override
  @override
  void onPaintObject({
    required int color,
    required int? strokeCap,
    required int? strokeJoin,
    required int blendMode,
    required double? strokeMiterLimit,
    required double? strokeWidth,
    required int paintStyle,
    required int id,
    required int? shaderId,
  }) {
    final paintVar = 'paint$id${paintStyle == 0 ? 'Fill' : 'Stroke'}';
    _paints[id] = paintVar;
    _definitions
      ..write('final $paintVar = Paint()..isAntiAlias = true')
      ..writeln(
          '..style = PaintingStyle.${paintStyle == 0 ? 'fill' : 'stroke'};');
    if (shaderId != null && _shaders.containsKey(shaderId)) {
      _definitions.writeln('$paintVar.shader = ${_shaders[shaderId]};');
    } else {
      _definitions.writeln('$paintVar.color = ${_colorToCode(color)};');
    }

    _definitions.writeln('$paintVar.colorFilter = _colorFilter;');

    if (paintStyle == 1) {
      // Stroke
      // SVG's default stroke width is 1.0. Flutter's default is 0.0.
      if (strokeWidth != null && strokeWidth != 0.0) {
        _definitions
            .writeln('$paintVar.strokeWidth = ${shortDouble(strokeWidth)};');
      }
      if (strokeCap != null && strokeCap != 0) {
        _definitions.writeln(
          '$paintVar.strokeCap = StrokeCap.${StrokeCap.values[strokeCap].name};',
        );
      }
      if (strokeJoin != null && strokeJoin != 0) {
        _definitions.writeln(
          '$paintVar.strokeJoin = StrokeJoin.${StrokeJoin.values[strokeJoin].name};',
        );
      }
      if (strokeMiterLimit != null && strokeMiterLimit != 4.0) {
        _definitions.writeln(
          '$paintVar.strokeMiterLimit = ${shortDouble(strokeMiterLimit)};',
        );
      }
    }
    if (blendMode != 0) {
      _definitions.writeln(
        '$paintVar.blendMode = BlendMode.${BlendMode.values[blendMode].name};',
      );
    }
    _definitions.writeln();
  }

  @override
  void onPathStart(int id, int fillType) {
    final pathVar = 'path_$id';
    _paths[id] = pathVar;
    _currentPathBuffer = StringBuffer('final $pathVar = Path()');
    if (fillType != 0) {
      _currentPathBuffer!.write('..fillType = PathFillType.values[$fillType]');
    }
  }

  @override
  void onPathMoveTo(double x, double y) => _currentPathBuffer!
      .write('..moveTo(${shortDouble(x)}, ${shortDouble(y)})');

  @override
  void onPathLineTo(double x, double y) => _currentPathBuffer!
      .write('..lineTo(${shortDouble(x)}, ${shortDouble(y)})');

  @override
  void onPathCubicTo(
          double x1, double y1, double x2, double y2, double x3, double y3) =>
      _currentPathBuffer!.write('..cubicTo('
          '${shortDouble(x1)}, '
          '${shortDouble(y1)}, '
          '${shortDouble(x2)}, '
          '${shortDouble(y2)}, '
          '${shortDouble(x3)}, '
          '${shortDouble(y3)})');

  @override
  void onPathClose() {
    _currentPathBuffer!.write('..close()');
  }

  @override
  void onPathFinished() {
    _currentPathBuffer!.write(';');
    _definitions
      ..writeln(_currentPathBuffer.toString())
      ..writeln();
    _currentPathBuffer = null;
  }

  @override
  void onDrawPath(int pathId, int? paintId, int? patternId) {
    final pathVar = _paths[pathId];
    final paintVar = _paints[paintId]!;
    _drawCommands.writeln('canvas.drawPath($pathVar, $paintVar);');
  }

  @override
  void onLinearGradient(
    double fromX,
    double fromY,
    double toX,
    double toY,
    Int32List colors,
    Float32List? offsets,
    int tileMode,
    int id,
  ) {
    final shaderVar = 'shader$id';
    _shaders[id] = shaderVar;
    final colorsList = colors.map(_colorToCode).join(', ');
    final offsetsList =
        offsets?.isNotEmpty == true ? '[${offsets!.join(', ')}]' : 'null';

    _definitions
      ..writeln('final $shaderVar = ui.Gradient.linear(')
      ..writeln('const Offset(${shortDouble(fromX)}, ${shortDouble(fromY)}),')
      ..writeln('const Offset(${shortDouble(toX)}, ${shortDouble(toY)}),')
      ..writeln('[$colorsList],')
      ..writeln('$offsetsList,')
      ..writeln('ui.TileMode.${TileMode.values[tileMode].name},')
      ..writeln(');');
  }

  @override
  void onClipPath(int pathId) {
    _drawCommands
      ..writeln('canvas.save();')
      ..writeln('canvas.clipPath(${_paths[pathId]});');
  }

  @override
  void onMask() {
    _drawCommands.writeln('canvas.saveLayer(null, $_grayscaleDstInPaint);');
  }

  @override
  void onPatternStart(
    int patternId,
    double x,
    double y,
    double width,
    double height,
    Float64List transform,
  ) {
    throw const NotSupportedException('Patterns are not supported.');
  }

  @override
  void onRadialGradient(
    double centerX,
    double centerY,
    double radius,
    double? focalX,
    double? focalY,
    Int32List colors,
    Float32List? offsets,
    Float64List? transform,
    int tileMode,
    int id,
  ) {
    _usesTypedData = true;
    final shaderVar = 'shader$id';
    _shaders[id] = shaderVar;
    final colorsList = colors.map(_colorToCode).join(', ');
    final offsetsList =
        offsets?.isNotEmpty ?? false ? '[${offsets!.join(', ')}]' : 'null';
    final transformList = transform != null
        ? 'Float64List.fromList(${transform.toList()})'
        : 'null';

    _definitions
      ..writeln('final $shaderVar = ui.Gradient.radial(')
      ..writeln(
          'const Offset(${shortDouble(centerX)}, ${shortDouble(centerY)}),')
      ..writeln('${shortDouble(radius)},')
      ..writeln('[$colorsList],')
      ..writeln('$offsetsList,')
      ..writeln('ui.TileMode.${TileMode.values[tileMode].name},')
      ..writeln('$transformList,')
      ..writeln(
          '${focalX != null ? 'const Offset(${shortDouble(focalX)}, ${shortDouble(focalY!)})' : 'null'},')
      ..writeln('0.0,')
      ..writeln(');');
  }

  @override
  void onRestoreLayer() {
    _drawCommands.writeln('canvas.restore();');
  }

  @override
  void onSaveLayer(int paintId) {
    _drawCommands.writeln('canvas.saveLayer(null, ${_paints[paintId]!});');
  }

  @override
  void onDrawVertices(Float32List vertices, Uint16List? indices, int? paintId) {
    _usesTypedData = true;
    final verticesVar = 'vertices${_drawCommands.length}';
    final indicesList =
        indices == null ? 'null' : 'Uint16List.fromList(${indices.toString()})';
    _definitions.writeln(
      'final $verticesVar = ui.Vertices.raw(ui.VertexMode.triangles, Float32List.fromList(${vertices.toString()}), indices: $indicesList);',
    );

    final paintVar = _paints[paintId]!;
    _drawCommands.writeln(
      'canvas.drawVertices($verticesVar, BlendMode.srcOver, $paintVar);',
    );
  }

  @override
  void onTextConfig(
    String text,
    String? fontFamily,
    double xAnchorMultiplier,
    int fontWeight,
    double fontSize,
    int decoration,
    int decorationStyle,
    int decorationColor,
    int id,
  ) {
    final decorations = <String>[];
    if (decoration & kUnderlineMask != 0) {
      decorations.add('TextDecoration.underline');
    }
    if (decoration & kOverlineMask != 0) {
      decorations.add('TextDecoration.overline');
    }
    if (decoration & kLineThroughMask != 0) {
      decorations.add('TextDecoration.lineThrough');
    }

    _textConfig.add(_TextConfig(
      text,
      fontFamily,
      xAnchorMultiplier,
      fontWeight,
      fontSize,
      'TextDecoration.combine([${decorations.join(', ')}])',
      decorationStyle,
      Color(decorationColor),
    ));
  }

  @override
  void onTextPosition(
    int id,
    double? x,
    double? y,
    double? dx,
    double? dy,
    bool reset,
    Float64List? transform,
  ) {
    _textPositions.add(_TextPosition(x, y, dx, dy, reset, transform));
  }

  @override
  void onUpdateTextPosition(int textPositionId) {
    final position = _textPositions[textPositionId];
    if (!_isDefineDrawTextVars) {
      _drawCommands
        ..writeln('double accumulatedTextWidth = 0;\n')
        ..writeln('double paragraphWidth = 0;\n');
      _isDefineDrawTextVars = true;
    }

    if (position.reset) {
      _textPositionX = 0;
      _textPositionY = 0;

      _drawCommands.writeln('accumulatedTextWidth = 0;\n');
    }

    if (position.x != null) {
      _textPositionX = position.x ?? _textPositionX;
    }
    if (position.y != null) {
      _textPositionY = position.y ?? _textPositionY;
    }

    if (position.dx != null) {
      _textPositionX = _textPositionX + position.dx!;
    }
    if (position.dy != null) {
      _textPositionY = _textPositionY + position.dy!;
    }

    _textTransform = position.transform;
  }

  @override
  void onDrawText(int textId, int? fillId, int? strokeId, int? patternId) {
    final config = _textConfig[textId];
    final fillPaint = fillId != null ? _paints[fillId] : null;
    final strokePaint = strokeId != null ? _paints[strokeId] : null;
    final dx = _textPositionX;
    final dy = _textPositionY;
    final transform = _textTransform;

    if (!_isAddedDrawTextFunction) {
      _drawCommands.writeln(drawTextFunction);
      _isAddedDrawTextFunction = true;
      _usesTypedData = true;
    }

    [fillPaint, strokePaint].whereType<String>().forEach((paint) {
      _drawCommands
        ..writeln('drawText($paint,')
        ..writeln("  text: '${config.text}',")
        ..writeln(' xAnchorMultiplier: ${config.xAnchorMultiplier},')
        ..writeln(' fontWeight: ${config.fontWeight},')
        ..writeln(
            ' decorationStyle: TextDecorationStyle.values[${config.decorationStyle}],')
        ..writeln(' dx: ${shortDouble(dx)},')
        ..writeln(' dy: ${shortDouble(dy)},')
        ..write(config.fontFamily != null
            ? " fontFamily: '${config.fontFamily},'"
            : '')
        ..writeln(' fontSize:  ${shortDouble(config.fontSize)},')
        ..writeln(' decoration:${config.decoration},')
        ..writeln(
            ' decorationColor: ${_colorToCode(config.decorationColor.value)},')
        ..write(transform != null
            ? 'transform: Float64List.fromList(${transform.map(shortDouble).toList()}),'
            : '')
        ..writeln(');')
        ..writeln('');
    });

    _drawCommands.writeln(
        'accumulatedTextWidth = accumulatedTextWidth + paragraphWidth;\n');
  }

  @override
  void onImage(
    int imageId,
    int format,
    Uint8List data, {
    VectorGraphicsErrorListener? onError,
  }) {
    // Not implemented as per request.
  }

  @override
  void onDrawImage(
    int imageId,
    double x,
    double y,
    double width,
    double height,
    Float64List? transform,
  ) {
    throw const NotSupportedException('Image drawing is not supported.');
  }
}

class _TextPosition {
  const _TextPosition(
    this.x,
    this.y,
    this.dx,
    this.dy,
    // ignore: avoid_positional_boolean_parameters
    this.reset,
    this.transform,
  );

  final double? x;
  final double? y;
  final double? dx;
  final double? dy;
  final bool reset;
  final Float64List? transform;

  @override
  String toString() =>
      'TextPosition(x: $x, y: $y, dx: $dx, dy: $dy, reset: $reset, transform: $transform)';
}

class _TextConfig {
  const _TextConfig(
    this.text,
    this.fontFamily,
    this.xAnchorMultiplier,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.decorationStyle,
    this.decorationColor,
  );

  final String text;
  final String? fontFamily;
  final double fontSize;
  final double xAnchorMultiplier;
  final int fontWeight;
  final String decoration;
  final int decorationStyle;
  final Color decorationColor;
}
