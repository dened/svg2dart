// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Circle}
/// Circle widget.
/// {@endtemplate}
class Circle extends LeafRenderObjectWidget {
  /// {@macro Circle}
  const Circle({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(128, 128);

  @override
  RenderObject createRenderObject(BuildContext context) => CircleRenderObject()
    ..width = width
    ..height = height
    ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    CircleRenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class CircleRenderObject extends RenderBox {
  CircleRenderObject();

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
    final desiredWidth = _width ?? Circle.svgSize.width;
    final desiredHeight = _height ?? Circle.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if (Circle.svgSize.width == 0 || Circle.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / Circle.svgSize.width,
      size.height / Circle.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - Circle.svgSize.width * scale) / 2;
    final dy = (size.height - Circle.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..scale(scale, scale);

    if (_colorFilter != null) {
      canvas.saveLayer(null, Paint()..colorFilter = _colorFilter);
    }

    canvas.drawPicture(_picture);

    if (_colorFilter != null) {
      canvas.restore();
    }

    canvas.restore();
  }

  static final ui.Picture _picture = () {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Circle.svgSize;

    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffff0000);
    paint0Fill.blendMode = BlendMode.srcOver;

    final path_0 = Path()
      ..moveTo(size.width * 0.5, size.height * 0)
      ..cubicTo(
        size.width * 0.776,
        size.height * 0,
        size.width * 1,
        size.height * 0.224,
        size.width * 1,
        size.height * 0.5,
      )
      ..cubicTo(
        size.width * 1,
        size.height * 0.776,
        size.width * 0.776,
        size.height * 1,
        size.width * 0.5,
        size.height * 1,
      )
      ..cubicTo(
        size.width * 0.224,
        size.height * 1,
        size.width * 0,
        size.height * 0.776,
        size.width * 0,
        size.height * 0.5,
      )
      ..cubicTo(
        size.width * 0,
        size.height * 0.224,
        size.width * 0.224,
        size.height * 0,
        size.width * 0.5,
        size.height * 0,
      )
      ..close();

    canvas.drawPath(path_0, paint0Fill);

    return recorder.endRecording();
  }();
}
