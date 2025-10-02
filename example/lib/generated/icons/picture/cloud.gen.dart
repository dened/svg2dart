// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Cloud$SVG}
/// Cloud$SVG widget.
/// {@endtemplate}
class Cloud$SVG extends LeafRenderObjectWidget {
  /// {@macro Cloud$SVG}
  const Cloud$SVG({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(463.8343, 463);

  @override
  RenderObject createRenderObject(BuildContext context) =>
      Cloud$SVGRenderObject()
        ..width = width
        ..height = height
        ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    Cloud$SVGRenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class Cloud$SVGRenderObject extends RenderBox {
  Cloud$SVGRenderObject();

  final _painter = _Cloud$SVGPainter();

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
    final desiredWidth = _width ?? Cloud$SVG.svgSize.width;
    final desiredHeight = _height ?? Cloud$SVG.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if (Cloud$SVG.svgSize.width == 0 || Cloud$SVG.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / Cloud$SVG.svgSize.width,
      size.height / Cloud$SVG.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - Cloud$SVG.svgSize.width * scale) / 2;
    final dy = (size.height - Cloud$SVG.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale, scale);

    canvas.drawPicture(_painter.getPicture(_colorFilter));

    canvas.restore();
  }
}

class _Cloud$SVGPainter {
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
    paint0Fill.color = const Color(0xffa3d4f7);
    paint0Fill.colorFilter = _colorFilter;
    paint0Fill.blendMode = BlendMode.srcOver;

    final path_0 = Path()
      ..moveTo(375.8359, 199.957)
      ..cubicTo(369.9844, 199.957, 364.1445, 200.5391, 358.4102, 201.6992)
      ..cubicTo(354.0859, 180.1172, 340.1055, 161.707, 320.4766, 151.7422)
      ..cubicTo(300.8516, 141.7773, 277.7383, 141.3594, 257.7617, 150.6055)
      ..cubicTo(239.6836, 100.8086, 184.6602, 75.0977, 134.8633, 93.1758)
      ..cubicTo(85.0664, 111.2539, 59.3555, 166.2813, 77.4336, 216.0742)
      ..cubicTo(33.8125, 217.4531, -0.6445, 253.5586, 0.0078, 297.1953)
      ..cubicTo(0.6641, 340.8359, 36.1914, 375.8867, 79.8359, 375.957)
      ..lineTo(375.8359, 375.957)
      ..cubicTo(424.4336, 375.957, 463.8359, 336.5586, 463.8359, 287.957)
      ..cubicTo(463.8359, 239.3555, 424.4336, 199.957, 375.8359, 199.957)
      ..close()
      ..moveTo(375.8359, 199.957);

    canvas.drawPath(path_0, paint0Fill);

    _picture = recorder.endRecording();
  }
}
