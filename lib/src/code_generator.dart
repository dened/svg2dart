// ignore_for_file: lines_longer_than_80_chars

import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:vector_graphics_codec/vector_graphics_codec.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart';

/// Определяет тип генерируемого виджета.
enum OutputClassType {
  /// Генерирует `LeafRenderObjectWidget` с предварительно записанным `ui.Picture`.
  record('record'),

  /// Генерирует `StatelessWidget`, который использует `CustomPainter`.
  customPainter('customPainter'),

  /// Генерирует `LeafRenderObjectWidget` с отрисовкой в методе `paint`.
  renderBox('renderBox');

  /// Конструктор
  const OutputClassType(this.type);

  /// Тип
  final String type;

  /// Creates a [OutputClassType] from its string representation.
  static OutputClassType fromString(String? type) {
    switch (type) {
      case 'record':
        return OutputClassType.record;
      case 'customPainter':
        return OutputClassType.customPainter;
      case 'renderBox':
        return OutputClassType.renderBox;
      default:
        return OutputClassType.record;
    }
  }
}

@internal
class CodeGenerator implements VectorGraphicsCodecListener {
  final Map<int, String> _paints = <int, String>{};
  final Map<int, String> _paths = <int, String>{};
  final Map<int, String> _shaders = <int, String>{};
  final Map<int, String> _textConfigs = <int, String>{};
  final Map<int, String> _textPositions = <int, String>{};
  final Map<int, String> _images = <int, String>{};
  bool _hasImages = false;

  final StringBuffer _definitions = StringBuffer();
  final StringBuffer _drawCommands = StringBuffer();

  static const String _grayscaleDstInPaint =
      'Paint()..blendMode = BlendMode.dstIn..colorFilter = const ColorFilter.matrix(<double>[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.2126,0.7152,0.0722,0,0,])';

  StringBuffer? _currentPathBuffer;

  /// Тип генерируемого класса.
  final OutputClassType classType;

  /// Создает экземпляр [CodeGenerator].
  CodeGenerator({this.classType = OutputClassType.record});

  Size _size = Size.zero;
  String _colorToCode(int value) =>
      'const Color(0x${(value & 0xFFFFFFFF).toRadixString(16).padLeft(8, '0')})';

  String _d(double val) {
    if (val == val.roundToDouble()) {
      return val.toInt().toString();
    }
    var s = val.toStringAsFixed(4);
    s = s.replaceAll(RegExp(r'0+$'), '');
    s = s.replaceAll(RegExp(r'\.$'), '');
    return s;
  }

  String getFileContent(String widgetName, String painterName) {
    if (_hasImages) {
      // ignore: avoid_print
      print(
        'Warning: SVG file for "$widgetName" contains an image, which is not supported. Skipping file generation.',
      );
      return '';
    }

    switch (classType) {
      case OutputClassType.record:
        return _getRecordFileContent(widgetName);
      case OutputClassType.customPainter:
        return _getCustomPainterFileContent(widgetName, painterName);
      case OutputClassType.renderBox:
        return _getRenderBoxFileContent(widgetName);
    }
  }

  String _getRecordFileContent(String widgetName) {
    final buffer = StringBuffer()..writeln('''
// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';


/// {@template $widgetName}
/// $widgetName widget.
/// {@endtemplate}
class $widgetName extends LeafRenderObjectWidget {
  /// {@macro $widgetName}
  const $widgetName({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(${_d(_size.width)}, ${_d(_size.height)});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      ${widgetName}RenderObject()
        ..width = width
        ..height = height
        ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    ${widgetName}RenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class ${widgetName}RenderObject extends RenderBox {
  ${widgetName}RenderObject();

  final _painter = _${widgetName}Painter();
  
  ui.ColorFilter? _colorFilter;
  double? _width;
  double? _height;

  set width(double? value) {
    if (_width == value) {
      return;
    }
    _width = value;
    markNeedsLayout();
  }

  set height(double? value) {
    if (_height == value) {
      return;
    }
    _height = value;
    markNeedsLayout();
  }

  set colorFilter(ui.ColorFilter? value) {
    if (_colorFilter == value) {
      return;
    }
    _colorFilter = value;
    markNeedsPaint();
  }

  double _scale = 1.0;

  @override
  bool get isRepaintBoundary => false;

  @override
  bool get sizedByParent => false;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = _width ?? $widgetName.svgSize.width;
    final desiredHeight = _height ?? $widgetName.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if ($widgetName.svgSize.width == 0 || $widgetName.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / $widgetName.svgSize.width,
      size.height / $widgetName.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - $widgetName.svgSize.width * scale) / 2;
    final dy = (size.height - $widgetName.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale, scale);

    canvas.drawPicture(_painter.getPicture(_colorFilter));

    canvas.restore();
  }
}

class _${widgetName}Painter {
  ui.Picture? _picture;
  ui.ColorFilter? _colorFilter;

  ui.Picture getPicture(ui.ColorFilter? newColorFilter) {
    if (_picture == null || _colorFilter != newColorFilter) {
      _colorFilter = newColorFilter;
      _createPicture();
    }
    return _picture!;
  }

  void _createPicture() {
    _picture?.dispose();
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    ${_definitions.toString()}
    ${_drawCommands.toString()}
     _picture = recorder.endRecording();
  }
}
''');

    return buffer.toString();
  }

