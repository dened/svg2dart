// ignore_for_file: lines_longer_than_80_chars

import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:vector_graphics_codec/vector_graphics_codec.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart';

@internal
class CustomPainterGenerator implements VectorGraphicsCodecListener {
  final StringBuffer _definitions = StringBuffer();
  final StringBuffer _drawCommands = StringBuffer();

  final Map<int, String> _paints = <int, String>{};
  final Map<int, String> _paths = <int, String>{};
  final Map<int, String> _shaders = <int, String>{};
  final Map<int, String> _textConfigs = <int, String>{};
  final Map<int, String> _textPositions = <int, String>{};
  final Map<int, String> _images = <int, String>{};

  // Paint по умолчанию, если у пути нет своего стиля.
  static const String _emptyPaint = 'Paint()';

  // Paint для маски, аналогично FlutterVectorGraphicsListener
  static const String _grayscaleDstInPaint =
      'Paint()..blendMode = BlendMode.dstIn..colorFilter = const ColorFilter.matrix(<double>[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.2126,0.7152,0.0722,0,0,])';

  StringBuffer? _currentPathBuffer;

  Size _size = Size.zero;

  String _colorToCode(int value) =>
      'const Color(0x${(value & 0xFFFFFFFF).toRadixString(16).padLeft(8, '0')})';

  bool get _hasImages => _images.isNotEmpty;

