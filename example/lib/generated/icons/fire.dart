// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Fire}
/// Fire widget.
/// {@endtemplate}
class Fire extends LeafRenderObjectWidget {
  /// {@macro Fire}
  const Fire({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(512, 512);

  @override
  RenderObject createRenderObject(BuildContext context) => FireRenderObject()
    ..width = width
    ..height = height
    ..colorFilter = colorFilter;

  @override
  void updateRenderObject(BuildContext context, FireRenderObject renderObject) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class FireRenderObject extends RenderBox {
  FireRenderObject();

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
    final desiredWidth = _width ?? Fire.svgSize.width;
    final desiredHeight = _height ?? Fire.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if (Fire.svgSize.width == 0 || Fire.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / Fire.svgSize.width,
      size.height / Fire.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - Fire.svgSize.width * scale) / 2;
    final dy = (size.height - Fire.svgSize.height * scale) / 2;

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
    const size = Fire.svgSize;

    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffed694a);
    paint0Fill.blendMode = BlendMode.srcOver;

    final paint1Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffd8553a);
    paint1Fill.blendMode = BlendMode.srcOver;

    final paint2Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xfff4a32c);
    paint2Fill.blendMode = BlendMode.srcOver;

    final paint3Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffe89528);
    paint3Fill.blendMode = BlendMode.srcOver;

    final paint4Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xfff4d44e);
    paint4Fill.blendMode = BlendMode.srcOver;

    final paint5Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffeae9e8);
    paint5Fill.blendMode = BlendMode.srcOver;

    final paint6Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xfff7e7a1);
    paint6Fill.blendMode = BlendMode.srcOver;

    final paint7Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xffe8c842);
    paint7Fill.blendMode = BlendMode.srcOver;

    final path_0 = Path()
      ..moveTo(size.width * 0.7295, size.height * 0.3199)
      ..cubicTo(
        size.width * 0.7087,
        size.height * 0.2972,
        size.width * 0.6763,
        size.height * 0.2665,
        size.width * 0.6625,
        size.height * 0.3358,
      )
      ..cubicTo(
        size.width * 0.6578,
        size.height * 0.3594,
        size.width * 0.6468,
        size.height * 0.3776,
        size.width * 0.6374,
        size.height * 0.3922,
      )
      ..cubicTo(
        size.width * 0.6273,
        size.height * 0.341,
        size.width * 0.5969,
        size.height * 0.288,
        size.width * 0.5682,
        size.height * 0.2523,
      )
      ..cubicTo(
        size.width * 0.5575,
        size.height * 0.2389,
        size.width * 0.5194,
        size.height * 0.1858,
        size.width * 0.5121,
        size.height * 0.0969,
      )
      ..cubicTo(
        size.width * 0.511,
        size.height * 0.0836,
        size.width * 0.4952,
        size.height * 0.0774,
        size.width * 0.4854,
        size.height * 0.0863,
      )
      ..cubicTo(
        size.width * 0.3912,
        size.height * 0.1718,
        size.width * 0.3395,
        size.height * 0.2895,
        size.width * 0.3376,
        size.height * 0.4219,
      )
      ..cubicTo(
        size.width * 0.3376,
        size.height * 0.4219,
        size.width * 0.2983,
        size.height * 0.3888,
        size.width * 0.277,
        size.height * 0.3273,
      )
      ..cubicTo(
        size.width * 0.2713,
        size.height * 0.3107,
        size.width * 0.2491,
        size.height * 0.3076,
        size.width * 0.2394,
        size.height * 0.3222,
      )
      ..cubicTo(
        size.width * 0.2376,
        size.height * 0.325,
        size.width * 0.2359,
        size.height * 0.3278,
        size.width * 0.2343,
        size.height * 0.3306,
      )
      ..cubicTo(
        size.width * 0.1617,
        size.height * 0.4591,
        size.width * 0.1267,
        size.height * 0.6152,
        size.width * 0.159,
        size.height * 0.7604,
      )
      ..cubicTo(
        size.width * 0.2131,
        size.height * 1.0035,
        size.width * 0.5705,
        size.height * 1.0715,
        size.width * 0.7598,
        size.height * 0.9187,
      )
      ..cubicTo(
        size.width * 0.945,
        size.height * 0.7691,
        size.width * 0.8861,
        size.height * 0.4908,
        size.width * 0.7295,
        size.height * 0.3199,
      )
      ..close();

    final path_1 = Path()
      ..moveTo(size.width * 0.2093, size.height * 0.7756)
      ..cubicTo(
        size.width * 0.1774,
        size.height * 0.6289,
        size.width * 0.2112,
        size.height * 0.4713,
        size.width * 0.2822,
        size.height * 0.3408,
      )
      ..cubicTo(
        size.width * 0.2804,
        size.height * 0.3364,
        size.width * 0.2786,
        size.height * 0.332,
        size.width * 0.277,
        size.height * 0.3273,
      )
      ..cubicTo(
        size.width * 0.2713,
        size.height * 0.3107,
        size.width * 0.2491,
        size.height * 0.3076,
        size.width * 0.2394,
        size.height * 0.3222,
      )
      ..cubicTo(
        size.width * 0.2376,
        size.height * 0.325,
        size.width * 0.2359,
        size.height * 0.3278,
        size.width * 0.2343,
        size.height * 0.3306,
      )
      ..cubicTo(
        size.width * 0.1617,
        size.height * 0.4591,
        size.width * 0.1267,
        size.height * 0.6152,
        size.width * 0.159,
        size.height * 0.7604,
      )
      ..cubicTo(
        size.width * 0.1837,
        size.height * 0.8713,
        size.width * 0.2715,
        size.height * 0.9457,
        size.width * 0.3776,
        size.height * 0.9794,
      )
      ..cubicTo(
        size.width * 0.2948,
        size.height * 0.9393,
        size.width * 0.2299,
        size.height * 0.8705,
        size.width * 0.2093,
        size.height * 0.7756,
      )
      ..close();

    final path_2 = Path()
      ..moveTo(size.width * 0.3881, size.height * 0.4194)
      ..cubicTo(
        size.width * 0.392,
        size.height * 0.2993,
        size.width * 0.4355,
        size.height * 0.1915,
        size.width * 0.5133,
        size.height * 0.1087,
      )
      ..cubicTo(
        size.width * 0.5128,
        size.height * 0.1042,
        size.width * 0.5124,
        size.height * 0.1001,
        size.width * 0.5121,
        size.height * 0.097,
      )
      ..cubicTo(
        size.width * 0.511,
        size.height * 0.0836,
        size.width * 0.4958,
        size.height * 0.0769,
        size.width * 0.486,
        size.height * 0.0858,
      )
      ..cubicTo(
        size.width * 0.395,
        size.height * 0.168,
        size.width * 0.3396,
        size.height * 0.2845,
        size.width * 0.3376,
        size.height * 0.4219,
      )
      ..lineTo(size.width * 0.3546, size.height * 0.4351)
      ..cubicTo(
        size.width * 0.363,
        size.height * 0.4416,
        size.width * 0.3743,
        size.height * 0.4413,
        size.width * 0.3824,
        size.height * 0.4354,
      )
      ..cubicTo(
        size.width * 0.3871,
        size.height * 0.4313,
        size.width * 0.3878,
        size.height * 0.4252,
        size.width * 0.3881,
        size.height * 0.4194,
      )
      ..close();

    final path_3 = Path()
      ..moveTo(size.width * 0.6723, size.height * 0.4977)
      ..cubicTo(
        size.width * 0.657,
        size.height * 0.4809,
        size.width * 0.633,
        size.height * 0.4582,
        size.width * 0.6228,
        size.height * 0.5094,
      )
      ..cubicTo(
        size.width * 0.6194,
        size.height * 0.5268,
        size.width * 0.6113,
        size.height * 0.5403,
        size.width * 0.6044,
        size.height * 0.5511,
      )
      ..cubicTo(
        size.width * 0.5969,
        size.height * 0.5133,
        size.width * 0.5744,
        size.height * 0.4741,
        size.width * 0.5532,
        size.height * 0.4477,
      )
      ..cubicTo(
        size.width * 0.5453,
        size.height * 0.4378,
        size.width * 0.5172,
        size.height * 0.3986,
        size.width * 0.5118,
        size.height * 0.3329,
      )
      ..cubicTo(
        size.width * 0.511,
        size.height * 0.3231,
        size.width * 0.4993,
        size.height * 0.3185,
        size.width * 0.4921,
        size.height * 0.3251,
      )
      ..cubicTo(
        size.width * 0.4225,
        size.height * 0.3883,
        size.width * 0.3843,
        size.height * 0.4752,
        size.width * 0.3829,
        size.height * 0.573,
      )
      ..cubicTo(
        size.width * 0.3829,
        size.height * 0.573,
        size.width * 0.3539,
        size.height * 0.5486,
        size.width * 0.3382,
        size.height * 0.5031,
      )
      ..cubicTo(
        size.width * 0.3339,
        size.height * 0.4909,
        size.width * 0.3175,
        size.height * 0.4886,
        size.width * 0.3104,
        size.height * 0.4994,
      )
      ..cubicTo(
        size.width * 0.309,
        size.height * 0.5014,
        size.width * 0.3078,
        size.height * 0.5035,
        size.width * 0.3066,
        size.height * 0.5056,
      )
      ..cubicTo(
        size.width * 0.2529,
        size.height * 0.6005,
        size.width * 0.2271,
        size.height * 0.7157,
        size.width * 0.251,
        size.height * 0.823,
      )
      ..cubicTo(
        size.width * 0.2909,
        size.height * 1.0026,
        size.width * 0.5549,
        size.height * 1.0528,
        size.width * 0.6947,
        size.height * 0.9399,
      )
      ..cubicTo(
        size.width * 0.8315,
        size.height * 0.8295,
        size.width * 0.788,
        size.height * 0.6239,
        size.width * 0.6723,
        size.height * 0.4977,
      )
      ..close();

    final path_4 = Path()
      ..moveTo(size.width * 0.3008, size.height * 0.8371)
      ..cubicTo(
        size.width * 0.2796,
        size.height * 0.7322,
        size.width * 0.3015,
        size.height * 0.6198,
        size.width * 0.3479,
        size.height * 0.5261,
      )
      ..cubicTo(
        size.width * 0.3444,
        size.height * 0.5192,
        size.width * 0.3411,
        size.height * 0.5115,
        size.width * 0.3382,
        size.height * 0.5031,
      )
      ..cubicTo(
        size.width * 0.3339,
        size.height * 0.4909,
        size.width * 0.3175,
        size.height * 0.4886,
        size.width * 0.3104,
        size.height * 0.4994,
      )
      ..cubicTo(
        size.width * 0.309,
        size.height * 0.5014,
        size.width * 0.3078,
        size.height * 0.5035,
        size.width * 0.3066,
        size.height * 0.5056,
      )
      ..cubicTo(
        size.width * 0.2529,
        size.height * 0.6005,
        size.width * 0.2271,
        size.height * 0.7157,
        size.width * 0.251,
        size.height * 0.823,
      )
      ..cubicTo(
        size.width * 0.2695,
        size.height * 0.9065,
        size.width * 0.3366,
        size.height * 0.962,
        size.width * 0.4171,
        size.height * 0.9862,
      )
      ..cubicTo(
        size.width * 0.3599,
        size.height * 0.9575,
        size.width * 0.3149,
        size.height * 0.9072,
        size.width * 0.3008,
        size.height * 0.8371,
      )
      ..close();

    final path_5 = Path()
      ..moveTo(size.width * 0.6202, size.height * 0.66)
      ..cubicTo(
        size.width * 0.6098,
        size.height * 0.6486,
        size.width * 0.5936,
        size.height * 0.6332,
        size.width * 0.5867,
        size.height * 0.6679,
      )
      ..cubicTo(
        size.width * 0.5843,
        size.height * 0.6797,
        size.width * 0.5789,
        size.height * 0.6888,
        size.width * 0.5742,
        size.height * 0.6961,
      )
      ..cubicTo(
        size.width * 0.5691,
        size.height * 0.6705,
        size.width * 0.5539,
        size.height * 0.644,
        size.width * 0.5395,
        size.height * 0.6261,
      )
      ..cubicTo(
        size.width * 0.5342,
        size.height * 0.6195,
        size.width * 0.5151,
        size.height * 0.5929,
        size.width * 0.5115,
        size.height * 0.5484,
      )
      ..cubicTo(
        size.width * 0.5109,
        size.height * 0.5418,
        size.width * 0.5031,
        size.height * 0.5387,
        size.width * 0.4981,
        size.height * 0.5432,
      )
      ..cubicTo(
        size.width * 0.451,
        size.height * 0.5859,
        size.width * 0.4252,
        size.height * 0.6447,
        size.width * 0.4242,
        size.height * 0.7109,
      )
      ..cubicTo(
        size.width * 0.4242,
        size.height * 0.7109,
        size.width * 0.4046,
        size.height * 0.6944,
        size.width * 0.394,
        size.height * 0.6636,
      )
      ..cubicTo(
        size.width * 0.3911,
        size.height * 0.6554,
        size.width * 0.38,
        size.height * 0.6538,
        size.width * 0.3752,
        size.height * 0.6611,
      )
      ..cubicTo(
        size.width * 0.3742,
        size.height * 0.6625,
        size.width * 0.3734,
        size.height * 0.6639,
        size.width * 0.3726,
        size.height * 0.6653,
      )
      ..cubicTo(
        size.width * 0.3363,
        size.height * 0.7295,
        size.width * 0.3188,
        size.height * 0.8076,
        size.width * 0.3349,
        size.height * 0.8802,
      )
      ..cubicTo(
        size.width * 0.362,
        size.height * 1.0018,
        size.width * 0.5407,
        size.height * 1.0357,
        size.width * 0.6353,
        size.height * 0.9593,
      )
      ..cubicTo(
        size.width * 0.6677,
        size.height * 0.9332,
        size.width * 0.6878,
        size.height * 0.8963,
        size.width * 0.6919,
        size.height * 0.8555,
      )
      ..cubicTo(
        size.width * 0.6981,
        size.height * 0.7937,
        size.width * 0.6743,
        size.height * 0.719,
        size.width * 0.6202,
        size.height * 0.66,
      )
      ..close();

    final path_6 = Path()
      ..moveTo(size.width * 0.5718, size.height * 0.8106)
      ..cubicTo(
        size.width * 0.566,
        size.height * 0.8042,
        size.width * 0.5569,
        size.height * 0.7957,
        size.width * 0.5531,
        size.height * 0.815,
      )
      ..cubicTo(
        size.width * 0.5518,
        size.height * 0.8215,
        size.width * 0.5487,
        size.height * 0.8266,
        size.width * 0.5461,
        size.height * 0.8307,
      )
      ..cubicTo(
        size.width * 0.5433,
        size.height * 0.8164,
        size.width * 0.5348,
        size.height * 0.8017,
        size.width * 0.5269,
        size.height * 0.7917,
      )
      ..cubicTo(
        size.width * 0.5239,
        size.height * 0.788,
        size.width * 0.5133,
        size.height * 0.7732,
        size.width * 0.5112,
        size.height * 0.7484,
      )
      ..cubicTo(
        size.width * 0.5109,
        size.height * 0.7447,
        size.width * 0.5065,
        size.height * 0.743,
        size.width * 0.5038,
        size.height * 0.7455,
      )
      ..cubicTo(
        size.width * 0.4775,
        size.height * 0.7693,
        size.width * 0.4631,
        size.height * 0.8021,
        size.width * 0.4626,
        size.height * 0.839,
      )
      ..cubicTo(
        size.width * 0.4626,
        size.height * 0.839,
        size.width * 0.4517,
        size.height * 0.8297,
        size.width * 0.4457,
        size.height * 0.8126,
      )
      ..cubicTo(
        size.width * 0.4441,
        size.height * 0.808,
        size.width * 0.4379,
        size.height * 0.8071,
        size.width * 0.4353,
        size.height * 0.8112,
      )
      ..cubicTo(
        size.width * 0.4348,
        size.height * 0.812,
        size.width * 0.4343,
        size.height * 0.8128,
        size.width * 0.4338,
        size.height * 0.8135,
      )
      ..cubicTo(
        size.width * 0.4136,
        size.height * 0.8493,
        size.width * 0.4039,
        size.height * 0.8928,
        size.width * 0.4129,
        size.height * 0.9332,
      )
      ..cubicTo(
        size.width * 0.4334,
        size.height * 1.0255,
        size.width * 0.6014,
        size.height * 1.0227,
        size.width * 0.6117,
        size.height * 0.9195,
      )
      ..cubicTo(
        size.width * 0.6152,
        size.height * 0.8851,
        size.width * 0.6019,
        size.height * 0.8434,
        size.width * 0.5718,
        size.height * 0.8106,
      )
      ..close();

    final path_7 = Path()
      ..moveTo(size.width * 0.4519, size.height * 0.9516)
      ..cubicTo(
        size.width * 0.4429,
        size.height * 0.9154,
        size.width * 0.4526,
        size.height * 0.8765,
        size.width * 0.4729,
        size.height * 0.8445,
      )
      ..cubicTo(
        size.width * 0.4733,
        size.height * 0.8438,
        size.width * 0.4738,
        size.height * 0.8431,
        size.width * 0.4743,
        size.height * 0.8424,
      )
      ..cubicTo(
        size.width * 0.477,
        size.height * 0.8387,
        size.width * 0.4832,
        size.height * 0.8395,
        size.width * 0.4848,
        size.height * 0.8436,
      )
      ..cubicTo(
        size.width * 0.4907,
        size.height * 0.859,
        size.width * 0.5016,
        size.height * 0.8672,
        size.width * 0.5016,
        size.height * 0.8672,
      )
      ..cubicTo(
        size.width * 0.5021,
        size.height * 0.8401,
        size.width * 0.5119,
        size.height * 0.8155,
        size.width * 0.5299,
        size.height * 0.7957,
      )
      ..cubicTo(
        size.width * 0.5259,
        size.height * 0.7902,
        size.width * 0.5135,
        size.height * 0.7767,
        size.width * 0.5112,
        size.height * 0.7484,
      )
      ..cubicTo(
        size.width * 0.5109,
        size.height * 0.7447,
        size.width * 0.5065,
        size.height * 0.743,
        size.width * 0.5038,
        size.height * 0.7455,
      )
      ..cubicTo(
        size.width * 0.4775,
        size.height * 0.7693,
        size.width * 0.4631,
        size.height * 0.8021,
        size.width * 0.4626,
        size.height * 0.839,
      )
      ..cubicTo(
        size.width * 0.4626,
        size.height * 0.839,
        size.width * 0.4517,
        size.height * 0.8297,
        size.width * 0.4457,
        size.height * 0.8126,
      )
      ..cubicTo(
        size.width * 0.4441,
        size.height * 0.808,
        size.width * 0.4379,
        size.height * 0.8071,
        size.width * 0.4353,
        size.height * 0.8112,
      )
      ..cubicTo(
        size.width * 0.4347,
        size.height * 0.812,
        size.width * 0.4343,
        size.height * 0.8128,
        size.width * 0.4338,
        size.height * 0.8135,
      )
      ..cubicTo(
        size.width * 0.4136,
        size.height * 0.8493,
        size.width * 0.4039,
        size.height * 0.8928,
        size.width * 0.4129,
        size.height * 0.9332,
      )
      ..cubicTo(
        size.width * 0.4212,
        size.height * 0.9707,
        size.width * 0.4554,
        size.height * 0.9933,
        size.width * 0.4933,
        size.height * 0.9987,
      )
      ..cubicTo(
        size.width * 0.4729,
        size.height * 0.9887,
        size.width * 0.4572,
        size.height * 0.9728,
        size.width * 0.4519,
        size.height * 0.9516,
      )
      ..close();

    final path_8 = Path()
      ..moveTo(size.width * 0.3605, size.height * 0.1329)
      ..cubicTo(
        size.width * 0.4028,
        size.height * 0.0985,
        size.width * 0.4027,
        size.height * 0.0343,
        size.width * 0.3605,
        size.height * 0,
      )
      ..cubicTo(
        size.width * 0.3183,
        size.height * 0.0344,
        size.width * 0.3184,
        size.height * 0.0986,
        size.width * 0.3605,
        size.height * 0.1329,
      )
      ..close();

    final path_9 = Path()
      ..moveTo(size.width * 0.8668, size.height * 0.4086)
      ..cubicTo(
        size.width * 0.909,
        size.height * 0.3743,
        size.width * 0.9089,
        size.height * 0.31,
        size.width * 0.8668,
        size.height * 0.2757,
      )
      ..cubicTo(
        size.width * 0.8475,
        size.height * 0.2914,
        size.width * 0.8246,
        size.height * 0.3743,
        size.width * 0.8668,
        size.height * 0.4086,
      )
      ..close();

    final path_10 = Path()
      ..moveTo(size.width * 0.1187, size.height * 0.4348)
      ..cubicTo(
        size.width * 0.1492,
        size.height * 0.41,
        size.width * 0.1491,
        size.height * 0.3637,
        size.width * 0.1187,
        size.height * 0.339,
      )
      ..cubicTo(
        size.width * 0.1048,
        size.height * 0.3503,
        size.width * 0.0883,
        size.height * 0.4101,
        size.width * 0.1187,
        size.height * 0.4348,
      )
      ..close();

    final path_11 = Path()
      ..moveTo(size.width * 0.6459, size.height * 0.2287)
      ..cubicTo(
        size.width * 0.6764,
        size.height * 0.2039,
        size.width * 0.6763,
        size.height * 0.1576,
        size.width * 0.6459,
        size.height * 0.1329,
      )
      ..cubicTo(
        size.width * 0.6155,
        size.height * 0.1577,
        size.width * 0.6155,
        size.height * 0.204,
        size.width * 0.6459,
        size.height * 0.2287,
      )
      ..close();

    final path_12 = Path()
      ..moveTo(size.width * 0.4217, size.height * 0.5573)
      ..cubicTo(
        size.width * 0.4287,
        size.height * 0.4748,
        size.width * 0.4602,
        size.height * 0.4014,
        size.width * 0.5131,
        size.height * 0.3454,
      )
      ..cubicTo(
        size.width * 0.5126,
        size.height * 0.3414,
        size.width * 0.5121,
        size.height * 0.3372,
        size.width * 0.5118,
        size.height * 0.3329,
      )
      ..cubicTo(
        size.width * 0.511,
        size.height * 0.3231,
        size.width * 0.4993,
        size.height * 0.3185,
        size.width * 0.4921,
        size.height * 0.3251,
      )
      ..cubicTo(
        size.width * 0.4369,
        size.height * 0.3752,
        size.width * 0.4015,
        size.height * 0.4402,
        size.width * 0.3885,
        size.height * 0.5136,
      )
      ..lineTo(size.width * 0.3885, size.height * 0.5136)
      ..cubicTo(
        size.width * 0.3875,
        size.height * 0.5191,
        size.width * 0.3863,
        size.height * 0.527,
        size.width * 0.3856,
        size.height * 0.5332,
      )
      ..cubicTo(
        size.width * 0.3856,
        size.height * 0.5332,
        size.width * 0.3856,
        size.height * 0.5332,
        size.width * 0.3856,
        size.height * 0.5332,
      )
      ..cubicTo(
        size.width * 0.384,
        size.height * 0.5463,
        size.width * 0.3831,
        size.height * 0.5595,
        size.width * 0.3829,
        size.height * 0.573,
      )
      ..cubicTo(
        size.width * 0.3843,
        size.height * 0.5733,
        size.width * 0.4177,
        size.height * 0.5904,
        size.width * 0.4217,
        size.height * 0.5573,
      )
      ..close();

    final path_13 = Path()
      ..moveTo(size.width * 0.3837, size.height * 0.8974)
      ..cubicTo(
        size.width * 0.3693,
        size.height * 0.8296,
        size.width * 0.3815,
        size.height * 0.7573,
        size.width * 0.4099,
        size.height * 0.6946,
      )
      ..cubicTo(
        size.width * 0.4044,
        size.height * 0.6869,
        size.width * 0.3984,
        size.height * 0.6765,
        size.width * 0.394,
        size.height * 0.6636,
      )
      ..cubicTo(
        size.width * 0.3911,
        size.height * 0.6554,
        size.width * 0.38,
        size.height * 0.6538,
        size.width * 0.3752,
        size.height * 0.6611,
      )
      ..cubicTo(
        size.width * 0.3742,
        size.height * 0.6625,
        size.width * 0.3734,
        size.height * 0.6639,
        size.width * 0.3726,
        size.height * 0.6653,
      )
      ..cubicTo(
        size.width * 0.3363,
        size.height * 0.7295,
        size.width * 0.3188,
        size.height * 0.8076,
        size.width * 0.3349,
        size.height * 0.8802,
      )
      ..cubicTo(
        size.width * 0.3476,
        size.height * 0.9371,
        size.width * 0.3935,
        size.height * 0.9748,
        size.width * 0.4485,
        size.height * 0.991,
      )
      ..cubicTo(
        size.width * 0.4165,
        size.height * 0.9698,
        size.width * 0.3923,
        size.height * 0.9383,
        size.width * 0.3837,
        size.height * 0.8974,
      )
      ..close();

    final path_14 = Path()
      ..moveTo(size.width * 0.4761, size.height * 0.6813)
      ..cubicTo(
        size.width * 0.4808,
        size.height * 0.6473,
        size.width * 0.4948,
        size.height * 0.6098,
        size.width * 0.5167,
        size.height * 0.5784,
      )
      ..cubicTo(
        size.width * 0.5143,
        size.height * 0.5696,
        size.width * 0.5124,
        size.height * 0.5596,
        size.width * 0.5115,
        size.height * 0.5484,
      )
      ..cubicTo(
        size.width * 0.5109,
        size.height * 0.5418,
        size.width * 0.5031,
        size.height * 0.5387,
        size.width * 0.4981,
        size.height * 0.5432,
      )
      ..cubicTo(
        size.width * 0.4688,
        size.height * 0.5698,
        size.width * 0.4477,
        size.height * 0.6027,
        size.width * 0.4358,
        size.height * 0.6397,
      )
      ..lineTo(size.width * 0.4357, size.height * 0.6397)
      ..cubicTo(
        size.width * 0.4338,
        size.height * 0.6455,
        size.width * 0.4312,
        size.height * 0.6551,
        size.width * 0.4296,
        size.height * 0.6627,
      )
      ..cubicTo(
        size.width * 0.4296,
        size.height * 0.6627,
        size.width * 0.4296,
        size.height * 0.6627,
        size.width * 0.4296,
        size.height * 0.6627,
      )
      ..cubicTo(
        size.width * 0.4263,
        size.height * 0.6783,
        size.width * 0.4245,
        size.height * 0.6944,
        size.width * 0.4242,
        size.height * 0.7109,
      )
      ..cubicTo(
        size.width * 0.4506,
        size.height * 0.7142,
        size.width * 0.4724,
        size.height * 0.7077,
        size.width * 0.4761,
        size.height * 0.6813,
      )
      ..close();

    canvas.drawPath(path_0, paint0Fill);
    canvas.drawPath(path_1, paint1Fill);
    canvas.drawPath(path_2, paint1Fill);
    canvas.drawPath(path_3, paint2Fill);
    canvas.drawPath(path_4, paint3Fill);
    canvas.drawPath(path_5, paint4Fill);
    canvas.drawPath(path_6, paint5Fill);
    canvas.drawPath(path_7, paint6Fill);
    canvas.drawPath(path_8, paint1Fill);
    canvas.drawPath(path_9, paint1Fill);
    canvas.drawPath(path_10, paint1Fill);
    canvas.drawPath(path_11, paint1Fill);
    canvas.drawPath(path_12, paint3Fill);
    canvas.drawPath(path_13, paint7Fill);
    canvas.drawPath(path_14, paint7Fill);

    return recorder.endRecording();
  }();
}
