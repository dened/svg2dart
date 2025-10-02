// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Circle$SVG}
/// Circle$SVG widget.
/// {@endtemplate}
class Circle$SVG extends LeafRenderObjectWidget {
  /// {@macro Circle$SVG}
  const Circle$SVG({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(24, 24);

  @override
  RenderObject createRenderObject(BuildContext context) =>
      Circle$SVGRenderObject()
        ..width = width
        ..height = height
        ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    Circle$SVGRenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class Circle$SVGRenderObject extends RenderBox {
  Circle$SVGRenderObject();

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
    final desiredWidth = _width ?? Circle$SVG.svgSize.width;
    final desiredHeight = _height ?? Circle$SVG.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if (Circle$SVG.svgSize.width == 0 || Circle$SVG.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / Circle$SVG.svgSize.width,
      size.height / Circle$SVG.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - Circle$SVG.svgSize.width * scale) / 2;
    final dy = (size.height - Circle$SVG.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale, scale);

    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff0000ff);
    paint0Fill.colorFilter = _colorFilter;
    paint0Fill.blendMode = BlendMode.srcOver;

    final path_0 = Path()
      ..moveTo(12, 2)
      ..cubicTo(17.5191, 2, 22, 6.4808, 22, 12)
      ..cubicTo(22, 17.5191, 17.5191, 22, 12, 22)
      ..cubicTo(6.4808, 22, 2, 17.5191, 2, 12)
      ..cubicTo(2, 6.4808, 6.4808, 2, 12, 2)
      ..close();

    canvas.drawPath(path_0, paint0Fill);

    canvas.restore();
  }
}
