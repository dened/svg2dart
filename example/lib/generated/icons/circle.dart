// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';
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

  static const Size svgSize = Size(24, 24);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: CirclePainter(colorFilter: colorFilter),
        size: svgSize,
      ),
    );
  }
}

/// {@template CirclePainter}
/// Custom painter for [Circle].
/// {@endtemplate}
class CirclePainter extends CustomPainter {
  /// {@macro CirclePainter}
  const CirclePainter({ui.ColorFilter? colorFilter})
    : _colorFilter = colorFilter;

  final ui.ColorFilter? _colorFilter;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = min(
      size.width / Circle.svgSize.width,
      size.height / Circle.svgSize.height,
    );

    canvas.save();
    final dx = (size.width - Circle.svgSize.width * scale) / 2;
    final dy = (size.height - Circle.svgSize.height * scale) / 2;
    canvas
      ..translate(dx, dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale);

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

  @override
  bool shouldRepaint(CirclePainter oldDelegate) =>
      oldDelegate._colorFilter != _colorFilter;
}