  String _getRenderBoxFileContent(String widgetName) {
    final buffer = StringBuffer()..writeln('''
// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

/// {@template $widgetName}
/// $widgetName widget.
/// {@endtemplate}
class $widgetName extends LeafRenderObjectWidget {
  /// {@macro $widgetName}
  const $widgetName({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(${_d(_size.width)}, ${_d(_size.height)});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      ${widgetName}RenderObject()
        ..width = width
        ..height = height
        ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    ${widgetName}RenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class ${widgetName}RenderObject extends RenderBox {
  ${widgetName}RenderObject();

  ui.ColorFilter? _colorFilter;
  double? _width;
  double? _height;

  set width(double? value) {
    if (_width == value) {
      return;
    }
    _width = value;
    markNeedsLayout();
  }

  set height(double? value) {
    if (_height == value) {
      return;
    }
    _height = value;
    markNeedsLayout();
  }

  set colorFilter(ui.ColorFilter? value) {
    if (_colorFilter == value) {
      return;
    }
    _colorFilter = value;
    markNeedsPaint();
  }

  double _scale = 1.0;

  @override
  bool get isRepaintBoundary => false;

  @override
  bool get sizedByParent => false;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = _width ?? $widgetName.svgSize.width;
    final desiredHeight = _height ?? $widgetName.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if ($widgetName.svgSize.width == 0 || $widgetName.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / $widgetName.svgSize.width,
      size.height / $widgetName.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - $widgetName.svgSize.width * scale) / 2;
    final dy = (size.height - $widgetName.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale, scale);

${_definitions.toString().replaceAll('const size = $widgetName.svgSize;', 'final size = $widgetName.svgSize;')}
${_drawCommands.toString()}

    canvas.restore();
  }
}
''');
    return buffer.toString();
  }

  String _getCustomPainterFileContent(String widgetName, String painterName) {
    final buffer = StringBuffer()..writeln('''
// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

/// {@template $widgetName}
/// $widgetName widget.
/// {@endtemplate}
class $widgetName extends StatelessWidget {
  /// {@macro $widgetName}
  const $widgetName({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(${_d(_size.width)}, ${_d(_size.height)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: $painterName(colorFilter: colorFilter),
        size: svgSize,
      ),
    );
  }
}

/// {@template $painterName}
/// Custom painter for [$widgetName].
/// {@endtemplate}
class $painterName extends CustomPainter {
  /// {@macro $painterName}
  const $painterName({ui.ColorFilter? colorFilter}):_colorFilter = colorFilter;

  final ui.ColorFilter? _colorFilter;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = min(
      size.width / $widgetName.svgSize.width,
      size.height / $widgetName.svgSize.height,
    );

    canvas.save();
    final dx = (size.width - $widgetName.svgSize.width * scale) / 2;
    final dy = (size.height - $widgetName.svgSize.height * scale) / 2;
    canvas
      ..translate(dx, dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale);

${_definitions.toString()}
${_drawCommands.toString()}

    canvas.restore();
  }

  @override
  bool shouldRepaint($painterName oldDelegate) => oldDelegate._colorFilter != _colorFilter;
}''');
    return buffer.toString();
  }

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
      ..write('    final $paintVar = Paint()..isAntiAlias = true')
      ..writeln(
          '..style = PaintingStyle.${paintStyle == 0 ? 'fill' : 'stroke'};');
    if (shaderId != null && _shaders.containsKey(shaderId)) {
      _definitions.writeln('    $paintVar.shader = ${_shaders[shaderId]};');
    } else {
      _definitions.writeln('    $paintVar.color = ${_colorToCode(color)};');
    }

