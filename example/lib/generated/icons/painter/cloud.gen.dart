// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Cloud$SVG}
/// Cloud$SVG widget.
/// {@endtemplate}
class Cloud$SVG extends StatelessWidget {
  /// {@macro Cloud$SVG}
  const Cloud$SVG({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(463.8343, 463);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: Cloud$SVGPainter(colorFilter: colorFilter),
        size: svgSize,
      ),
    );
  }
}

/// {@template Cloud$SVGPainter}
/// Custom painter for [Cloud$SVG].
/// {@endtemplate}
class Cloud$SVGPainter extends CustomPainter {
  /// {@macro Cloud$SVGPainter}
  const Cloud$SVGPainter({ui.ColorFilter? colorFilter})
    : _colorFilter = colorFilter;

  final ui.ColorFilter? _colorFilter;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = min(
      size.width / Cloud$SVG.svgSize.width,
      size.height / Cloud$SVG.svgSize.height,
    );

    canvas.save();
    final dx = (size.width - Cloud$SVG.svgSize.width * scale) / 2;
    final dy = (size.height - Cloud$SVG.svgSize.height * scale) / 2;
    canvas
      ..translate(dx, dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale);

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

    canvas.restore();
  }

  @override
  bool shouldRepaint(Cloud$SVGPainter oldDelegate) =>
      oldDelegate._colorFilter != _colorFilter;
}
