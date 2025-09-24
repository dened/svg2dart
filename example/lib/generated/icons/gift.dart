// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Gift}
/// Gift widget.
/// {@endtemplate}
class Gift extends StatelessWidget {
  /// {@macro Gift}
  const Gift({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size(width ?? 500, height ?? 400),
    painter: GiftPainter(colorFilter: colorFilter),
  );
}

class GiftPainter extends CustomPainter {
  const GiftPainter({this.colorFilter});

  final ui.ColorFilter? colorFilter;

  @override
  void paint(Canvas canvas, Size size) {
    // Scale and center the drawing to fit the canvas while maintaining aspect ratio.
    final scaleX = size.width / 500;
    final scaleY = size.height / 400;
    final scale = min(scaleX, scaleY);

    final dx = (size.width - 500 * scale) / 2;
    final dy = (size.height - 400 * scale) / 2;

    canvas.save();
    canvas.translate(dx, dy);
    canvas.scale(scale);

    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint0Fill.color = const Color(0x1c000000);
    paint0Fill.blendMode = BlendMode.srcOver;

    final paint1Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint1Fill.color = const Color(0xfff7434c);
    paint1Fill.blendMode = BlendMode.srcOver;

    final paint2Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint2Fill.color = const Color(0xffdb2e37);
    paint2Fill.blendMode = BlendMode.srcOver;

    final paint3Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint3Fill.color = const Color(0xffffdb57);
    paint3Fill.blendMode = BlendMode.srcOver;

    final paint4Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint4Fill.color = const Color(0xfff5ba3d);
    paint4Fill.blendMode = BlendMode.srcOver;

    final paint5Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint5Fill.color = const Color(0xffef9325);
    paint5Fill.blendMode = BlendMode.srcOver;

    final paint6Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint6Fill.color = const Color(0xffff8888);
    paint6Fill.blendMode = BlendMode.srcOver;

    final paint7Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint7Fill.color = const Color(0xff64d3ff);
    paint7Fill.blendMode = BlendMode.srcOver;

    final paint8Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint8Fill.color = const Color(0xffefcb5b);
    paint8Fill.blendMode = BlendMode.srcOver;

    var path_0 = Path()
      ..moveTo(250.5, 377)
      ..cubicTo(326.9402, 377, 389, 381.4808, 389, 387)
      ..cubicTo(389, 392.5192, 326.9402, 397, 250.5, 397)
      ..cubicTo(174.0598, 397, 112, 392.5192, 112, 387)
      ..cubicTo(112, 381.4808, 174.0598, 377, 250.5, 377)
      ..close();
    var path_1 = Path()
      ..moveTo(374.07, 232.01)
      ..lineTo(125.93, 232.01)
      ..cubicTo(123.33, 232.01, 121.22, 234.12, 121.22, 236.72)
      ..lineTo(121.22, 382.71)
      ..cubicTo(121.22, 385.31, 123.33, 387.42, 125.93, 387.42)
      ..lineTo(374.06, 387.42)
      ..cubicTo(376.66, 387.42, 378.77, 385.31, 378.77, 382.71)
      ..lineTo(378.77, 236.72)
      ..cubicTo(378.77, 234.12, 376.67, 232.01, 374.07, 232.01)
      ..close();
    var path_2 = Path()
      ..moveTo(374.07, 232.01)
      ..lineTo(125.93, 232.01)
      ..cubicTo(123.33, 232.01, 121.22, 234.12, 121.22, 236.72)
      ..lineTo(121.22, 255.54)
      ..lineTo(378.76, 255.54)
      ..lineTo(378.76, 236.72)
      ..cubicTo(378.77, 234.12, 376.67, 232.01, 374.07, 232.01)
      ..close();
    var path_3 = Path()
      ..moveTo(274.04, 232.01)
      ..lineTo(225.97, 232.01)
      ..cubicTo(223.37, 232.01, 221.26, 234.12, 221.26, 236.72)
      ..lineTo(221.26, 382.71)
      ..cubicTo(221.26, 385.31, 223.37, 387.42, 225.97, 387.42)
      ..lineTo(274.04, 387.42)
      ..cubicTo(276.64, 387.42, 278.75, 385.31, 278.75, 382.71)
      ..lineTo(278.75, 236.72)
      ..cubicTo(278.74, 234.12, 276.64, 232.01, 274.04, 232.01)
      ..close();
    var path_4 = Path()
      ..moveTo(274.04, 232.01)
      ..lineTo(225.97, 232.01)
      ..cubicTo(223.37, 232.01, 221.26, 234.12, 221.26, 236.72)
      ..lineTo(221.26, 255.44)
      ..lineTo(278.74, 255.44)
      ..lineTo(278.74, 236.72)
      ..cubicTo(278.74, 234.12, 276.64, 232.01, 274.04, 232.01)
      ..close();
    var path_5 = Path()
      ..moveTo(364.9, 145.09)
      ..cubicTo(360.29, 133.06, 353.01, 121.32, 345.43, 113.67)
      ..cubicTo(342.65, 110.86, 338.9, 109.44, 334.64, 109.53)
      ..cubicTo(320.51, 109.86, 297.49, 127.59, 266.22, 162.23)
      ..cubicTo(265.44, 163.09, 265.01, 164.22, 265.01, 165.38)
      ..lineTo(265.01, 190.27)
      ..cubicTo(265.01, 192.87, 267.12, 194.98, 269.72, 194.98)
      ..lineTo(342.1, 194.98)
      ..cubicTo(358.23, 194.98, 364.88, 187.13, 367.63, 180.55)
      ..cubicTo(371.27, 171.78, 370.31, 159.19, 364.9, 145.09)
      ..close();
    var path_6 = Path()
      ..moveTo(367.59, 153.29)
      ..cubicTo(367.46, 152.81, 367.25, 152.35, 366.97, 151.93)
      ..cubicTo(359.87, 141.19, 344.51, 145.21, 332.89, 150.47)
      ..cubicTo(299.11, 165.76, 285.16, 186.82, 284.58, 187.71)
      ..cubicTo(283.64, 189.16, 283.57, 191, 284.39, 192.52)
      ..cubicTo(285.21, 194.04, 286.8, 194.98, 288.52, 194.98)
      ..lineTo(342.07, 194.98)
      ..cubicTo(352.33, 194.98, 359.94, 191.83, 364.69, 185.62)
      ..cubicTo(370.34, 178.24, 371.34, 167.06, 367.59, 153.29)
      ..close();
    var path_7 = Path()
      ..moveTo(233.78, 162.24)
      ..cubicTo(202.51, 127.6, 179.49, 109.87, 165.36, 109.54)
      ..cubicTo(161.09, 109.45, 157.35, 110.87, 154.57, 113.68)
      ..cubicTo(146.99, 121.33, 139.71, 133.07, 135.1, 145.1)
      ..cubicTo(129.69, 159.19, 128.73, 171.79, 132.39, 180.56)
      ..cubicTo(135.13, 187.14, 141.79, 194.99, 157.92, 194.99)
      ..lineTo(230.3, 194.99)
      ..cubicTo(232.9, 194.99, 235.01, 192.88, 235.01, 190.28)
      ..lineTo(235.01, 165.39)
      ..cubicTo(235, 164.23, 234.57, 163.1, 233.78, 162.24)
      ..close();
    var path_8 = Path()
      ..moveTo(215.41, 187.72)
      ..cubicTo(214.83, 186.83, 200.88, 165.77, 167.1, 150.48)
      ..cubicTo(155.47, 145.22, 140.12, 141.2, 133.02, 151.94)
      ..cubicTo(132.74, 152.36, 132.54, 152.82, 132.4, 153.3)
      ..cubicTo(128.65, 167.07, 129.65, 178.25, 135.29, 185.63)
      ..cubicTo(140.04, 191.84, 147.65, 194.99, 157.91, 194.99)
      ..lineTo(211.46, 194.99)
      ..cubicTo(213.19, 194.99, 214.77, 194.05, 215.59, 192.53)
      ..cubicTo(216.43, 191.01, 216.35, 189.16, 215.41, 187.72)
      ..close();
    var path_9 = Path()
      ..moveTo(269.71, 156.04)
      ..lineTo(230.29, 156.04)
      ..cubicTo(227.69, 156.04, 225.58, 158.15, 225.58, 160.75)
      ..lineTo(225.58, 190.29)
      ..cubicTo(225.58, 192.89, 227.69, 195, 230.29, 195)
      ..lineTo(269.71, 195)
      ..cubicTo(272.31, 195, 274.42, 192.89, 274.42, 190.29)
      ..lineTo(274.42, 160.75)
      ..cubicTo(274.41, 158.14, 272.31, 156.04, 269.71, 156.04)
      ..close();
    var path_10 = Path()
      ..moveTo(394.29, 185.58)
      ..lineTo(105.71, 185.58)
      ..cubicTo(103.11, 185.58, 101, 187.69, 101, 190.29)
      ..lineTo(101, 236.72)
      ..cubicTo(101, 239.32, 103.11, 241.43, 105.71, 241.43)
      ..lineTo(394.3, 241.43)
      ..cubicTo(396.9, 241.43, 399.01, 239.32, 399.01, 236.72)
      ..lineTo(399.01, 190.29)
      ..cubicTo(399, 187.69, 396.89, 185.58, 394.29, 185.58)
      ..close();
    var path_11 = Path()
      ..moveTo(213.86, 185.58)
      ..lineTo(286.15, 185.58)
      ..lineTo(286.15, 241.42)
      ..lineTo(213.86, 241.42)
      ..close();
    var path_12 = Path()
      ..moveTo(25.01, 153.46)
      ..lineTo(43.71, 156.99)
      ..lineTo(30.84, 171.58)
      ..close();
    var path_13 = Path()
      ..moveTo(168.69, 54.55)
      ..lineTo(175.25, 67.93)
      ..lineTo(160.07, 66.7)
      ..close();
    var path_14 = Path()
      ..moveTo(233.69, 113.55)
      ..lineTo(240.25, 126.93)
      ..lineTo(225.07, 125.7)
      ..close();
    var path_15 = Path()
      ..moveTo(73.57, 288.48)
      ..lineTo(88.07, 291.91)
      ..lineTo(77.49, 302.85)
      ..close();
    var path_16 = Path()
      ..moveTo(74, 346.63)
      ..lineTo(89.4, 335.44)
      ..lineTo(91.18, 354.81)
      ..close();
    var path_17 = Path()
      ..moveTo(29.41, 321.08)
      ..lineTo(37.74, 315.02)
      ..lineTo(38.7, 325.5)
      ..close();
    var path_18 = Path()
      ..moveTo(63.47, 243.76)
      ..lineTo(74.66, 246.4)
      ..lineTo(66.49, 254.85)
      ..close();
    var path_19 = Path()
      ..moveTo(5.01, 240.46)
      ..lineTo(23.71, 243.99)
      ..lineTo(10.84, 258.58)
      ..close();
    var path_20 = Path()
      ..moveTo(20.83, 194.76)
      ..lineTo(30.48, 201.02)
      ..lineTo(19.94, 206.23)
      ..close();
    var path_21 = Path()
      ..moveTo(85.17, 144.46)
      ..lineTo(98.44, 153.07)
      ..lineTo(83.94, 160.23)
      ..close();
    var path_22 = Path()
      ..moveTo(87.66, 108.37)
      ..lineTo(96.44, 114.07)
      ..lineTo(86.84, 118.81)
      ..close();
    var path_23 = Path()
      ..moveTo(41.76, 72.6)
      ..lineTo(67.17, 79.27)
      ..lineTo(51.55, 96.98)
      ..close();
    var path_24 = Path()
      ..moveTo(99.17, 65.46)
      ..lineTo(112.44, 74.07)
      ..lineTo(97.94, 81.23)
      ..close();
    var path_25 = Path()
      ..moveTo(129.15, 17.48)
      ..lineTo(146.04, 28.45)
      ..lineTo(127.58, 37.56)
      ..close();
    var path_26 = Path()
      ..moveTo(76.23, 171.45)
      ..lineTo(83.74, 193.29)
      ..lineTo(60.63, 188.48)
      ..close();
    var path_27 = Path()
      ..moveTo(255.2, 54.93)
      ..lineTo(268.53, 68.52)
      ..lineTo(249.63, 73.13)
      ..close();
    var path_28 = Path()
      ..moveTo(58.41, 38.08)
      ..lineTo(66.74, 32.02)
      ..lineTo(67.7, 42.5)
      ..close();
    var path_29 = Path()
      ..moveTo(448.44, 166.46)
      ..lineTo(429.73, 169.99)
      ..lineTo(442.6, 184.58)
      ..close();
    var path_30 = Path()
      ..moveTo(473.87, 236.48)
      ..lineTo(459.38, 239.91)
      ..lineTo(469.96, 250.85)
      ..close();
    var path_31 = Path()
      ..moveTo(432.45, 346.63)
      ..lineTo(417.05, 335.44)
      ..lineTo(415.26, 354.81)
      ..close();
    var path_32 = Path()
      ..moveTo(468.04, 323.08)
      ..lineTo(459.71, 317.02)
      ..lineTo(458.74, 327.5)
      ..close();
    var path_33 = Path()
      ..moveTo(433.98, 245.76)
      ..lineTo(422.79, 248.4)
      ..lineTo(430.96, 256.85)
      ..close();
    var path_34 = Path()
      ..moveTo(439.44, 287.46)
      ..lineTo(420.73, 290.99)
      ..lineTo(433.6, 305.58)
      ..close();
    var path_35 = Path()
      ..moveTo(476.61, 196.76)
      ..lineTo(466.97, 203.02)
      ..lineTo(477.51, 208.23)
      ..close();
    var path_36 = Path()
      ..moveTo(407.27, 136.46)
      ..lineTo(394.01, 145.07)
      ..lineTo(408.51, 152.23)
      ..close();
    var path_37 = Path()
      ..moveTo(422.68, 99.6)
      ..lineTo(399.99, 103.88)
      ..lineTo(415.6, 121.58)
      ..close();
    var path_38 = Path()
      ..moveTo(467.22, 130.45)
      ..lineTo(459.71, 152.29)
      ..lineTo(482.81, 147.48)
      ..close();
    var path_39 = Path()
      ..moveTo(439.04, 40.08)
      ..lineTo(430.71, 34.02)
      ..lineTo(429.74, 44.5)
      ..close();
    var path_40 = Path()
      ..moveTo(355.94, 23.1)
      ..lineTo(352.23, 41.77)
      ..lineTo(337.76, 28.76)
      ..close();
    var path_41 = Path()
      ..moveTo(213.45, 76.33)
      ..lineTo(209.88, 90.79)
      ..lineTo(199.04, 80.1)
      ..close();
    var path_42 = Path()
      ..moveTo(139.3, 75.18)
      ..lineTo(150.34, 90.69)
      ..lineTo(130.95, 92.28)
      ..close();
    var path_43 = Path()
      ..moveTo(145.29, 40.84)
      ..lineTo(151.26, 49.23)
      ..lineTo(140.77, 50.09)
      ..close();
    var path_44 = Path()
      ..moveTo(278.27, 99.66)
      ..lineTo(275.51, 110.83)
      ..lineTo(267.14, 102.58)
      ..close();
    var path_45 = Path()
      ..moveTo(215.14, 33.24)
      ..lineTo(211.43, 51.91)
      ..lineTo(196.96, 38.9)
      ..close();
    var path_46 = Path()
      ..moveTo(287.68, 30.52)
      ..lineTo(281.33, 40.1)
      ..lineTo(276.23, 29.51)
      ..close();
    var path_47 = Path()
      ..moveTo(363.35, 74.35)
      ..lineTo(354.61, 87.53)
      ..lineTo(347.6, 72.96)
      ..close();
    var path_48 = Path()
      ..moveTo(401.66, 63.58)
      ..lineTo(397.16, 86.23)
      ..lineTo(379.61, 70.44)
      ..close();
    var path_49 = Path()
      ..moveTo(318.45, 77.14)
      ..lineTo(296.54, 84.44)
      ..lineTo(301.57, 61.38)
      ..close();
    var path_50 = Path()
      ..moveTo(438.99, 116.64)
      ..lineTo(444.96, 125.03)
      ..lineTo(434.47, 125.89)
      ..close();
    var path_51 = Path()
      ..moveTo(439.07, 71.56)
      ..lineTo(437.79, 81.77)
      ..lineTo(429.48, 75.31)
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

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant GiftPainter oldDelegate) {
    return oldDelegate.colorFilter != colorFilter;
  }
}
