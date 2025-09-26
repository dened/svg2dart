import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:svg2dart/svg2dart.dart';
import 'package:test/test.dart';

void main() {
  group('svg2dartBuilder', () {
    const testSvg = '''
<svg width="24" height="24" viewBox="0 0 24 24">
  <circle cx="12" cy="12" r="10" fill="blue"/>
</svg>
''';

    const expectedOutput = '''
// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

/// {@template TestIcon}
/// TestIcon widget.
/// {@endtemplate}
class TestIcon extends StatelessWidget {
  /// {@macro TestIcon}
  const TestIcon({super.key, this.width, this.height, this.colorFilter});

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
        painter: TestIconPainter(colorFilter: colorFilter),
        size: svgSize,
      ),
    );
  }
}

/// {@template TestIconPainter}
/// Custom painter for [TestIcon].
/// {@endtemplate}
class TestIconPainter extends CustomPainter {
  /// {@macro TestIconPainter}
  const TestIconPainter({ui.ColorFilter? colorFilter})
    : _colorFilter = colorFilter;

  final ui.ColorFilter? _colorFilter;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = min(
      size.width / TestIcon.svgSize.width,
      size.height / TestIcon.svgSize.height,
    );

    canvas.save();
    final dx = (size.width - TestIcon.svgSize.width * scale) / 2;
    final dy = (size.height - TestIcon.svgSize.height * scale) / 2;
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
  bool shouldRepaint(TestIconPainter oldDelegate) =>
      oldDelegate._colorFilter != _colorFilter;
}
''';

    test('generates a Dart widget from a simple SVG', () async {
      final builder = svg2dartBuilder(const BuilderOptions({
        'input': 'assets/svg',
        'output': 'lib/generated',
        'convertTo': 'customPainter',
      }));

      await testBuilder(
        builder,
        {
          'my_package|assets/svg/test_icon.svg': testSvg,
        },
        outputs: {
          'my_package|lib/generated/test_icon.dart': expectedOutput,
        },
      );
    });
  });
}
