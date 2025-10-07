import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template TextSvg}
/// TextSvg widget.
/// {@endtemplate}
class TextSvg extends LeafRenderObjectWidget {
  /// {@macro TextSvg}
  const TextSvg({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(210, 125);

  @override
  RenderObject createRenderObject(BuildContext context) => TextSvgRenderObject()
    ..width = width
    ..height = height
    ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    TextSvgRenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class TextSvgRenderObject extends RenderBox {
  TextSvgRenderObject();

  final _painter = _TextSvgPainter();

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
    final desiredWidth = _width ?? TextSvg.svgSize.width;
    final desiredHeight = _height ?? TextSvg.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if (TextSvg.svgSize.width == 0 || TextSvg.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / TextSvg.svgSize.width,
      size.height / TextSvg.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - TextSvg.svgSize.width * scale) / 2;
    final dy = (size.height - TextSvg.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale, scale);

    canvas.drawPicture(_painter.getPicture(_colorFilter));

    canvas.restore();
  }
}

class _TextSvgPainter {
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

    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffff0000);
    paint0Fill.colorFilter = _colorFilter;
    paint0Fill.blendMode = BlendMode.srcOver;

    final paint1Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffffc0cb);
    paint1Fill.colorFilter = _colorFilter;
    paint1Fill.blendMode = BlendMode.srcOver;

    final paint2Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint2Stroke.color = const Color(0xff008000);
    paint2Stroke.colorFilter = _colorFilter;
    paint2Stroke.strokeWidth = 1;
    paint2Stroke.blendMode = BlendMode.srcOver;

