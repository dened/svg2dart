import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template GradientSvg}
/// GradientSvg widget.
/// {@endtemplate}
class GradientSvg extends LeafRenderObjectWidget {
  /// {@macro GradientSvg}
  const GradientSvg({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(400, 150);

  @override
  RenderObject createRenderObject(BuildContext context) =>
      GradientSvgRenderObject()
        ..width = width
        ..height = height
        ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    GradientSvgRenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class GradientSvgRenderObject extends RenderBox {
  GradientSvgRenderObject();

  final _painter = _GradientSvgPainter();

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
    final desiredWidth = _width ?? GradientSvg.svgSize.width;
    final desiredHeight = _height ?? GradientSvg.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if (GradientSvg.svgSize.width == 0 || GradientSvg.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / GradientSvg.svgSize.width,
      size.height / GradientSvg.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - GradientSvg.svgSize.width * scale) / 2;
    final dy = (size.height - GradientSvg.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale, scale);

    canvas.drawPicture(_painter.getPicture(_colorFilter));

    canvas.restore();
  }
}

class _GradientSvgPainter {
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

    final shader0 = ui.Gradient.radial(
      const Offset(0.25, 0.25),
      0.5,
      [const Color(0xffff0000), const Color(0xff0000ff)],
      [0.0, 1.0],
      ui.TileMode.repeated,
      Float64List.fromList([
        170.0,
        0.0,
        0.0,
        0.0,
        0.0,
        110.0,
        0.0,
        0.0,
        0.0,
        0.0,
        170.0,
        0.0,
        15.0,
        15.0,
        0.0,
        1.0,
      ]),
      null,
      0.0,
    );
    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint0Fill.shader = shader0;
    paint0Fill.colorFilter = _colorFilter;
    paint0Fill.blendMode = BlendMode.srcOver;

    final path_0 = Path()
      ..moveTo(100, 15)
      ..cubicTo(146.9128, 15, 185, 39.6447, 185, 70)
      ..cubicTo(185, 100.3553, 146.9128, 125, 100, 125)
      ..cubicTo(53.0872, 125, 15, 100.3553, 15, 70)
      ..cubicTo(15, 39.6447, 53.0872, 15, 100, 15)
      ..close();

    canvas.drawPath(path_0, paint0Fill);

    _picture = recorder.endRecording();
  }
}
