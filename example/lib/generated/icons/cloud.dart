// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Cloud}
/// Cloud widget.
/// {@endtemplate}
class Cloud extends LeafRenderObjectWidget {
  /// {@macro Cloud}
  const Cloud({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(463.8343, 463);

  @override
  RenderObject createRenderObject(BuildContext context) => CloudRenderObject()
    ..width = width
    ..height = height
    ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    CloudRenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class CloudRenderObject extends RenderBox {
  CloudRenderObject();

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
    final desiredWidth = _width ?? Cloud.svgSize.width;
    final desiredHeight = _height ?? Cloud.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if (Cloud.svgSize.width == 0 || Cloud.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / Cloud.svgSize.width,
      size.height / Cloud.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - Cloud.svgSize.width * scale) / 2;
    final dy = (size.height - Cloud.svgSize.height * scale) / 2;

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
    const size = Cloud.svgSize;

    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffa3d4f7);
    paint0Fill.blendMode = BlendMode.srcOver;

    final path_0 = Path()
      ..moveTo(size.width * 0.8103, size.height * 0.4319)
      ..cubicTo(
        size.width * 0.7977,
        size.height * 0.4319,
        size.width * 0.7851,
        size.height * 0.4331,
        size.width * 0.7727,
        size.height * 0.4356,
      )
      ..cubicTo(
        size.width * 0.7634,
        size.height * 0.389,
        size.width * 0.7332,
        size.height * 0.3493,
        size.width * 0.6909,
        size.height * 0.3277,
      )
      ..cubicTo(
        size.width * 0.6486,
        size.height * 0.3062,
        size.width * 0.5988,
        size.height * 0.3053,
        size.width * 0.5557,
        size.height * 0.3253,
      )
      ..cubicTo(
        size.width * 0.5167,
        size.height * 0.2177,
        size.width * 0.3981,
        size.height * 0.1622,
        size.width * 0.2908,
        size.height * 0.2012,
      )
      ..cubicTo(
        size.width * 0.1834,
        size.height * 0.2403,
        size.width * 0.128,
        size.height * 0.3591,
        size.width * 0.1669,
        size.height * 0.4667,
      )
      ..cubicTo(
        size.width * 0.0729,
        size.height * 0.4697,
        size.width * -0.0014,
        size.height * 0.5476,
        size.width * 0,
        size.height * 0.6419,
      )
      ..cubicTo(
        size.width * 0.0014,
        size.height * 0.7361,
        size.width * 0.078,
        size.height * 0.8119,
        size.width * 0.1721,
        size.height * 0.812,
      )
      ..lineTo(size.width * 0.8103, size.height * 0.812)
      ..cubicTo(
        size.width * 0.9151,
        size.height * 0.812,
        size.width * 1,
        size.height * 0.7269,
        size.width * 1,
        size.height * 0.6219,
      )
      ..cubicTo(
        size.width * 1,
        size.height * 0.517,
        size.width * 0.9151,
        size.height * 0.4319,
        size.width * 0.8103,
        size.height * 0.4319,
      )
      ..close()
      ..moveTo(size.width * 0.8103, size.height * 0.4319);

    canvas.drawPath(path_0, paint0Fill);

    return recorder.endRecording();
  }();
}