    final paint3Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff0000ff);
    paint3Fill.colorFilter = _colorFilter;
    paint3Fill.blendMode = BlendMode.srcOver;

    final paint4Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xff000000);
    paint4Fill.colorFilter = _colorFilter;
    paint4Fill.blendMode = BlendMode.srcOver;

    final paint5Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint5Stroke.color = const Color(0xffffff00);
    paint5Stroke.colorFilter = _colorFilter;
    paint5Stroke.strokeWidth = 1;
    paint5Stroke.blendMode = BlendMode.srcOver;

    double accumulatedTextWidth = 0;

    double paragraphWidth = 0;

    accumulatedTextWidth = 0;

    void drawText(
      Paint paint, {
      required String text,
      required double xAnchorMultiplier,
      required int fontWeight,
      required TextDecorationStyle decorationStyle,
      required double dx,
      required double dy,
      String? fontFamily,
      double? fontSize,
      TextDecoration? decoration,
      Color? decorationColor,
      Float64List? transform,
    }) {
      final paragraphBuilder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
        ),
      );
      paragraphBuilder.pushStyle(
        ui.TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.values[fontWeight],
          decoration: decoration,
          decorationStyle: decorationStyle,
          decorationColor: decorationColor,
        ),
      );
      paragraphBuilder.pushStyle(ui.TextStyle(foreground: paint));
      paragraphBuilder.addText(text);
      final paragraph = paragraphBuilder.build();
      paragraph.layout(const ui.ParagraphConstraints(width: double.infinity));
      paragraphWidth = paragraph.maxIntrinsicWidth;

      if (transform != null) {
        canvas.save();
        canvas.transform(transform);
      }
      canvas.drawParagraph(
        paragraph,
        Offset(
          dx +
              accumulatedTextWidth -
              paragraph.maxIntrinsicWidth * xAnchorMultiplier,
          dy - paragraph.alphabeticBaseline,
        ),
      );
      if (transform != null) canvas.restore();
    }

    drawText(
      paint0Fill,
      text: 'I Love',
      xAnchorMultiplier: 0.0,
      fontWeight: 3,
      decorationStyle: TextDecorationStyle.values[0],
      dx: 5,
      dy: 30,
      fontSize: 35,
      decoration: TextDecoration.combine([]),
      decorationColor: const Color(0xff000000),
      transform: Float64List.fromList([
        0.866,
        0.5,
        0,
        0,
        -0.5,
        0.866,
        0,
        0,
        0,
        0,
        1,
        0,
        22.6795,
        -4.641,
        0,
        1,
      ]),
    );

    accumulatedTextWidth = accumulatedTextWidth + paragraphWidth;

    drawText(
      paint1Fill,
      text: ' SVG',
      xAnchorMultiplier: 0.0,
      fontWeight: 3,
      decorationStyle: TextDecorationStyle.values[0],
      dx: 5,
      dy: 30,
      fontSize: 35,
      decoration: TextDecoration.combine([]),
      decorationColor: const Color(0xff000000),
      transform: Float64List.fromList([
        0.866,
        0.5,
        0,
        0,
        -0.5,
        0.866,
        0,
        0,
        0,
        0,
        1,
        0,
        22.6795,
        -4.641,
        0,
        1,
      ]),
    );

    drawText(
      paint2Stroke,
      text: ' SVG',
      xAnchorMultiplier: 0.0,
      fontWeight: 3,
      decorationStyle: TextDecorationStyle.values[0],
      dx: 5,
      dy: 30,
      fontSize: 35,
      decoration: TextDecoration.combine([]),
      decorationColor: const Color(0xff000000),
      transform: Float64List.fromList([
        0.866,
        0.5,
        0,
        0,
        -0.5,
        0.866,
        0,
        0,
        0,
        0,
        1,
        0,
        22.6795,
        -4.641,
        0,
        1,
      ]),
    );

    accumulatedTextWidth = accumulatedTextWidth + paragraphWidth;

    drawText(
      paint0Fill,
      text: ' !',
      xAnchorMultiplier: 0.0,
      fontWeight: 3,
      decorationStyle: TextDecorationStyle.values[0],
      dx: 5,
      dy: 30,
      fontSize: 35,
      decoration: TextDecoration.combine([]),
      decorationColor: const Color(0xff000000),
      transform: Float64List.fromList([
        0.866,
        0.5,
        0,
        0,
        -0.5,
        0.866,
        0,
        0,
        0,
        0,
        1,
        0,
        22.6795,
        -4.641,
        0,
        1,
      ]),
    );

    accumulatedTextWidth = accumulatedTextWidth + paragraphWidth;

    accumulatedTextWidth = 0;

    drawText(
      paint3Fill,
      text: 'I Love',
      xAnchorMultiplier: 0.0,
      fontWeight: 3,
      decorationStyle: TextDecorationStyle.values[0],
      dx: 5,
      dy: 60,
      fontSize: 35,
      decoration: TextDecoration.combine([]),
      decorationColor: const Color(0xff000000),
    );

    accumulatedTextWidth = accumulatedTextWidth + paragraphWidth;

    drawText(
      paint4Fill,
      text: ' SVG',
      xAnchorMultiplier: 0.0,
      fontWeight: 3,
      decorationStyle: TextDecorationStyle.values[0],
      dx: 5,
      dy: 60,
      fontSize: 35,
      decoration: TextDecoration.combine([]),
      decorationColor: const Color(0xff000000),
    );

    drawText(
      paint5Stroke,
      text: ' SVG',
      xAnchorMultiplier: 0.0,
      fontWeight: 3,
      decorationStyle: TextDecorationStyle.values[0],
      dx: 5,
      dy: 60,
      fontSize: 35,
      decoration: TextDecoration.combine([]),
      decorationColor: const Color(0xff000000),
    );

    accumulatedTextWidth = accumulatedTextWidth + paragraphWidth;

    drawText(
      paint3Fill,
      text: ' !',
      xAnchorMultiplier: 0.0,
      fontWeight: 3,
      decorationStyle: TextDecorationStyle.values[0],
      dx: 5,
      dy: 60,
      fontSize: 35,
      decoration: TextDecoration.combine([]),
      decorationColor: const Color(0xff000000),
    );

    accumulatedTextWidth = accumulatedTextWidth + paragraphWidth;

    _picture = recorder.endRecording();
  }
}