  String getFileContent(String widgetName, String painterName) {
    final buffer = StringBuffer();
    final hasText = _textConfigs.isNotEmpty;

    buffer.writeln('''
// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
''');

    if (_hasImages) {
      buffer.writeln('''
/// {@template $widgetName}
/// $widgetName widget.
/// {@endtemplate}
class $widgetName extends StatefulWidget {
  /// {@macro $widgetName}
  const $widgetName({
    super.key,
    this.width,
    this.height,
  });
  
  final double? width;
  final double? height;

  @override
  State<$widgetName> createState() => _${widgetName}State();
}

class _${widgetName}State extends State<$widgetName> {
  final Map<int, ui.Image> _images = <int, ui.Image>{};
  bool _imagesLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    ${_images.entries.map((e) => '    await _loadImage(${e.key}, ${e.value});').join('\n')}
    setState(() {
      _imagesLoaded = true;
    });
  }

  Future<void> _loadImage(int id, List<int> data) async {
    final codec = await ui.instantiateImageCodec(Uint8List.fromList(data));
    final frame = await codec.getNextFrame();
    _images[id] = frame.image;
  }

  @override
  Widget build(BuildContext context) {
    if (!_imagesLoaded) {
      return SizedBox(
        width: widget.width ?? ${_size.width},
        height: widget.height ?? ${_size.height},
      );
    }
    return CustomPaint(
      size: Size(widget.width ?? ${_size.width}, widget.height ?? ${_size.height}),
      painter: $painterName(images: _images),
    );
  }
}
''');
    } else {
      buffer.writeln('''
/// {@template $widgetName}
/// $widgetName widget.
/// {@endtemplate}
class $widgetName extends StatelessWidget {
  /// {@macro $widgetName}
  const $widgetName({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => CustomPaint(
      size: Size(width ?? ${_size.width}, height ?? ${_size.height}),
      painter: const $painterName(),
    );
}
''');
    }

    buffer
      ..writeln('''

class $painterName extends CustomPainter {
  const $painterName(${_hasImages ? '{required this.images}' : ''});

  ${_hasImages ? 'final Map<int, ui.Image> images;' : ''}

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: Implement scaling based on size.
    // The current implementation uses the original SVG size and does not scale.
    // You can use size.width and size.height to calculate a scale factor.
    // final scaleX = size.width / ${_size.width};
    // final scaleY = size.height / ${_size.height};
    // canvas.scale(scaleX, scaleY);

    ${hasText ? 'double? accumulatedTextPositionX;\n    var textPositionY = 0.0;' : ''}
''')
      ..writeln(_definitions.toString())
      ..writeln()
      ..writeln(_drawCommands.toString())
      ..writeln('''
  }

  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''');

    if (hasText) {
      buffer.writeln('''
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
  final double xAnchorMultiplier;
  final FontWeight fontWeight;
  final double fontSize;
  final int decoration;
  final int decorationStyle;
  final Color decorationColor;
}

class _TextPosition {
  const _TextPosition(this.x, this.y, this.dx, this.dy, this.reset, this.transform);

  final double? x;
  final double? y;
  final double? dx;
  final double? dy;
  final bool reset;
  final Float64List? transform;
}

ui.Paragraph _buildParagraph(_TextConfig config, Paint? paint) {
  final builder = ui.ParagraphBuilder(ui.ParagraphStyle(
    fontFamily: config.fontFamily,
    fontWeight: config.fontWeight,
    fontSize: config.fontSize,
  ));
  builder.pushStyle(ui.TextStyle(
    foreground: paint,
    // TODO: support decoration.
  ));
  builder.addText(config.text);
  final paragraph = builder.build();
  paragraph.layout(const ui.ParagraphConstraints(width: double.infinity));
  return paragraph;
}
''');
    }

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
    _definitions.writeln(
      '    final $paintVar = Paint()..isAntiAlias = true..style = PaintingStyle.${paintStyle == 0 ? 'fill' : 'stroke'};',
    );
    if (shaderId != null && _shaders.containsKey(shaderId)) {
      _definitions.writeln('    $paintVar.shader = ${_shaders[shaderId]};');
    } else {
      _definitions.writeln('    $paintVar.color = ${_colorToCode(color)};');
    }
    if (paintStyle == 1) {
      // Stroke
      // SVG's default stroke width is 1.0. Flutter's default is 0.0.
      if (strokeWidth != null && strokeWidth != 0.0) {
        _definitions.writeln('    $paintVar.strokeWidth = $strokeWidth;');
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
          '    $paintVar.strokeMiterLimit = $strokeMiterLimit;',
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
    _currentPathBuffer = StringBuffer('    var $pathVar = Path()');
    if (fillType != 0) {
      _currentPathBuffer!.write('..fillType = PathFillType.values[$fillType]');
    }
  }

  @override
  void onPathMoveTo(double x, double y) {
    _currentPathBuffer!.write('..moveTo($x, $y)');
  }

  @override
  void onPathLineTo(double x, double y) {
    _currentPathBuffer!.write('..lineTo($x, $y)');
  }

  @override
  void onPathCubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  ) {
    _currentPathBuffer!.write('..cubicTo($x1, $y1, $x2, $y2, $x3, $y3)');
  }

  @override
  void onPathClose() {
    _currentPathBuffer!.write('..close()');
  }

  @override
  void onPathFinished() {
    _currentPathBuffer!.write(';');
    _definitions.writeln(_currentPathBuffer.toString());
    _currentPathBuffer = null;
  }

  @override
  void onDrawPath(int pathId, int? paintId, int? patternId) {
    final pathVar = _paths[pathId];

    final paintVar = (paintId != null ? _paints[paintId] : null) ?? _emptyPaint;
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

    _definitions.writeln(
      '    final $shaderVar = ui.Gradient.linear(\n'
      '      const Offset($fromX, $fromY),\n'
      '      const Offset($toX, $toY),\n'
      '      [$colorsList],\n'
      '      $offsetsList,\n'
      '      ui.TileMode.${TileMode.values[tileMode].name},\n'
      '    );',
    );
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

    _definitions.writeln(
      '    final $shaderVar = ui.Gradient.radial(\n'
      '      const Offset($centerX, $centerY),\n'
      '      $radius,\n'
      '      [$colorsList],\n'
      '      $offsetsList,\n'
      '      ui.TileMode.${TileMode.values[tileMode].name},\n'
      '      $transformList,\n'
      '      ${focalX != null ? 'const Offset($focalX, $focalY)' : 'null'},\n'
      '      0.0,\n'
      '    );',
    );
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

    final paintVar = (paintId != null ? _paints[paintId] : null) ?? _emptyPaint;
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
    _definitions.writeln(
      '    final $configVar = _TextConfig(\n'
      "      '${text.replaceAll("'", r"\'")}',\n"
      "      ${fontFamily == null ? 'null' : "'$fontFamily'"},\n"
      '      $xAnchorMultiplier,\n'
      '      FontWeight.values[$fontWeight],\n'
      '      $fontSize,\n'
      '      $decoration,\n'
      '      $decorationStyle,\n'
      '      ${_colorToCode(decorationColor)},\n'
      '    );',
    );
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
      '    const $positionVar = _TextPosition($x, $y, $dx, $dy, $reset, $transformList);',
    );
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
    // Implement image handling. This is complex because image decoding is async,
    // but the paint method is sync. A common approach is to make the wrapper widget
    // stateful, load images in initState, and pass the ui.Image objects to the painter.
    _definitions.writeln(
      '    // onImage callback for imageId $imageId is not implemented.',
    );
    final imageVar = 'imageData$imageId';
    _images[imageId] = imageVar;
    _definitions.writeln('    const $imageVar = <int>[${data.join(',')}];');
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
    // See onImage. Once images are loaded, they can be drawn here.
    final imageVar = 'images[$imageId]';
    _drawCommands
      ..writeln(
        '    // onDrawImage callback for imageId $imageId is not implemented.',
      )
      ..writeln('    final image = $imageVar;')
      ..writeln('    if (image != null) {')
      ..writeln(
        '      canvas.drawImageRect(image, Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), Rect.fromLTWH($x, $y, $width, $height), Paint());',
      )
      ..writeln('    }');
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
