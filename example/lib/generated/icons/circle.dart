// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

/// {@template Circle}
/// Circle widget.
/// {@endtemplate}
class Circle extends StatelessWidget {
  /// {@macro Circle}
  const Circle({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size(width ?? 128, height ?? 128),
    painter: CirclePainter(colorFilter: colorFilter),
  );
}

class CirclePainter extends CustomPainter {
  const CirclePainter({this.colorFilter});

  final ui.ColorFilter? colorFilter;

  @override
  void paint(Canvas canvas, Size size) {
    // Scale and center the drawing to fit the canvas while maintaining aspect ratio.
    final scaleX = size.width / 128;
    final scaleY = size.height / 128;
    final scale = min(scaleX, scaleY);

    final dx = (size.width - 128 * scale) / 2;
    final dy = (size.height - 128 * scale) / 2;

    canvas.save();
    canvas.translate(dx, dy);
    canvas.scale(scale);

    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..colorFilter = colorFilter;
    paint0Fill.color = const Color(0xffff0000);
    paint0Fill.blendMode = BlendMode.srcOver;

    var path_0 = Path()
      ..moveTo(64, 0)
      ..cubicTo(99.3226, 0, 128, 28.6774, 128, 64)
      ..cubicTo(128, 99.3226, 99.3226, 128, 64, 128)
      ..cubicTo(28.6774, 128, 0, 99.3226, 0, 64)
      ..cubicTo(0, 28.6774, 28.6774, 0, 64, 0)
      ..close();

    canvas.drawPath(path_0, paint0Fill);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) {
    return oldDelegate.colorFilter != colorFilter;
  }
}
