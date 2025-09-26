// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Gift}
/// Gift widget.
/// {@endtemplate}
class Gift extends LeafRenderObjectWidget {
  /// {@macro Gift}
  const Gift({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(500, 400);

  @override
  RenderObject createRenderObject(BuildContext context) => GiftRenderObject()
    ..width = width
    ..height = height
    ..colorFilter = colorFilter;

  @override
  void updateRenderObject(BuildContext context, GiftRenderObject renderObject) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class GiftRenderObject extends RenderBox {
  GiftRenderObject();

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
    final desiredWidth = _width ?? Gift.svgSize.width;
    final desiredHeight = _height ?? Gift.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if (Gift.svgSize.width == 0 || Gift.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / Gift.svgSize.width,
      size.height / Gift.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - Gift.svgSize.width * scale) / 2;
    final dy = (size.height - Gift.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..scale(scale, scale);

    if (_colorFilter != null) {
      canvas.saveLayer(null, Paint()..colorFilter = _colorFilter);
    }

    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0x1c000000);
    paint0Fill.blendMode = BlendMode.srcOver;

    final paint1Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xfff7434c);
    paint1Fill.blendMode = BlendMode.srcOver;

    final paint2Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xffdb2e37);
    paint2Fill.blendMode = BlendMode.srcOver;

    final paint3Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffffdb57);
    paint3Fill.blendMode = BlendMode.srcOver;

