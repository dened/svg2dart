// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Fire}
/// Fire widget.
/// {@endtemplate}
class Fire extends StatelessWidget {
  /// {@macro Fire}
  const Fire({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size(width ?? 512, height ?? 512),
    painter: FirePainter(colorFilter: colorFilter),
  );
}

class FirePainter extends CustomPainter {
  const FirePainter({this.colorFilter});

  final ui.ColorFilter? colorFilter;

  @override
  void paint(Canvas canvas, Size size) {
    // Scale and center the drawing to fit the canvas while maintaining aspect ratio.
    final scaleX = size.width / 512;
    final scaleY = size.height / 512;
    final scale = min(scaleX, scaleY);

    final dx = (size.width - 512 * scale) / 2;
    final dy = (size.height - 512 * scale) / 2;

    canvas.save();
    canvas.translate(dx, dy);
    canvas.scale(scale);

    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint0Fill.color = const Color(0xffed694a);
    paint0Fill.blendMode = BlendMode.srcOver;

    final paint1Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint1Fill.color = const Color(0xffd8553a);
    paint1Fill.blendMode = BlendMode.srcOver;

    final paint2Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint2Fill.color = const Color(0xfff4a32c);
    paint2Fill.blendMode = BlendMode.srcOver;

    final paint3Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint3Fill.color = const Color(0xffe89528);
    paint3Fill.blendMode = BlendMode.srcOver;

    final paint4Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint4Fill.color = const Color(0xfff4d44e);
    paint4Fill.blendMode = BlendMode.srcOver;

    final paint5Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint5Fill.color = const Color(0xffeae9e8);
    paint5Fill.blendMode = BlendMode.srcOver;

    final paint6Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint6Fill.color = const Color(0xfff7e7a1);
    paint6Fill.blendMode = BlendMode.srcOver;

    final paint7Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint7Fill.color = const Color(0xffe8c842);
    paint7Fill.blendMode = BlendMode.srcOver;

    var path_0 = Path()
      ..moveTo(373.499, 163.809)
      ..cubicTo(362.829, 152.16, 346.241, 136.437, 339.184, 171.939)
      ..cubicTo(336.784, 184.01, 331.177, 193.315, 326.372, 200.807)
      ..cubicTo(321.193, 174.595, 305.611, 147.464, 290.929, 129.171)
      ..cubicTo(285.435, 122.327, 265.941, 95.12, 262.196, 49.604)
      ..cubicTo(261.637, 42.811, 253.568, 39.621, 248.521, 44.203)
      ..cubicTo(200.289, 87.987, 173.815, 148.205, 172.832, 215.998)
      ..cubicTo(172.832, 215.998, 152.748, 199.069, 141.837, 167.575)
      ..cubicTo(138.899, 159.094, 127.529, 157.476, 122.596, 164.975)
      ..cubicTo(121.649, 166.415, 120.771, 167.857, 119.979, 169.257)
      ..cubicTo(82.766, 235.057, 64.865, 314.962, 81.414, 389.302)
      ..cubicTo(109.084, 513.799, 292.118, 548.605, 389.017, 470.356)
      ..cubicTo(483.822, 393.8, 453.686, 251.311, 373.499, 163.809)
      ..close();
    var path_1 = Path()
      ..moveTo(107.171, 397.118)
      ..cubicTo(90.814, 321.983, 108.128, 241.3, 144.467, 174.47)
      ..cubicTo(143.548, 172.253, 142.664, 169.96, 141.838, 167.576)
      ..cubicTo(138.9, 159.095, 127.53, 157.477, 122.597, 164.976)
      ..cubicTo(121.65, 166.416, 120.773, 167.858, 119.981, 169.258)
      ..cubicTo(82.768, 235.058, 64.867, 314.963, 81.416, 389.303)
      ..cubicTo(94.037, 446.089, 138.985, 484.203, 193.336, 501.452)
      ..cubicTo(150.936, 480.913, 117.732, 445.704, 107.171, 397.118)
      ..close();
    var path_2 = Path()
      ..moveTo(198.716, 214.75)
      ..cubicTo(200.725, 153.223, 222.979, 98.053, 262.809, 55.671)
      ..cubicTo(262.535, 53.337, 262.332, 51.25, 262.201, 49.666)
      ..cubicTo(261.63, 42.815, 253.856, 39.379, 248.831, 43.921)
      ..cubicTo(202.246, 86.039, 173.852, 145.648, 172.833, 215.996)
      ..lineTo(181.552, 222.767)
      ..cubicTo(185.846, 226.102, 191.664, 225.957, 195.765, 222.902)
      ..cubicTo(198.212, 220.828, 198.563, 217.698, 198.716, 214.75)
      ..close();
    var path_3 = Path()
      ..moveTo(344.242, 254.818)
      ..cubicTo(336.362, 246.214, 324.109, 234.6, 318.897, 260.823)
      ..cubicTo(317.125, 269.738, 312.982, 276.612, 309.435, 282.146)
      ..cubicTo(305.61, 262.785, 294.1, 242.745, 283.256, 229.234)
      ..cubicTo(279.198, 224.179, 264.8, 204.084, 262.033, 170.463)
      ..cubicTo(261.62, 165.445, 255.661, 163.09, 251.933, 166.474)
      ..cubicTo(216.308, 198.813, 196.753, 243.293, 196.028, 293.365)
      ..cubicTo(196.028, 293.365, 181.193, 280.861, 173.135, 257.599)
      ..cubicTo(170.965, 251.335, 162.566, 250.14, 158.923, 255.679)
      ..cubicTo(158.224, 256.742, 157.575, 257.808, 156.99, 258.842)
      ..cubicTo(129.503, 307.443, 116.281, 366.462, 128.504, 421.372)
      ..cubicTo(148.942, 513.328, 284.134, 539.037, 355.706, 481.24)
      ..cubicTo(425.73, 424.695, 403.471, 319.45, 344.242, 254.818)
      ..close();
    var path_4 = Path()
      ..moveTo(153.994, 428.585)
      ..cubicTo(143.172, 374.909, 154.381, 317.314, 178.146, 269.354)
      ..cubicTo(176.335, 265.808, 174.619, 261.888, 173.133, 257.6)
      ..cubicTo(170.963, 251.336, 162.564, 250.14, 158.921, 255.679)
      ..cubicTo(158.222, 256.742, 157.573, 257.808, 156.988, 258.843)
      ..cubicTo(129.502, 307.444, 116.281, 366.463, 128.502, 421.372)
      ..cubicTo(138.008, 464.14, 172.339, 492.568, 213.543, 504.939)
      ..cubicTo(184.268, 490.258, 161.218, 464.464, 153.994, 428.585)
      ..close();
    var path_5 = Path()
      ..moveTo(317.534, 337.904)
      ..cubicTo(312.2, 332.08, 303.904, 324.217, 300.376, 341.969)
      ..cubicTo(299.177, 348.005, 296.372, 352.657, 293.97, 356.403)
      ..cubicTo(291.38, 343.296, 283.59, 329.731, 276.248, 320.585)
      ..cubicTo(273.502, 317.163, 263.755, 303.56, 261.881, 280.801)
      ..cubicTo(261.601, 277.404, 257.568, 275.809, 255.044, 278.101)
      ..cubicTo(230.928, 299.993, 217.691, 330.103, 217.2, 363.998)
      ..cubicTo(217.2, 363.998, 207.157, 355.533, 201.703, 339.787)
      ..cubicTo(200.234, 335.547, 194.549, 334.738, 192.083, 338.487)
      ..cubicTo(191.609, 339.206, 191.171, 339.928, 190.774, 340.628)
      ..cubicTo(172.168, 373.528, 163.217, 413.48, 171.491, 450.651)
      ..cubicTo(185.326, 512.9, 276.843, 530.303, 325.292, 491.178)
      ..cubicTo(341.883, 477.78, 352.17, 458.901, 354.256, 438.018)
      ..cubicTo(357.405, 406.388, 345.232, 368.129, 317.534, 337.904)
      ..close();
    var path_6 = Path()
      ..moveTo(292.749, 415.006)
      ..cubicTo(289.777, 411.761, 285.156, 407.381, 283.19, 417.27)
      ..cubicTo(282.522, 420.633, 280.96, 423.225, 279.621, 425.312)
      ..cubicTo(278.178, 418.01, 273.838, 410.452, 269.748, 405.357)
      ..cubicTo(268.218, 403.45, 262.787, 395.871, 261.743, 383.192)
      ..cubicTo(261.587, 381.299, 259.339, 380.412, 257.934, 381.687)
      ..cubicTo(244.499, 393.884, 237.123, 410.659, 236.85, 429.543)
      ..cubicTo(236.85, 429.543, 231.255, 424.827, 228.216, 416.054)
      ..cubicTo(227.397, 413.691, 224.23, 413.24, 222.857, 415.33)
      ..cubicTo(222.593, 415.731, 222.349, 416.133, 222.129, 416.523)
      ..cubicTo(211.763, 434.853, 206.776, 457.111, 211.386, 477.82)
      ..cubicTo(221.884, 525.051, 307.932, 523.619, 313.21, 470.781)
      ..cubicTo(314.962, 453.16, 308.18, 431.844, 292.749, 415.006)
      ..close();
    var path_7 = Path()
      ..moveTo(231.364, 487.194)
      ..cubicTo(226.754, 468.669, 231.741, 448.758, 242.107, 432.362)
      ..cubicTo(242.327, 432.013, 242.572, 431.654, 242.835, 431.295)
      ..cubicTo(244.209, 429.426, 247.376, 429.829, 248.194, 431.942)
      ..cubicTo(251.233, 439.79, 256.828, 444.009, 256.828, 444.009)
      ..cubicTo(257.053, 430.129, 262.081, 417.529, 271.316, 407.423)
      ..cubicTo(269.251, 404.563, 262.933, 397.667, 261.742, 383.194)
      ..cubicTo(261.586, 381.301, 259.338, 380.414, 257.933, 381.689)
      ..cubicTo(244.498, 393.886, 237.122, 410.661, 236.849, 429.545)
      ..cubicTo(236.849, 429.545, 231.254, 424.829, 228.215, 416.057)
      ..cubicTo(227.397, 413.694, 224.229, 413.243, 222.856, 415.333)
      ..cubicTo(222.592, 415.734, 222.348, 416.136, 222.128, 416.526)
      ..cubicTo(211.762, 434.855, 206.775, 457.114, 211.385, 477.823)
      ..cubicTo(215.651, 497.018, 233.177, 508.554, 252.553, 511.338)
      ..cubicTo(242.101, 506.205, 234.068, 498.077, 231.364, 487.194)
      ..close();
    var path_8 = Path()
      ..moveTo(184.598, 68.045)
      ..cubicTo(206.223, 50.456, 206.175, 17.549, 184.598, 0)
      ..cubicTo(162.973, 17.588, 163.02, 50.496, 184.598, 68.045)
      ..close();
    var path_9 = Path()
      ..moveTo(443.793, 209.213)
      ..cubicTo(465.418, 191.624, 465.37, 158.717, 443.793, 141.168)
      ..cubicTo(433.909, 149.206, 422.216, 191.664, 443.793, 209.213)
      ..close();
    var path_10 = Path()
      ..moveTo(60.785, 222.606)
      ..cubicTo(76.37, 209.929, 76.336, 186.214, 60.785, 173.565)
      ..cubicTo(53.662, 179.358, 45.234, 209.958, 60.785, 222.606)
      ..close();
    var path_11 = Path()
      ..moveTo(330.709, 117.086)
      ..cubicTo(346.294, 104.409, 346.26, 80.694, 330.709, 68.045)
      ..cubicTo(315.124, 80.721, 315.159, 104.438, 330.709, 117.086)
      ..close();
    var path_12 = Path()
      ..moveTo(215.911, 285.324)
      ..cubicTo(219.49, 243.072, 235.625, 205.503, 262.717, 176.862)
      ..cubicTo(262.443, 174.786, 262.212, 172.655, 262.032, 170.464)
      ..cubicTo(261.619, 165.446, 255.66, 163.091, 251.932, 166.475)
      ..cubicTo(223.702, 192.101, 205.584, 225.357, 198.91, 262.972)
      ..lineTo(198.9, 262.969)
      ..cubicTo(198.405, 265.759, 197.791, 269.823, 197.403, 273.016)
      ..cubicTo(197.404, 273.019, 197.405, 273.021, 197.407, 273.024)
      ..cubicTo(196.596, 279.688, 196.126, 286.472, 196.026, 293.367)
      ..cubicTo(196.78, 293.514, 213.848, 302.287, 215.911, 285.324)
      ..close();
    var path_13 = Path()
      ..moveTo(196.43, 459.481)
      ..cubicTo(189.075, 424.756, 195.339, 387.726, 209.891, 355.641)
      ..cubicTo(207.072, 351.688, 203.987, 346.378, 201.704, 339.786)
      ..cubicTo(200.234, 335.546, 194.55, 334.737, 192.083, 338.486)
      ..cubicTo(191.61, 339.205, 191.17, 339.927, 190.774, 340.627)
      ..cubicTo(172.168, 373.527, 163.217, 413.479, 171.491, 450.65)
      ..cubicTo(177.971, 479.802, 201.488, 499.118, 229.639, 507.399)
      ..cubicTo(213.253, 496.521, 200.858, 480.42, 196.43, 459.481)
      ..close();
    var path_14 = Path()
      ..moveTo(243.751, 348.824)
      ..cubicTo(246.189, 331.399, 253.316, 312.2, 264.535, 296.149)
      ..cubicTo(263.313, 291.617, 262.352, 286.496, 261.883, 280.801)
      ..cubicTo(261.603, 277.404, 257.569, 275.809, 255.046, 278.101)
      ..cubicTo(240.02, 291.742, 229.235, 308.58, 223.108, 327.529)
      ..lineTo(223.092, 327.525)
      ..cubicTo(222.128, 330.502, 220.765, 335.434, 219.939, 339.327)
      ..cubicTo(219.946, 339.325, 219.953, 339.325, 219.96, 339.322)
      ..cubicTo(218.268, 347.266, 217.327, 355.51, 217.204, 363.997)
      ..cubicTo(230.696, 365.681, 241.857, 362.34, 243.751, 348.824)
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

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant FirePainter oldDelegate) {
    return oldDelegate.colorFilter != colorFilter;
  }
}
