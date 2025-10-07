import 'dart:math';

import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template MaskSvg}
/// MaskSvg widget.
/// {@endtemplate}
class MaskSvg extends LeafRenderObjectWidget {
  /// {@macro MaskSvg}
  const MaskSvg({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(200, 200);

  @override
  RenderObject createRenderObject(BuildContext context) => MaskSvgRenderObject()
    ..width = width
    ..height = height
    ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    MaskSvgRenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class MaskSvgRenderObject extends RenderBox {
  MaskSvgRenderObject();

  final _painter = _MaskSvgPainter();

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
    final desiredWidth = _width ?? MaskSvg.svgSize.width;
    final desiredHeight = _height ?? MaskSvg.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if (MaskSvg.svgSize.width == 0 || MaskSvg.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / MaskSvg.svgSize.width,
      size.height / MaskSvg.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - MaskSvg.svgSize.width * scale) / 2;
    final dy = (size.height - MaskSvg.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale, scale);

    canvas.drawPicture(_painter.getPicture(_colorFilter));

    canvas.restore();
  }
}

class _MaskSvgPainter {
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

    final shader0 = ui.Gradient.linear(
      const Offset(0, 0),
      const Offset(200, 0),
      [const Color(0xff000000), const Color(0xffffffff)],
      [0.0, 1.0],
      ui.TileMode.clamp,
    );
    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff000000);
    paint0Fill.colorFilter = _colorFilter;
    paint0Fill.blendMode = BlendMode.srcOver;

    final paint1Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff0000ff);
    paint1Fill.colorFilter = _colorFilter;
    paint1Fill.blendMode = BlendMode.srcOver;

    final paint2Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint2Fill.shader = shader0;
    paint2Fill.colorFilter = _colorFilter;
    paint2Fill.blendMode = BlendMode.srcOver;

    final path_0 = Path()
      ..moveTo(100, 10)
      ..cubicTo(149.6723, 10, 190, 50.3276, 190, 100)
      ..cubicTo(190, 149.6723, 149.6723, 190, 100, 190)
      ..cubicTo(50.3276, 190, 10, 149.6723, 10, 100)
      ..cubicTo(10, 50.3276, 50.3276, 10, 100, 10)
      ..close();

    final path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(200, 0)
      ..lineTo(200, 200)
      ..lineTo(0, 200)
      ..close();

    canvas.saveLayer(null, paint0Fill);
    canvas.drawPath(path_0, paint1Fill);
    canvas.saveLayer(
      null,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..colorFilter = const ColorFilter.matrix(<double>[
          0, 0, 0, 0, 0, //
          0, 0, 0, 0, 0,
          0, 0, 0, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
        ]),
    );
    canvas.drawPath(path_1, paint2Fill);
    canvas.restore();
    canvas.restore();

    _picture = recorder.endRecording();
  }
}