    _definitions.writeln('$paintVar.colorFilter = _colorFilter;');

    if (paintStyle == 1) {
      // Stroke
      // SVG's default stroke width is 1.0. Flutter's default is 0.0.
      if (strokeWidth != null && strokeWidth != 0.0) {
        _definitions.writeln('    $paintVar.strokeWidth = ${_d(strokeWidth)};');
      }
      if (strokeCap != null && strokeCap != 0) {
        _definitions.writeln(
          '    $paintVar.strokeCap = StrokeCap.${StrokeCap.values[strokeCap].name};',
        );
      }
      if (strokeJoin != null && strokeJoin != 0) {
        _definitions.writeln(
          '    $paintVar.strokeJoin = StrokeJoin.${StrokeJoin.values[strokeJoin].name};',
        );
      }
      if (strokeMiterLimit != null && strokeMiterLimit != 4.0) {
        _definitions.writeln(
          '    $paintVar.strokeMiterLimit = ${_d(strokeMiterLimit)};',
        );
      }
    }
    if (blendMode != 0) {
      _definitions.writeln(
        '    $paintVar.blendMode = BlendMode.${BlendMode.values[blendMode].name};',
      );
    }
    _definitions.writeln();
  }

  @override
  void onPathStart(int id, int fillType) {
    final pathVar = 'path_$id';
    _paths[id] = pathVar;
    _currentPathBuffer = StringBuffer('    final $pathVar = Path()');
    if (fillType != 0) {
      _currentPathBuffer!.write('..fillType = PathFillType.values[$fillType]');
    }
  }

  @override
  void onPathMoveTo(double x, double y) =>
      _currentPathBuffer!.write('..moveTo(${_d(x)}, ${_d(y)})');

  @override
  void onPathLineTo(double x, double y) =>
      _currentPathBuffer!.write('..lineTo(${_d(x)}, ${_d(y)})');

  @override
  void onPathCubicTo(
          double x1, double y1, double x2, double y2, double x3, double y3) =>
      _currentPathBuffer!.write('..cubicTo('
          '${_d(x1)}, '
          '${_d(y1)}, '
          '${_d(x2)}, '
          '${_d(y2)}, '
          '${_d(x3)}, '
          '${_d(y3)})');

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
    _drawCommands.writeln('    canvas.drawPath($pathVar, $paintVar);');
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
      ..writeln('    final $shaderVar = ui.Gradient.linear(')
      ..writeln('      const Offset(${_d(fromX)}, ${_d(fromY)}),')
      ..writeln('      const Offset(${_d(toX)}, ${_d(toY)}),')
      ..writeln('      [$colorsList],')
      ..writeln('      $offsetsList,')
      ..writeln('      ui.TileMode.${TileMode.values[tileMode].name},')
      ..writeln('    );');
  }

  @override
  void onClipPath(int pathId) {
    _drawCommands
      ..writeln('    canvas.save();')
      ..writeln('    canvas.clipPath(${_paths[pathId]});');
  }

  @override
  void onMask() {
    _drawCommands.writeln('    canvas.saveLayer(null, $_grayscaleDstInPaint);');
  }

  @override
  void onPatternStart(
    int patternId,
    double x,
    double y,
    double width,
    double height,
    Float64List transform,
  ) {}

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
    final shaderVar = 'shader$id';
    _shaders[id] = shaderVar;
    final colorsList = colors.map(_colorToCode).join(', ');
    final offsetsList =
        offsets?.isNotEmpty ?? false ? '[${offsets!.join(', ')}]' : 'null';
    final transformList = transform != null
        ? 'Float64List.fromList(${transform.toList()})'
        : 'null';

    _definitions
      ..writeln('    final $shaderVar = ui.Gradient.radial(')
      ..writeln('      const Offset(${_d(centerX)}, ${_d(centerY)}),')
      ..writeln('      ${_d(radius)},')
      ..writeln('      [$colorsList],')
      ..writeln('      $offsetsList,')
      ..writeln('      ui.TileMode.${TileMode.values[tileMode].name},')
      ..writeln('      $transformList,')
      ..writeln(
          '      ${focalX != null ? 'const Offset(${_d(focalX)}, ${_d(focalY!)})' : 'null'},')
      ..writeln('      0.0,')
      ..writeln('    );');
  }

  @override
  void onRestoreLayer() {
    _drawCommands.writeln('    canvas.restore();');
  }

  @override
  void onSaveLayer(int paintId) {
    _drawCommands.writeln('    canvas.saveLayer(null, ${_paints[paintId]!});');
  }

  @override
  void onDrawVertices(Float32List vertices, Uint16List? indices, int? paintId) {
    final verticesVar = 'vertices${_drawCommands.length}';
    final indicesList =
        indices == null ? 'null' : 'Uint16List.fromList(${indices.toString()})';
    _definitions.writeln(
      '    final $verticesVar = ui.Vertices.raw(ui.VertexMode.triangles, Float32List.fromList(${vertices.toString()}), indices: $indicesList);',
    );

    final paintVar = _paints[paintId]!;
    _drawCommands.writeln(
      '    canvas.drawVertices($verticesVar, BlendMode.srcOver, $paintVar);',
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
    final configVar = 'textConfig$id';
    _textConfigs[id] = configVar;
    _definitions
      ..writeln('    final $configVar = _TextConfig(')
      ..writeln("      '${text.replaceAll("'", r"\'")}',")
      ..writeln(
          "      ${fontFamily == null ? 'null' : "'$fontFamily'"},") // ignore: unnecessary_string_escapes
      ..writeln('      ${_d(xAnchorMultiplier)},')
      ..writeln('      FontWeight.values[$fontWeight],')
      ..writeln('      ${_d(fontSize)},')
      ..writeln('      $decoration,')
      ..writeln('      $decorationStyle,')
      ..writeln('      ${_colorToCode(decorationColor)},')
      ..writeln('    );');
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
    final positionVar = 'textPosition$id';
    _textPositions[id] = positionVar;
    final transformList = transform == null
        ? 'null'
        : 'Float64List.fromList(${transform.toString()})';
    _definitions.writeln(
        '    const $positionVar = _TextPosition(${x == null ? 'null' : _d(x)}, ${y == null ? 'null' : _d(y)}, ${dx == null ? 'null' : _d(dx)}, ${dy == null ? 'null' : _d(dy)}, $reset, $transformList);');
  }

  @override
  void onUpdateTextPosition(int id) {
    // This logic is executed at generation time to track text position.
    final positionVar = _textPositions[id];
    _drawCommands
      ..writeln('    // onUpdateTextPosition($id)')
      ..writeln(
        '    if ($positionVar.reset) { accumulatedTextPositionX = 0.0; textPositionY = 0.0; }',
      )
      ..writeln(
        '    if ($positionVar.x != null) { accumulatedTextPositionX = $positionVar.x!; }',
      )
      ..writeln(
        '    if ($positionVar.y != null) { textPositionY = $positionVar.y!; }',
      )
      ..writeln(
        '    if ($positionVar.dx != null) { accumulatedTextPositionX = (accumulatedTextPositionX ?? 0.0) + $positionVar.dx!; }',
      )
      ..writeln(
        '    if ($positionVar.dy != null) { textPositionY = textPositionY + $positionVar.dy!; }',
      );
  }

  @override
  void onDrawText(int textId, int? fillId, int? strokeId, int? patternId) {
    final fillPaint = fillId != null ? _paints[fillId] : 'null';
    final textConfig = _textConfigs[textId];

    _drawCommands
      ..writeln('    // Draw text')
      ..writeln('    {')
      ..writeln(
        '     final paragraph = _buildParagraph($textConfig, $fillPaint);',
      )
      ..writeln('      final dx = accumulatedTextPositionX ?? 0;')
      ..writeln('      final dy = textPositionY;')
      ..writeln(
        '      canvas.drawParagraph(paragraph, Offset(dx - paragraph.maxIntrinsicWidth * $textConfig.xAnchorMultiplier, dy - paragraph.alphabeticBaseline));',
      )
      ..writeln(
        '      accumulatedTextPositionX = dx + paragraph.maxIntrinsicWidth;',
      )
      ..writeln('      paragraph.dispose();')
      ..writeln('    }');
  }

  @override
  void onImage(
    int imageId,
    int format,
    Uint8List data, {
    VectorGraphicsErrorListener? onError,
  }) {
    _hasImages = true;
    _images[imageId] = 'imageData$imageId';
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
    // Not implemented as per request.
  }

  void onPatternFinished() {
    // Not implemented
  }

  void onTextLayout(double width, List<double> positions) {
    // Not implemented
  }
}

@internal
class Size {
  final double width;
  final double height;

  const Size(this.width, this.height);

  static const Size zero = Size(0, 0);
}