    final paint4Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xfff5ba3d);
    paint4Fill.blendMode = BlendMode.srcOver;

    final paint5Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffef9325);
    paint5Fill.blendMode = BlendMode.srcOver;

    final paint6Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xffff8888);
    paint6Fill.blendMode = BlendMode.srcOver;

    final paint7Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xff64d3ff);
    paint7Fill.blendMode = BlendMode.srcOver;

    final paint8Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint8Fill.color = const Color(0xffefcb5b);
    paint8Fill.blendMode = BlendMode.srcOver;

    final path_0 = Path()
      ..moveTo(size.width * 0.501, size.height * 0.9425)
      ..cubicTo(
        size.width * 0.6539,
        size.height * 0.9425,
        size.width * 0.778,
        size.height * 0.9537,
        size.width * 0.778,
        size.height * 0.9675,
      )
      ..cubicTo(
        size.width * 0.778,
        size.height * 0.9813,
        size.width * 0.6539,
        size.height * 0.9925,
        size.width * 0.501,
        size.height * 0.9925,
      )
      ..cubicTo(
        size.width * 0.3481,
        size.height * 0.9925,
        size.width * 0.224,
        size.height * 0.9813,
        size.width * 0.224,
        size.height * 0.9675,
      )
      ..cubicTo(
        size.width * 0.224,
        size.height * 0.9537,
        size.width * 0.3481,
        size.height * 0.9425,
        size.width * 0.501,
        size.height * 0.9425,
      )
      ..close();

    final path_1 = Path()
      ..moveTo(size.width * 0.7481, size.height * 0.58)
      ..lineTo(size.width * 0.2519, size.height * 0.58)
      ..cubicTo(
        size.width * 0.2467,
        size.height * 0.58,
        size.width * 0.2424,
        size.height * 0.5853,
        size.width * 0.2424,
        size.height * 0.5918,
      )
      ..lineTo(size.width * 0.2424, size.height * 0.9568)
      ..cubicTo(
        size.width * 0.2424,
        size.height * 0.9633,
        size.width * 0.2467,
        size.height * 0.9686,
        size.width * 0.2519,
        size.height * 0.9686,
      )
      ..lineTo(size.width * 0.7481, size.height * 0.9686)
      ..cubicTo(
        size.width * 0.7533,
        size.height * 0.9686,
        size.width * 0.7575,
        size.height * 0.9633,
        size.width * 0.7575,
        size.height * 0.9568,
      )
      ..lineTo(size.width * 0.7575, size.height * 0.5918)
      ..cubicTo(
        size.width * 0.7575,
        size.height * 0.5853,
        size.width * 0.7533,
        size.height * 0.58,
        size.width * 0.7481,
        size.height * 0.58,
      )
      ..close();

    final path_2 = Path()
      ..moveTo(size.width * 0.7481, size.height * 0.58)
      ..lineTo(size.width * 0.2519, size.height * 0.58)
      ..cubicTo(
        size.width * 0.2467,
        size.height * 0.58,
        size.width * 0.2424,
        size.height * 0.5853,
        size.width * 0.2424,
        size.height * 0.5918,
      )
      ..lineTo(size.width * 0.2424, size.height * 0.6388)
      ..lineTo(size.width * 0.7575, size.height * 0.6388)
      ..lineTo(size.width * 0.7575, size.height * 0.5918)
      ..cubicTo(
        size.width * 0.7575,
        size.height * 0.5853,
        size.width * 0.7533,
        size.height * 0.58,
        size.width * 0.7481,
        size.height * 0.58,
      )
      ..close();

    final path_3 = Path()
      ..moveTo(size.width * 0.5481, size.height * 0.58)
      ..lineTo(size.width * 0.4519, size.height * 0.58)
      ..cubicTo(
        size.width * 0.4467,
        size.height * 0.58,
        size.width * 0.4425,
        size.height * 0.5853,
        size.width * 0.4425,
        size.height * 0.5918,
      )
      ..lineTo(size.width * 0.4425, size.height * 0.9568)
      ..cubicTo(
        size.width * 0.4425,
        size.height * 0.9633,
        size.width * 0.4467,
        size.height * 0.9686,
        size.width * 0.4519,
        size.height * 0.9686,
      )
      ..lineTo(size.width * 0.5481, size.height * 0.9686)
      ..cubicTo(
        size.width * 0.5533,
        size.height * 0.9686,
        size.width * 0.5575,
        size.height * 0.9633,
        size.width * 0.5575,
        size.height * 0.9568,
      )
      ..lineTo(size.width * 0.5575, size.height * 0.5918)
      ..cubicTo(
        size.width * 0.5575,
        size.height * 0.5853,
        size.width * 0.5533,
        size.height * 0.58,
        size.width * 0.5481,
        size.height * 0.58,
      )
      ..close();

    final path_4 = Path()
      ..moveTo(size.width * 0.5481, size.height * 0.58)
      ..lineTo(size.width * 0.4519, size.height * 0.58)
      ..cubicTo(
        size.width * 0.4467,
        size.height * 0.58,
        size.width * 0.4425,
        size.height * 0.5853,
        size.width * 0.4425,
        size.height * 0.5918,
      )
      ..lineTo(size.width * 0.4425, size.height * 0.6386)
      ..lineTo(size.width * 0.5575, size.height * 0.6386)
      ..lineTo(size.width * 0.5575, size.height * 0.5918)
      ..cubicTo(
        size.width * 0.5575,
        size.height * 0.5853,
        size.width * 0.5533,
        size.height * 0.58,
        size.width * 0.5481,
        size.height * 0.58,
      )
      ..close();

    final path_5 = Path()
      ..moveTo(size.width * 0.7298, size.height * 0.3627)
      ..cubicTo(
        size.width * 0.7206,
        size.height * 0.3326,
        size.width * 0.706,
        size.height * 0.3033,
        size.width * 0.6909,
        size.height * 0.2842,
      )
      ..cubicTo(
        size.width * 0.6853,
        size.height * 0.2772,
        size.width * 0.6778,
        size.height * 0.2736,
        size.width * 0.6693,
        size.height * 0.2738,
      )
      ..cubicTo(
        size.width * 0.641,
        size.height * 0.2747,
        size.width * 0.595,
        size.height * 0.319,
        size.width * 0.5324,
        size.height * 0.4056,
      )
      ..cubicTo(
        size.width * 0.5309,
        size.height * 0.4077,
        size.width * 0.53,
        size.height * 0.4106,
        size.width * 0.53,
        size.height * 0.4135,
      )
      ..lineTo(size.width * 0.53, size.height * 0.4757)
      ..cubicTo(
        size.width * 0.53,
        size.height * 0.4822,
        size.width * 0.5342,
        size.height * 0.4874,
        size.width * 0.5394,
        size.height * 0.4874,
      )
      ..lineTo(size.width * 0.6842, size.height * 0.4874)
      ..cubicTo(
        size.width * 0.7165,
        size.height * 0.4874,
        size.width * 0.7298,
        size.height * 0.4678,
        size.width * 0.7353,
        size.height * 0.4514,
      )
      ..cubicTo(
        size.width * 0.7425,
        size.height * 0.4294,
        size.width * 0.7406,
        size.height * 0.398,
        size.width * 0.7298,
        size.height * 0.3627,
      )
      ..close();

    final path_6 = Path()
      ..moveTo(size.width * 0.7352, size.height * 0.3832)
      ..cubicTo(
        size.width * 0.7349,
        size.height * 0.382,
        size.width * 0.7345,
        size.height * 0.3809,
        size.width * 0.7339,
        size.height * 0.3798,
      )
      ..cubicTo(
        size.width * 0.7197,
        size.height * 0.353,
        size.width * 0.689,
        size.height * 0.363,
        size.width * 0.6658,
        size.height * 0.3762,
      )
      ..cubicTo(
        size.width * 0.5982,
        size.height * 0.4144,
        size.width * 0.5703,
        size.height * 0.4671,
        size.width * 0.5692,
        size.height * 0.4693,
      )
      ..cubicTo(
        size.width * 0.5673,
        size.height * 0.4729,
        size.width * 0.5671,
        size.height * 0.4775,
        size.width * 0.5688,
        size.height * 0.4813,
      )
      ..cubicTo(
        size.width * 0.5704,
        size.height * 0.4851,
        size.width * 0.5736,
        size.height * 0.4874,
        size.width * 0.577,
        size.height * 0.4874,
      )
      ..lineTo(size.width * 0.6841, size.height * 0.4874)
      ..cubicTo(
        size.width * 0.7047,
        size.height * 0.4874,
        size.width * 0.7199,
        size.height * 0.4796,
        size.width * 0.7294,
        size.height * 0.464,
      )
      ..cubicTo(
        size.width * 0.7407,
        size.height * 0.4456,
        size.width * 0.7427,
        size.height * 0.4176,
        size.width * 0.7352,
        size.height * 0.3832,
      )
      ..close();

    final path_7 = Path()
      ..moveTo(size.width * 0.4676, size.height * 0.4056)
      ..cubicTo(
        size.width * 0.405,
        size.height * 0.319,
        size.width * 0.359,
        size.height * 0.2747,
        size.width * 0.3307,
        size.height * 0.2739,
      )
      ..cubicTo(
        size.width * 0.3222,
        size.height * 0.2736,
        size.width * 0.3147,
        size.height * 0.2772,
        size.width * 0.3091,
        size.height * 0.2842,
      )
      ..cubicTo(
        size.width * 0.294,
        size.height * 0.3033,
        size.width * 0.2794,
        size.height * 0.3327,
        size.width * 0.2702,
        size.height * 0.3628,
      )
      ..cubicTo(
        size.width * 0.2594,
        size.height * 0.398,
        size.width * 0.2575,
        size.height * 0.4295,
        size.width * 0.2648,
        size.height * 0.4514,
      )
      ..cubicTo(
        size.width * 0.2703,
        size.height * 0.4678,
        size.width * 0.2836,
        size.height * 0.4875,
        size.width * 0.3158,
        size.height * 0.4875,
      )
      ..lineTo(size.width * 0.4606, size.height * 0.4875)
      ..cubicTo(
        size.width * 0.4658,
        size.height * 0.4875,
        size.width * 0.47,
        size.height * 0.4822,
        size.width * 0.47,
        size.height * 0.4757,
      )
      ..lineTo(size.width * 0.47, size.height * 0.4135)
      ..cubicTo(
        size.width * 0.47,
        size.height * 0.4106,
        size.width * 0.4691,
        size.height * 0.4078,
        size.width * 0.4676,
        size.height * 0.4056,
      )
      ..close();

    final path_8 = Path()
      ..moveTo(size.width * 0.4308, size.height * 0.4693)
      ..cubicTo(
        size.width * 0.4297,
        size.height * 0.4671,
        size.width * 0.4018,
        size.height * 0.4144,
        size.width * 0.3342,
        size.height * 0.3762,
      )
      ..cubicTo(
        size.width * 0.3109,
        size.height * 0.3631,
        size.width * 0.2802,
        size.height * 0.353,
        size.width * 0.266,
        size.height * 0.3799,
      )
      ..cubicTo(
        size.width * 0.2655,
        size.height * 0.3809,
        size.width * 0.2651,
        size.height * 0.3821,
        size.width * 0.2648,
        size.height * 0.3833,
      )
      ..cubicTo(
        size.width * 0.2573,
        size.height * 0.4177,
        size.width * 0.2593,
        size.height * 0.4456,
        size.width * 0.2706,
        size.height * 0.4641,
      )
      ..cubicTo(
        size.width * 0.2801,
        size.height * 0.4796,
        size.width * 0.2953,
        size.height * 0.4875,
        size.width * 0.3158,
        size.height * 0.4875,
      )
      ..lineTo(size.width * 0.4229, size.height * 0.4875)
      ..cubicTo(
        size.width * 0.4264,
        size.height * 0.4875,
        size.width * 0.4295,
        size.height * 0.4851,
        size.width * 0.4312,
        size.height * 0.4813,
      )
      ..cubicTo(
        size.width * 0.4329,
        size.height * 0.4775,
        size.width * 0.4327,
        size.height * 0.4729,
        size.width * 0.4308,
        size.height * 0.4693,
      )
      ..close();

    final path_9 = Path()
      ..moveTo(size.width * 0.5394, size.height * 0.3901)
      ..lineTo(size.width * 0.4606, size.height * 0.3901)
      ..cubicTo(
        size.width * 0.4554,
        size.height * 0.3901,
        size.width * 0.4512,
        size.height * 0.3954,
        size.width * 0.4512,
        size.height * 0.4019,
      )
      ..lineTo(size.width * 0.4512, size.height * 0.4757)
      ..cubicTo(
        size.width * 0.4512,
        size.height * 0.4822,
        size.width * 0.4554,
        size.height * 0.4875,
        size.width * 0.4606,
        size.height * 0.4875,
      )
      ..lineTo(size.width * 0.5394, size.height * 0.4875)
      ..cubicTo(
        size.width * 0.5446,
        size.height * 0.4875,
        size.width * 0.5488,
        size.height * 0.4822,
        size.width * 0.5488,
        size.height * 0.4757,
      )
      ..lineTo(size.width * 0.5488, size.height * 0.4019)
      ..cubicTo(
        size.width * 0.5488,
        size.height * 0.3953,
        size.width * 0.5446,
        size.height * 0.3901,
        size.width * 0.5394,
        size.height * 0.3901,
      )
      ..close();

    final path_10 = Path()
      ..moveTo(size.width * 0.7886, size.height * 0.464)
      ..lineTo(size.width * 0.2114, size.height * 0.464)
      ..cubicTo(
        size.width * 0.2062,
        size.height * 0.464,
        size.width * 0.202,
        size.height * 0.4692,
        size.width * 0.202,
        size.height * 0.4757,
      )
      ..lineTo(size.width * 0.202, size.height * 0.5918)
      ..cubicTo(
        size.width * 0.202,
        size.height * 0.5983,
        size.width * 0.2062,
        size.height * 0.6036,
        size.width * 0.2114,
        size.height * 0.6036,
      )
      ..lineTo(size.width * 0.7886, size.height * 0.6036)
      ..cubicTo(
        size.width * 0.7938,
        size.height * 0.6036,
        size.width * 0.798,
        size.height * 0.5983,
        size.width * 0.798,
        size.height * 0.5918,
      )
      ..lineTo(size.width * 0.798, size.height * 0.4757)
      ..cubicTo(
        size.width * 0.798,
        size.height * 0.4692,
        size.width * 0.7938,
        size.height * 0.464,
        size.width * 0.7886,
        size.height * 0.464,
      )
      ..close();

    final path_11 = Path()
      ..moveTo(size.width * 0.4277, size.height * 0.464)
      ..lineTo(size.width * 0.5723, size.height * 0.464)
      ..lineTo(size.width * 0.5723, size.height * 0.6035)
      ..lineTo(size.width * 0.4277, size.height * 0.6035)
      ..close();

    final path_12 = Path()
      ..moveTo(size.width * 0.05, size.height * 0.3837)
      ..lineTo(size.width * 0.0874, size.height * 0.3925)
      ..lineTo(size.width * 0.0617, size.height * 0.429)
      ..close();

    final path_13 = Path()
      ..moveTo(size.width * 0.3374, size.height * 0.1364)
      ..lineTo(size.width * 0.3505, size.height * 0.1698)
      ..lineTo(size.width * 0.3201, size.height * 0.1667)
      ..close();

    final path_14 = Path()
      ..moveTo(size.width * 0.4674, size.height * 0.2839)
      ..lineTo(size.width * 0.4805, size.height * 0.3173)
      ..lineTo(size.width * 0.4501, size.height * 0.3142)
      ..close();

    final path_15 = Path()
      ..moveTo(size.width * 0.1471, size.height * 0.7212)
      ..lineTo(size.width * 0.1761, size.height * 0.7298)
      ..lineTo(size.width * 0.155, size.height * 0.7571)
      ..close();

    final path_16 = Path()
      ..moveTo(size.width * 0.148, size.height * 0.8666)
      ..lineTo(size.width * 0.1788, size.height * 0.8386)
      ..lineTo(size.width * 0.1824, size.height * 0.887)
      ..close();

    final path_17 = Path()
      ..moveTo(size.width * 0.0588, size.height * 0.8027)
      ..lineTo(size.width * 0.0755, size.height * 0.7875)
      ..lineTo(size.width * 0.0774, size.height * 0.8137)
      ..close();

    final path_18 = Path()
      ..moveTo(size.width * 0.1269, size.height * 0.6094)
      ..lineTo(size.width * 0.1493, size.height * 0.616)
      ..lineTo(size.width * 0.133, size.height * 0.6371)
      ..close();

    final path_19 = Path()
      ..moveTo(size.width * 0.01, size.height * 0.6012)
      ..lineTo(size.width * 0.0474, size.height * 0.61)
      ..lineTo(size.width * 0.0217, size.height * 0.6464)
      ..close();

    final path_20 = Path()
      ..moveTo(size.width * 0.0417, size.height * 0.4869)
      ..lineTo(size.width * 0.061, size.height * 0.5026)
      ..lineTo(size.width * 0.0399, size.height * 0.5156)
      ..close();

    final path_21 = Path()
      ..moveTo(size.width * 0.1703, size.height * 0.3612)
      ..lineTo(size.width * 0.1969, size.height * 0.3827)
      ..lineTo(size.width * 0.1679, size.height * 0.4006)
      ..close();

    final path_22 = Path()
      ..moveTo(size.width * 0.1753, size.height * 0.2709)
      ..lineTo(size.width * 0.1929, size.height * 0.2852)
      ..lineTo(size.width * 0.1737, size.height * 0.297)
      ..close();

    final path_23 = Path()
      ..moveTo(size.width * 0.0835, size.height * 0.1815)
      ..lineTo(size.width * 0.1343, size.height * 0.1982)
      ..lineTo(size.width * 0.1031, size.height * 0.2425)
      ..close();

    final path_24 = Path()
      ..moveTo(size.width * 0.1983, size.height * 0.1636)
      ..lineTo(size.width * 0.2249, size.height * 0.1852)
      ..lineTo(size.width * 0.1959, size.height * 0.2031)
      ..close();

    final path_25 = Path()
      ..moveTo(size.width * 0.2583, size.height * 0.0437)
      ..lineTo(size.width * 0.2921, size.height * 0.0711)
      ..lineTo(size.width * 0.2552, size.height * 0.0939)
      ..close();

    final path_26 = Path()
      ..moveTo(size.width * 0.1525, size.height * 0.4286)
      ..lineTo(size.width * 0.1675, size.height * 0.4832)
      ..lineTo(size.width * 0.1213, size.height * 0.4712)
      ..close();

    final path_27 = Path()
      ..moveTo(size.width * 0.5104, size.height * 0.1373)
      ..lineTo(size.width * 0.5371, size.height * 0.1713)
      ..lineTo(size.width * 0.4993, size.height * 0.1828)
      ..close();

    final path_28 = Path()
      ..moveTo(size.width * 0.1168, size.height * 0.0952)
      ..lineTo(size.width * 0.1335, size.height * 0.0801)
      ..lineTo(size.width * 0.1354, size.height * 0.1062)
      ..close();

    final path_29 = Path()
      ..moveTo(size.width * 0.8969, size.height * 0.4162)
      ..lineTo(size.width * 0.8595, size.height * 0.425)
      ..lineTo(size.width * 0.8852, size.height * 0.4615)
      ..close();

    final path_30 = Path()
      ..moveTo(size.width * 0.9477, size.height * 0.5912)
      ..lineTo(size.width * 0.9188, size.height * 0.5998)
      ..lineTo(size.width * 0.9399, size.height * 0.6271)
      ..close();

    final path_31 = Path()
      ..moveTo(size.width * 0.8649, size.height * 0.8666)
      ..lineTo(size.width * 0.8341, size.height * 0.8386)
      ..lineTo(size.width * 0.8305, size.height * 0.887)
      ..close();

    final path_32 = Path()
      ..moveTo(size.width * 0.9361, size.height * 0.8077)
      ..lineTo(size.width * 0.9194, size.height * 0.7925)
      ..lineTo(size.width * 0.9175, size.height * 0.8187)
      ..close();

    final path_33 = Path()
      ..moveTo(size.width * 0.868, size.height * 0.6144)
      ..lineTo(size.width * 0.8456, size.height * 0.621)
      ..lineTo(size.width * 0.8619, size.height * 0.6421)
      ..close();

    final path_34 = Path()
      ..moveTo(size.width * 0.8789, size.height * 0.7186)
      ..lineTo(size.width * 0.8415, size.height * 0.7275)
      ..lineTo(size.width * 0.8672, size.height * 0.7639)
      ..close();

    final path_35 = Path()
      ..moveTo(size.width * 0.9532, size.height * 0.4919)
      ..lineTo(size.width * 0.9339, size.height * 0.5076)
      ..lineTo(size.width * 0.955, size.height * 0.5206)
      ..close();

    final path_36 = Path()
      ..moveTo(size.width * 0.8145, size.height * 0.3412)
      ..lineTo(size.width * 0.788, size.height * 0.3627)
      ..lineTo(size.width * 0.817, size.height * 0.3806)
      ..close();

    final path_37 = Path()
      ..moveTo(size.width * 0.8454, size.height * 0.249)
      ..lineTo(size.width * 0.8, size.height * 0.2597)
      ..lineTo(size.width * 0.8312, size.height * 0.304)
      ..close();

    final path_38 = Path()
      ..moveTo(size.width * 0.9344, size.height * 0.3261)
      ..lineTo(size.width * 0.9194, size.height * 0.3807)
      ..lineTo(size.width * 0.9656, size.height * 0.3687)
      ..close();

    final path_39 = Path()
      ..moveTo(size.width * 0.8781, size.height * 0.1002)
      ..lineTo(size.width * 0.8614, size.height * 0.0851)
      ..lineTo(size.width * 0.8595, size.height * 0.1113)
      ..close();

    final path_40 = Path()
      ..moveTo(size.width * 0.7119, size.height * 0.0578)
      ..lineTo(size.width * 0.7045, size.height * 0.1044)
      ..lineTo(size.width * 0.6755, size.height * 0.0719)
      ..close();

    final path_41 = Path()
      ..moveTo(size.width * 0.4269, size.height * 0.1908)
      ..lineTo(size.width * 0.4198, size.height * 0.227)
      ..lineTo(size.width * 0.3981, size.height * 0.2002)
      ..close();

    final path_42 = Path()
      ..moveTo(size.width * 0.2786, size.height * 0.188)
      ..lineTo(size.width * 0.3007, size.height * 0.2267)
      ..lineTo(size.width * 0.2619, size.height * 0.2307)
      ..close();

    final path_43 = Path()
      ..moveTo(size.width * 0.2906, size.height * 0.1021)
      ..lineTo(size.width * 0.3025, size.height * 0.1231)
      ..lineTo(size.width * 0.2815, size.height * 0.1252)
      ..close();

    final path_44 = Path()
      ..moveTo(size.width * 0.5565, size.height * 0.2492)
      ..lineTo(size.width * 0.551, size.height * 0.2771)
      ..lineTo(size.width * 0.5343, size.height * 0.2565)
      ..close();

    final path_45 = Path()
      ..moveTo(size.width * 0.4303, size.height * 0.0831)
      ..lineTo(size.width * 0.4229, size.height * 0.1298)
      ..lineTo(size.width * 0.3939, size.height * 0.0973)
      ..close();

    final path_46 = Path()
      ..moveTo(size.width * 0.5754, size.height * 0.0763)
      ..lineTo(size.width * 0.5627, size.height * 0.1002)
      ..lineTo(size.width * 0.5525, size.height * 0.0738)
      ..close();

    final path_47 = Path()
      ..moveTo(size.width * 0.7267, size.height * 0.1859)
      ..lineTo(size.width * 0.7092, size.height * 0.2188)
      ..lineTo(size.width * 0.6952, size.height * 0.1824)
      ..close();

    final path_48 = Path()
      ..moveTo(size.width * 0.8033, size.height * 0.159)
      ..lineTo(size.width * 0.7943, size.height * 0.2156)
      ..lineTo(size.width * 0.7592, size.height * 0.1761)
      ..close();

    final path_49 = Path()
      ..moveTo(size.width * 0.6369, size.height * 0.1928)
      ..lineTo(size.width * 0.5931, size.height * 0.2111)
      ..lineTo(size.width * 0.6031, size.height * 0.1535)
      ..close();

    final path_50 = Path()
      ..moveTo(size.width * 0.878, size.height * 0.2916)
      ..lineTo(size.width * 0.8899, size.height * 0.3126)
      ..lineTo(size.width * 0.8689, size.height * 0.3147)
      ..close();

    final path_51 = Path()
      ..moveTo(size.width * 0.8781, size.height * 0.1789)
      ..lineTo(size.width * 0.8756, size.height * 0.2044)
      ..lineTo(size.width * 0.859, size.height * 0.1883)
      ..close();

    canvas.drawPath(path_0, paint0Fill);
    canvas.drawPath(path_1, paint1Fill);
    canvas.drawPath(path_2, paint2Fill);
    canvas.drawPath(path_3, paint3Fill);
    canvas.drawPath(path_4, paint4Fill);
    canvas.drawPath(path_5, paint3Fill);
    canvas.drawPath(path_6, paint5Fill);
    canvas.drawPath(path_7, paint3Fill);
    canvas.drawPath(path_8, paint5Fill);
    canvas.drawPath(path_9, paint4Fill);
    canvas.drawPath(path_10, paint1Fill);
    canvas.drawPath(path_11, paint3Fill);
    canvas.drawPath(path_12, paint6Fill);
    canvas.drawPath(path_13, paint7Fill);
    canvas.drawPath(path_14, paint6Fill);
    canvas.drawPath(path_15, paint6Fill);
    canvas.drawPath(path_16, paint6Fill);
    canvas.drawPath(path_17, paint8Fill);
    canvas.drawPath(path_18, paint6Fill);
    canvas.drawPath(path_19, paint7Fill);
    canvas.drawPath(path_20, paint6Fill);
    canvas.drawPath(path_21, paint6Fill);
    canvas.drawPath(path_22, paint7Fill);
    canvas.drawPath(path_23, paint7Fill);
    canvas.drawPath(path_24, paint6Fill);
    canvas.drawPath(path_25, paint6Fill);
    canvas.drawPath(path_26, paint8Fill);
    canvas.drawPath(path_27, paint8Fill);
    canvas.drawPath(path_28, paint6Fill);
    canvas.drawPath(path_29, paint7Fill);
    canvas.drawPath(path_30, paint6Fill);
    canvas.drawPath(path_31, paint6Fill);
    canvas.drawPath(path_32, paint6Fill);
    canvas.drawPath(path_33, paint8Fill);
    canvas.drawPath(path_34, paint7Fill);
    canvas.drawPath(path_35, paint6Fill);
    canvas.drawPath(path_36, paint6Fill);
    canvas.drawPath(path_37, paint8Fill);
    canvas.drawPath(path_38, paint6Fill);
    canvas.drawPath(path_39, paint6Fill);
    canvas.drawPath(path_40, paint6Fill);
    canvas.drawPath(path_41, paint6Fill);
    canvas.drawPath(path_42, paint8Fill);
    canvas.drawPath(path_43, paint6Fill);
    canvas.drawPath(path_44, paint6Fill);
    canvas.drawPath(path_45, paint7Fill);
    canvas.drawPath(path_46, paint6Fill);
    canvas.drawPath(path_47, paint8Fill);
    canvas.drawPath(path_48, paint6Fill);
    canvas.drawPath(path_49, paint7Fill);
    canvas.drawPath(path_50, paint6Fill);
    canvas.drawPath(path_51, paint7Fill);

    if (_colorFilter != null) {
      canvas.restore();
    }

    canvas.restore();
  }
}
