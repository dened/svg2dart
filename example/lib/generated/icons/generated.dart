// ignore_for_file: cascade_invocations, prefer_int_literals, unused_import

import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

/// {@template Generated}
/// Generated widget.
/// {@endtemplate}
class Generated extends StatelessWidget {
  /// {@macro Generated}
  const Generated({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(100, 100);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: GeneratedPainter(colorFilter: colorFilter),
        size: svgSize,
      ),
    );
  }
}

/// {@template GeneratedPainter}
/// Custom painter for [Generated].
/// {@endtemplate}
class GeneratedPainter extends CustomPainter {
  /// {@macro GeneratedPainter}
  const GeneratedPainter({ui.ColorFilter? colorFilter})
    : _colorFilter = colorFilter;

  final ui.ColorFilter? _colorFilter;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = min(
      size.width / Generated.svgSize.width,
      size.height / Generated.svgSize.height,
    );

    canvas.save();
    final dx = (size.width - Generated.svgSize.width * scale) / 2;
    final dy = (size.height - Generated.svgSize.height * scale) / 2;
    canvas
      ..translate(dx, dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale);

    final shader0 = ui.Gradient.linear(
      const Offset(28.7765, 133.4969),
      const Offset(33.746, 135.5943),
      [
        const Color(0xffd552ef),
        const Color(0xffea342e),
        const Color(0xffb5e873),
        const Color(0xff81b927),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader1 = ui.Gradient.linear(
      const Offset(92.7226, -50.4723),
      const Offset(90.7013, -98.7293),
      [
        const Color(0xffdabe86),
        const Color(0xff88e665),
        const Color(0xff7af5ab),
        const Color(0xff5ae2a0),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader2 = ui.Gradient.linear(
      const Offset(17.238, 45.0183),
      const Offset(16.1575, 47.7789),
      [
        const Color(0xff6de548),
        const Color(0xff51dae1),
        const Color(0xff2923d7),
        const Color(0xffc31d86),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader3 = ui.Gradient.linear(
      const Offset(9.7, 33.7),
      const Offset(24.9, 48.9),
      [
        const Color(0xff6de548),
        const Color(0xff51dae1),
        const Color(0xff2923d7),
        const Color(0xffc31d86),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader4 = ui.Gradient.linear(
      const Offset(-94.0247, -10.4883),
      const Offset(-113.5164, -15.6309),
      [
        const Color(0xffdabe86),
        const Color(0xff88e665),
        const Color(0xff7af5ab),
        const Color(0xff5ae2a0),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader5 = ui.Gradient.linear(
      const Offset(24.4379, 65.908),
      const Offset(10.5642, 48.947),
      [
        const Color(0xffdabe86),
        const Color(0xff88e665),
        const Color(0xff7af5ab),
        const Color(0xff5ae2a0),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader6 = ui.Gradient.linear(
      const Offset(105.8005, 53.1231),
      const Offset(102.5771, 33.6846),
      [
        const Color(0xff6de548),
        const Color(0xff51dae1),
        const Color(0xff2923d7),
        const Color(0xffc31d86),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader7 = ui.Gradient.linear(
      const Offset(114.7442, 48.6425),
      const Offset(124.7205, 44.9769),
      [
        const Color(0xffd552ef),
        const Color(0xffea342e),
        const Color(0xffb5e873),
        const Color(0xff81b927),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader8 = ui.Gradient.linear(
      const Offset(10.8, 16.8),
      const Offset(15.2, 21.2),
      [
        const Color(0xffdabe86),
        const Color(0xff88e665),
        const Color(0xff7af5ab),
        const Color(0xff5ae2a0),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader9 = ui.Gradient.linear(
      const Offset(-25.7971, -66.7741),
      const Offset(-31.1002, -79.9056),
      [
        const Color(0xffdabe86),
        const Color(0xff88e665),
        const Color(0xff7af5ab),
        const Color(0xff5ae2a0),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader10 = ui.Gradient.linear(
      const Offset(20.9519, 189.419),
      const Offset(22.1822, 192.4693),
      [
        const Color(0xff6de548),
        const Color(0xff51dae1),
        const Color(0xff2923d7),
        const Color(0xffc31d86),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader11 = ui.Gradient.linear(
      const Offset(97.7101, -11.3377),
      const Offset(135.359, -59.5076),
      [
        const Color(0xff6de548),
        const Color(0xff51dae1),
        const Color(0xff2923d7),
        const Color(0xffc31d86),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader12 = ui.Gradient.linear(
      const Offset(7.7, 67.3),
      const Offset(24.9, 84.5),
      [
        const Color(0xffd552ef),
        const Color(0xffea342e),
        const Color(0xffb5e873),
        const Color(0xff81b927),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader13 = ui.Gradient.linear(
      const Offset(60, 66.7),
      const Offset(89.2, 95.9),
      [
        const Color(0xffdabe86),
        const Color(0xff88e665),
        const Color(0xff7af5ab),
        const Color(0xff5ae2a0),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader14 = ui.Gradient.linear(
      const Offset(139.3826, -46.3933),
      const Offset(164.2956, -66.3992),
      [
        const Color(0xff6de548),
        const Color(0xff51dae1),
        const Color(0xff2923d7),
        const Color(0xffc31d86),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final shader15 = ui.Gradient.linear(
      const Offset(5.5322, -26.9454),
      const Offset(2.2953, -39.5894),
      [
        const Color(0xffdabe86),
        const Color(0xff88e665),
        const Color(0xff7af5ab),
        const Color(0xff5ae2a0),
      ],
      [0.0, 0.3330000042915344, 0.6669999957084656, 1.0],
      ui.TileMode.clamp,
    );
    final paint0Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xe25ae2a0);
    paint0Fill.colorFilter = _colorFilter;
    paint0Fill.blendMode = BlendMode.srcOver;

    final paint1Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0x5b7af5ab);
    paint1Fill.colorFilter = _colorFilter;
    paint1Fill.blendMode = BlendMode.srcOver;

    final paint2Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint2Stroke.color = const Color(0xff2923d7);
    paint2Stroke.colorFilter = _colorFilter;
    paint2Stroke.strokeWidth = 6.0154;
    paint2Stroke.blendMode = BlendMode.srcOver;

    final paint3Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xf2c31d86);
    paint3Fill.colorFilter = _colorFilter;
    paint3Fill.blendMode = BlendMode.srcOver;

    final paint4Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0x66d552ef);
    paint4Fill.colorFilter = _colorFilter;
    paint4Fill.blendMode = BlendMode.srcOver;

    final paint5Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xefea342e);
    paint5Fill.colorFilter = _colorFilter;
    paint5Fill.blendMode = BlendMode.srcOver;

    final paint6Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint6Fill.shader = shader0;
    paint6Fill.colorFilter = _colorFilter;
    paint6Fill.blendMode = BlendMode.srcOver;

    final paint7Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint7Stroke.color = const Color(0xffb5e873);
    paint7Stroke.colorFilter = _colorFilter;
    paint7Stroke.strokeWidth = 1.7226;
    paint7Stroke.blendMode = BlendMode.srcOver;

    final paint8Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint8Fill.shader = shader1;
    paint8Fill.colorFilter = _colorFilter;
    paint8Fill.blendMode = BlendMode.srcOver;

    final paint9Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint9Stroke.color = const Color(0xffea342e);
    paint9Stroke.colorFilter = _colorFilter;
    paint9Stroke.strokeWidth = 4.5308;
    paint9Stroke.blendMode = BlendMode.srcOver;

    final paint10Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint10Fill.color = const Color(0xedb5e873);
    paint10Fill.colorFilter = _colorFilter;
    paint10Fill.blendMode = BlendMode.srcOver;

    final paint11Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint11Fill.color = const Color(0x5e2923d7);
    paint11Fill.colorFilter = _colorFilter;
    paint11Fill.blendMode = BlendMode.srcOver;

    final paint12Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint12Fill.color = const Color(0xe251dae1);
    paint12Fill.colorFilter = _colorFilter;
    paint12Fill.blendMode = BlendMode.srcOver;

    final paint13Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint13Stroke.color = const Color(0xffea342e);
    paint13Stroke.colorFilter = _colorFilter;
    paint13Stroke.strokeWidth = 1.7;
    paint13Stroke.blendMode = BlendMode.srcOver;

    final paint14Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint14Stroke.color = const Color(0xffdabe86);
    paint14Stroke.colorFilter = _colorFilter;
    paint14Stroke.strokeWidth = 4.7646;
    paint14Stroke.blendMode = BlendMode.srcOver;

    final paint15Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint15Stroke.color = const Color(0xffd552ef);
    paint15Stroke.colorFilter = _colorFilter;
    paint15Stroke.strokeWidth = 1.4427;
    paint15Stroke.blendMode = BlendMode.srcOver;

    final paint16Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint16Fill.color = const Color(0xbf6de548);
    paint16Fill.colorFilter = _colorFilter;
    paint16Fill.blendMode = BlendMode.srcOver;

    final paint17Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint17Stroke.color = const Color(0xffc31d86);
    paint17Stroke.colorFilter = _colorFilter;
    paint17Stroke.strokeWidth = 1.763;
    paint17Stroke.blendMode = BlendMode.srcOver;

    final paint18Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint18Stroke.color = const Color(0xffb5e873);
    paint18Stroke.colorFilter = _colorFilter;
    paint18Stroke.strokeWidth = 1.66;
    paint18Stroke.blendMode = BlendMode.srcOver;

    final paint19Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint19Fill.color = const Color(0x7fd552ef);
    paint19Fill.colorFilter = _colorFilter;
    paint19Fill.blendMode = BlendMode.srcOver;

    final paint20Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint20Stroke.color = const Color(0xffd552ef);
    paint20Stroke.colorFilter = _colorFilter;
    paint20Stroke.strokeWidth = 3.7293;
    paint20Stroke.blendMode = BlendMode.srcOver;

    final paint21Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint21Stroke.color = const Color(0xffea342e);
    paint21Stroke.colorFilter = _colorFilter;
    paint21Stroke.strokeWidth = 2.4275;
    paint21Stroke.blendMode = BlendMode.srcOver;

    final paint22Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint22Fill.color = const Color(0xef7af5ab);
    paint22Fill.colorFilter = _colorFilter;
    paint22Fill.blendMode = BlendMode.srcOver;

    final paint23Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint23Fill.color = const Color(0x4451dae1);
    paint23Fill.colorFilter = _colorFilter;
    paint23Fill.blendMode = BlendMode.srcOver;

    final paint24Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint24Stroke.color = const Color(0xff6de548);
    paint24Stroke.colorFilter = _colorFilter;
    paint24Stroke.strokeWidth = 5.0315;
    paint24Stroke.blendMode = BlendMode.srcOver;

    final paint25Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint25Fill.color = const Color(0x7251dae1);
    paint25Fill.colorFilter = _colorFilter;
    paint25Fill.blendMode = BlendMode.srcOver;

    final paint26Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint26Fill.color = const Color(0xe02923d7);
    paint26Fill.colorFilter = _colorFilter;
    paint26Fill.blendMode = BlendMode.srcOver;

    final paint27Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint27Fill.color = const Color(0xe0c31d86);
    paint27Fill.colorFilter = _colorFilter;
    paint27Fill.blendMode = BlendMode.srcOver;

    final paint28Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint28Fill.color = const Color(0x8cdabe86);
    paint28Fill.colorFilter = _colorFilter;
    paint28Fill.blendMode = BlendMode.srcOver;

    final paint29Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint29Fill.color = const Color(0x63dabe86);
    paint29Fill.colorFilter = _colorFilter;
    paint29Fill.blendMode = BlendMode.srcOver;

    final paint30Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint30Stroke.color = const Color(0xff81b927);
    paint30Stroke.colorFilter = _colorFilter;
    paint30Stroke.strokeWidth = 2.19;
    paint30Stroke.blendMode = BlendMode.srcOver;

    final paint31Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint31Stroke.color = const Color(0xff88e665);
    paint31Stroke.colorFilter = _colorFilter;
    paint31Stroke.strokeWidth = 2.4377;
    paint31Stroke.blendMode = BlendMode.srcOver;

    final paint32Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint32Fill.color = const Color(0xd67af5ab);
    paint32Fill.colorFilter = _colorFilter;
    paint32Fill.blendMode = BlendMode.srcOver;

    final paint33Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint33Stroke.color = const Color(0xffdabe86);
    paint33Stroke.colorFilter = _colorFilter;
    paint33Stroke.strokeWidth = 7.4849;
    paint33Stroke.blendMode = BlendMode.srcOver;

    final paint34Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint34Fill.color = const Color(0x965ae2a0);
    paint34Fill.colorFilter = _colorFilter;
    paint34Fill.blendMode = BlendMode.srcOver;

    final paint35Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint35Fill.color = const Color(0x937af5ab);
    paint35Fill.colorFilter = _colorFilter;
    paint35Fill.blendMode = BlendMode.srcOver;

    final paint36Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint36Stroke.color = const Color(0xff7af5ab);
    paint36Stroke.colorFilter = _colorFilter;
    paint36Stroke.strokeWidth = 4.818;
    paint36Stroke.blendMode = BlendMode.srcOver;

    final paint37Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint37Stroke.color = const Color(0xff51dae1);
    paint37Stroke.colorFilter = _colorFilter;
    paint37Stroke.strokeWidth = 2.86;
    paint37Stroke.blendMode = BlendMode.srcOver;

    final paint38Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint38Fill.color = const Color(0x472923d7);
    paint38Fill.colorFilter = _colorFilter;
    paint38Fill.blendMode = BlendMode.srcOver;

    final paint39Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint39Fill.color = const Color(0x635ae2a0);
    paint39Fill.colorFilter = _colorFilter;
    paint39Fill.blendMode = BlendMode.srcOver;

    final paint40Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint40Fill.color = const Color(0x51dabe86);
    paint40Fill.colorFilter = _colorFilter;
    paint40Fill.blendMode = BlendMode.srcOver;

    final paint41Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint41Fill.color = const Color(0x8c81b927);
    paint41Fill.colorFilter = _colorFilter;
    paint41Fill.blendMode = BlendMode.srcOver;

    final paint42Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint42Fill.color = const Color(0xb76de548);
    paint42Fill.colorFilter = _colorFilter;
    paint42Fill.blendMode = BlendMode.srcOver;

    final paint43Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint43Fill.color = const Color(0xa5d552ef);
    paint43Fill.colorFilter = _colorFilter;
    paint43Fill.blendMode = BlendMode.srcOver;

    final paint44Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint44Fill.color = const Color(0x4788e665);
    paint44Fill.colorFilter = _colorFilter;
    paint44Fill.blendMode = BlendMode.srcOver;

    final paint45Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint45Fill.color = const Color(0xaf81b927);
    paint45Fill.colorFilter = _colorFilter;
    paint45Fill.blendMode = BlendMode.srcOver;

    final paint46Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint46Stroke.color = const Color(0xffc31d86);
    paint46Stroke.colorFilter = _colorFilter;
    paint46Stroke.strokeWidth = 6.3169;
    paint46Stroke.blendMode = BlendMode.srcOver;

    final paint47Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint47Fill.color = const Color(0x4c5ae2a0);
    paint47Fill.colorFilter = _colorFilter;
    paint47Fill.blendMode = BlendMode.srcOver;

    final paint48Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint48Stroke.color = const Color(0xff88e665);
    paint48Stroke.colorFilter = _colorFilter;
    paint48Stroke.strokeWidth = 1.592;
    paint48Stroke.blendMode = BlendMode.srcOver;

    final paint49Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint49Stroke.color = const Color(0xffd552ef);
    paint49Stroke.colorFilter = _colorFilter;
    paint49Stroke.strokeWidth = 2.737;
    paint49Stroke.blendMode = BlendMode.srcOver;

    final paint50Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint50Stroke.color = const Color(0xffc31d86);
    paint50Stroke.colorFilter = _colorFilter;
    paint50Stroke.strokeWidth = 1.4515;
    paint50Stroke.blendMode = BlendMode.srcOver;

    final paint51Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint51Fill.color = const Color(0x992923d7);
    paint51Fill.colorFilter = _colorFilter;
    paint51Fill.blendMode = BlendMode.srcOver;

    final paint52Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint52Fill.color = const Color(0x8eb5e873);
    paint52Fill.colorFilter = _colorFilter;
    paint52Fill.blendMode = BlendMode.srcOver;

    final paint53Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint53Fill.color = const Color(0xaaea342e);
    paint53Fill.colorFilter = _colorFilter;
    paint53Fill.blendMode = BlendMode.srcOver;

    final paint54Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint54Fill.color = const Color(0x4cea342e);
    paint54Fill.colorFilter = _colorFilter;
    paint54Fill.blendMode = BlendMode.srcOver;

    final paint55Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint55Stroke.color = const Color(0xffb5e873);
    paint55Stroke.colorFilter = _colorFilter;
    paint55Stroke.strokeWidth = 4.7124;
    paint55Stroke.blendMode = BlendMode.srcOver;

    final paint56Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint56Fill.color = const Color(0xed6de548);
    paint56Fill.colorFilter = _colorFilter;
    paint56Fill.blendMode = BlendMode.srcOver;

    final paint57Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint57Fill.color = const Color(0x68c31d86);
    paint57Fill.colorFilter = _colorFilter;
    paint57Fill.blendMode = BlendMode.srcOver;

    final paint58Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint58Fill.color = const Color(0xbc5ae2a0);
    paint58Fill.colorFilter = _colorFilter;
    paint58Fill.blendMode = BlendMode.srcOver;

    final paint59Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint59Fill.color = const Color(0x9e7af5ab);
    paint59Fill.colorFilter = _colorFilter;
    paint59Fill.blendMode = BlendMode.srcOver;

    final paint60Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint60Fill.shader = shader2;
    paint60Fill.colorFilter = _colorFilter;
    paint60Fill.blendMode = BlendMode.srcOver;

    final paint61Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint61Fill.shader = shader3;
    paint61Fill.colorFilter = _colorFilter;
    paint61Fill.blendMode = BlendMode.srcOver;

    final paint62Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint62Fill.color = const Color(0x47b5e873);
    paint62Fill.colorFilter = _colorFilter;
    paint62Fill.blendMode = BlendMode.srcOver;

    final paint63Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint63Fill.shader = shader4;
    paint63Fill.colorFilter = _colorFilter;
    paint63Fill.blendMode = BlendMode.srcOver;

    final paint64Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint64Stroke.color = const Color(0xffb5e873);
    paint64Stroke.colorFilter = _colorFilter;
    paint64Stroke.strokeWidth = 3.0965;
    paint64Stroke.blendMode = BlendMode.srcOver;

    final paint65Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint65Fill.shader = shader5;
    paint65Fill.colorFilter = _colorFilter;
    paint65Fill.blendMode = BlendMode.srcOver;

    final paint66Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint66Fill.color = const Color(0xd8c31d86);
    paint66Fill.colorFilter = _colorFilter;
    paint66Fill.blendMode = BlendMode.srcOver;

    final paint67Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint67Fill.color = const Color(0x44d552ef);
    paint67Fill.colorFilter = _colorFilter;
    paint67Fill.blendMode = BlendMode.srcOver;

    final paint68Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint68Fill.color = const Color(0x7f2923d7);
    paint68Fill.colorFilter = _colorFilter;
    paint68Fill.blendMode = BlendMode.srcOver;

    final paint69Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint69Fill.color = const Color(0x686de548);
    paint69Fill.colorFilter = _colorFilter;
    paint69Fill.blendMode = BlendMode.srcOver;

    final paint70Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint70Fill.color = const Color(0x726de548);
    paint70Fill.colorFilter = _colorFilter;
    paint70Fill.blendMode = BlendMode.srcOver;

    final paint71Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint71Fill.color = const Color(0xd87af5ab);
    paint71Fill.colorFilter = _colorFilter;
    paint71Fill.blendMode = BlendMode.srcOver;

    final paint72Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint72Stroke.color = const Color(0xff88e665);
    paint72Stroke.colorFilter = _colorFilter;
    paint72Stroke.strokeWidth = 3.8263;
    paint72Stroke.blendMode = BlendMode.srcOver;

    final paint73Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint73Fill.shader = shader6;
    paint73Fill.colorFilter = _colorFilter;
    paint73Fill.blendMode = BlendMode.srcOver;

    final paint74Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint74Fill.shader = shader7;
    paint74Fill.colorFilter = _colorFilter;
    paint74Fill.blendMode = BlendMode.srcOver;

    final paint75Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint75Stroke.color = const Color(0xff7af5ab);
    paint75Stroke.colorFilter = _colorFilter;
    paint75Stroke.strokeWidth = 5.3609;
    paint75Stroke.blendMode = BlendMode.srcOver;

    final paint76Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint76Fill.shader = shader8;
    paint76Fill.colorFilter = _colorFilter;
    paint76Fill.blendMode = BlendMode.srcOver;

    final paint77Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint77Stroke.color = const Color(0xff7af5ab);
    paint77Stroke.colorFilter = _colorFilter;
    paint77Stroke.strokeWidth = 2.56;
    paint77Stroke.blendMode = BlendMode.srcOver;

    final paint78Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint78Fill.color = const Color(0x896de548);
    paint78Fill.colorFilter = _colorFilter;
    paint78Fill.blendMode = BlendMode.srcOver;

    final paint79Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint79Fill.color = const Color(0xaa51dae1);
    paint79Fill.colorFilter = _colorFilter;
    paint79Fill.blendMode = BlendMode.srcOver;

    final paint80Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint80Stroke.color = const Color(0xff5ae2a0);
    paint80Stroke.colorFilter = _colorFilter;
    paint80Stroke.strokeWidth = 3.3324;
    paint80Stroke.blendMode = BlendMode.srcOver;

    final paint81Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint81Fill.color = const Color(0xe22923d7);
    paint81Fill.colorFilter = _colorFilter;
    paint81Fill.blendMode = BlendMode.srcOver;

    final paint82Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint82Fill.color = const Color(0xdd81b927);
    paint82Fill.colorFilter = _colorFilter;
    paint82Fill.blendMode = BlendMode.srcOver;

    final paint83Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint83Fill.color = const Color(0xaadabe86);
    paint83Fill.colorFilter = _colorFilter;
    paint83Fill.blendMode = BlendMode.srcOver;

    final paint84Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint84Stroke.color = const Color(0xffc31d86);
    paint84Stroke.colorFilter = _colorFilter;
    paint84Stroke.strokeWidth = 1.9081;
    paint84Stroke.blendMode = BlendMode.srcOver;

    final paint85Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint85Stroke.color = const Color(0xff88e665);
    paint85Stroke.colorFilter = _colorFilter;
    paint85Stroke.strokeWidth = 2.862;
    paint85Stroke.blendMode = BlendMode.srcOver;

    final paint86Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint86Stroke.color = const Color(0xff81b927);
    paint86Stroke.colorFilter = _colorFilter;
    paint86Stroke.strokeWidth = 3.0873;
    paint86Stroke.blendMode = BlendMode.srcOver;

    final paint87Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint87Stroke.color = const Color(0xffd552ef);
    paint87Stroke.colorFilter = _colorFilter;
    paint87Stroke.strokeWidth = 2.0504;
    paint87Stroke.blendMode = BlendMode.srcOver;

    final paint88Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint88Stroke.color = const Color(0xff81b927);
    paint88Stroke.colorFilter = _colorFilter;
    paint88Stroke.strokeWidth = 4.5465;
    paint88Stroke.blendMode = BlendMode.srcOver;

    final paint89Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint89Fill.color = const Color(0xe2b5e873);
    paint89Fill.colorFilter = _colorFilter;
    paint89Fill.blendMode = BlendMode.srcOver;

    final paint90Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint90Fill.color = const Color(0x4488e665);
    paint90Fill.colorFilter = _colorFilter;
    paint90Fill.blendMode = BlendMode.srcOver;

    final paint91Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint91Stroke.color = const Color(0xffc31d86);
    paint91Stroke.colorFilter = _colorFilter;
    paint91Stroke.strokeWidth = 1.6236;
    paint91Stroke.blendMode = BlendMode.srcOver;

    final paint92Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint92Stroke.color = const Color(0xff51dae1);
    paint92Stroke.colorFilter = _colorFilter;
    paint92Stroke.strokeWidth = 2.9194;
    paint92Stroke.blendMode = BlendMode.srcOver;

    final paint93Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint93Stroke.color = const Color(0xff2923d7);
    paint93Stroke.colorFilter = _colorFilter;
    paint93Stroke.strokeWidth = 2.0509;
    paint93Stroke.blendMode = BlendMode.srcOver;

    final paint94Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint94Fill.shader = shader9;
    paint94Fill.colorFilter = _colorFilter;
    paint94Fill.blendMode = BlendMode.srcOver;

    final paint95Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint95Fill.shader = shader10;
    paint95Fill.colorFilter = _colorFilter;
    paint95Fill.blendMode = BlendMode.srcOver;

    final paint96Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint96Fill.color = const Color(0xa881b927);
    paint96Fill.colorFilter = _colorFilter;
    paint96Fill.blendMode = BlendMode.srcOver;

    final paint97Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint97Fill.color = const Color(0xd1dabe86);
    paint97Fill.colorFilter = _colorFilter;
    paint97Fill.blendMode = BlendMode.srcOver;

    final paint98Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint98Fill.color = const Color(0x42dabe86);
    paint98Fill.colorFilter = _colorFilter;
    paint98Fill.blendMode = BlendMode.srcOver;

    final paint99Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint99Stroke.color = const Color(0xffb5e873);
    paint99Stroke.colorFilter = _colorFilter;
    paint99Stroke.strokeWidth = 2.7108;
    paint99Stroke.blendMode = BlendMode.srcOver;

    final paint100Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint100Fill.color = const Color(0x5b51dae1);
    paint100Fill.colorFilter = _colorFilter;
    paint100Fill.blendMode = BlendMode.srcOver;

    final paint101Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint101Fill.color = const Color(0xb551dae1);
    paint101Fill.colorFilter = _colorFilter;
    paint101Fill.blendMode = BlendMode.srcOver;

    final paint102Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint102Fill.color = const Color(0x91b5e873);
    paint102Fill.colorFilter = _colorFilter;
    paint102Fill.blendMode = BlendMode.srcOver;

    final paint103Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint103Fill.color = const Color(0xcc88e665);
    paint103Fill.colorFilter = _colorFilter;
    paint103Fill.blendMode = BlendMode.srcOver;

    final paint104Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint104Stroke.color = const Color(0xff81b927);
    paint104Stroke.colorFilter = _colorFilter;
    paint104Stroke.strokeWidth = 1.4508;
    paint104Stroke.blendMode = BlendMode.srcOver;

    final paint105Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint105Fill.color = const Color(0x8488e665);
    paint105Fill.colorFilter = _colorFilter;
    paint105Fill.blendMode = BlendMode.srcOver;

    final paint106Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint106Fill.shader = shader11;
    paint106Fill.colorFilter = _colorFilter;
    paint106Fill.blendMode = BlendMode.srcOver;

    final paint107Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint107Fill.shader = shader12;
    paint107Fill.colorFilter = _colorFilter;
    paint107Fill.blendMode = BlendMode.srcOver;

    final paint108Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint108Stroke.color = const Color(0xffea342e);
    paint108Stroke.colorFilter = _colorFilter;
    paint108Stroke.strokeWidth = 3.87;
    paint108Stroke.blendMode = BlendMode.srcOver;

    final paint109Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint109Fill.color = const Color(0xba5ae2a0);
    paint109Fill.colorFilter = _colorFilter;
    paint109Fill.blendMode = BlendMode.srcOver;

    final paint110Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint110Fill.color = const Color(0xe56de548);
    paint110Fill.colorFilter = _colorFilter;
    paint110Fill.blendMode = BlendMode.srcOver;

    final paint111Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint111Fill.shader = shader13;
    paint111Fill.colorFilter = _colorFilter;
    paint111Fill.blendMode = BlendMode.srcOver;

    final paint112Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint112Fill.color = const Color(0xc6ea342e);
    paint112Fill.colorFilter = _colorFilter;
    paint112Fill.blendMode = BlendMode.srcOver;

    final paint113Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint113Fill.color = const Color(0x427af5ab);
    paint113Fill.colorFilter = _colorFilter;
    paint113Fill.blendMode = BlendMode.srcOver;

    final paint114Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint114Fill.color = const Color(0xefc31d86);
    paint114Fill.colorFilter = _colorFilter;
    paint114Fill.blendMode = BlendMode.srcOver;

    final paint115Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint115Stroke.color = const Color(0xff7af5ab);
    paint115Stroke.colorFilter = _colorFilter;
    paint115Stroke.strokeWidth = 2.2496;
    paint115Stroke.blendMode = BlendMode.srcOver;

    final paint116Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint116Fill.color = const Color(0x5688e665);
    paint116Fill.colorFilter = _colorFilter;
    paint116Fill.blendMode = BlendMode.srcOver;

    final paint117Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint117Fill.color = const Color(0x38b5e873);
    paint117Fill.colorFilter = _colorFilter;
    paint117Fill.blendMode = BlendMode.srcOver;

    final paint118Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint118Stroke.color = const Color(0xff2923d7);
    paint118Stroke.colorFilter = _colorFilter;
    paint118Stroke.strokeWidth = 1.5046;
    paint118Stroke.blendMode = BlendMode.srcOver;

    final paint119Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint119Fill.shader = shader14;
    paint119Fill.colorFilter = _colorFilter;
    paint119Fill.blendMode = BlendMode.srcOver;

    final paint120Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint120Stroke.color = const Color(0xffc31d86);
    paint120Stroke.colorFilter = _colorFilter;
    paint120Stroke.strokeWidth = 4.9778;
    paint120Stroke.blendMode = BlendMode.srcOver;

    final paint121Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint121Fill.color = const Color(0x822923d7);
    paint121Fill.colorFilter = _colorFilter;
    paint121Fill.blendMode = BlendMode.srcOver;

    final paint122Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint122Stroke.color = const Color(0xffdabe86);
    paint122Stroke.colorFilter = _colorFilter;
    paint122Stroke.strokeWidth = 2.3;
    paint122Stroke.blendMode = BlendMode.srcOver;

    final paint123Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint123Fill.color = const Color(0xf7c31d86);
    paint123Fill.colorFilter = _colorFilter;
    paint123Fill.blendMode = BlendMode.srcOver;

    final paint124Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint124Fill.shader = shader15;
    paint124Fill.colorFilter = _colorFilter;
    paint124Fill.blendMode = BlendMode.srcOver;

    final paint125Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint125Fill.color = const Color(0xc67af5ab);
    paint125Fill.colorFilter = _colorFilter;
    paint125Fill.blendMode = BlendMode.srcOver;

    final paint126Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint126Fill.color = const Color(0xf251dae1);
    paint126Fill.colorFilter = _colorFilter;
    paint126Fill.blendMode = BlendMode.srcOver;

    final paint127Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint127Fill.color = const Color(0x6b88e665);
    paint127Fill.colorFilter = _colorFilter;
    paint127Fill.blendMode = BlendMode.srcOver;

    final paint128Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint128Fill.color = const Color(0xa35ae2a0);
    paint128Fill.colorFilter = _colorFilter;
    paint128Fill.blendMode = BlendMode.srcOver;

    final paint129Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint129Fill.color = const Color(0x4cd552ef);
    paint129Fill.colorFilter = _colorFilter;
    paint129Fill.blendMode = BlendMode.srcOver;

    final paint130Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint130Fill.color = const Color(0xf451dae1);
    paint130Fill.colorFilter = _colorFilter;
    paint130Fill.blendMode = BlendMode.srcOver;

    final paint131Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint131Stroke.color = const Color(0xff6de548);
    paint131Stroke.colorFilter = _colorFilter;
    paint131Stroke.strokeWidth = 3.6718;
    paint131Stroke.blendMode = BlendMode.srcOver;

    final paint132Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint132Fill.color = const Color(0xa3d552ef);
    paint132Fill.colorFilter = _colorFilter;
    paint132Fill.blendMode = BlendMode.srcOver;

    final paint133Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint133Fill.color = const Color(0x9b7af5ab);
    paint133Fill.colorFilter = _colorFilter;
    paint133Fill.blendMode = BlendMode.srcOver;

    final paint134Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint134Stroke.color = const Color(0xff2923d7);
    paint134Stroke.colorFilter = _colorFilter;
    paint134Stroke.strokeWidth = 5.1016;
    paint134Stroke.blendMode = BlendMode.srcOver;

    final paint135Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint135Stroke.color = const Color(0xffdabe86);
    paint135Stroke.colorFilter = _colorFilter;
    paint135Stroke.strokeWidth = 3.5897;
    paint135Stroke.blendMode = BlendMode.srcOver;

    final paint136Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint136Fill.color = const Color(0xd1ea342e);
    paint136Fill.colorFilter = _colorFilter;
    paint136Fill.blendMode = BlendMode.srcOver;

    final paint137Stroke = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    paint137Stroke.color = const Color(0xff88e665);
    paint137Stroke.colorFilter = _colorFilter;
    paint137Stroke.strokeWidth = 6.2041;
    paint137Stroke.blendMode = BlendMode.srcOver;

    final paint138Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint138Fill.color = const Color(0x0f000000);
    paint138Fill.colorFilter = _colorFilter;
    paint138Fill.blendMode = BlendMode.srcOver;

    final paint139Fill = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    paint139Fill.color = const Color(0xff000000);
    paint139Fill.colorFilter = _colorFilter;
    paint139Fill.blendMode = BlendMode.srcOver;

    final path_0 = Path()
      ..moveTo(69.1, 54.4)
      ..cubicTo(71.5836, 54.4, 73.6, 56.4164, 73.6, 58.9)
      ..cubicTo(73.6, 61.3836, 71.5836, 63.4, 69.1, 63.4)
      ..cubicTo(66.6164, 63.4, 64.6, 61.3836, 64.6, 58.9)
      ..cubicTo(64.6, 56.4164, 66.6164, 54.4, 69.1, 54.4)
      ..close();

    final path_1 = Path()
      ..moveTo(21.4342, 155.149)
      ..cubicTo(36.4597, 162.5341, 96.6232, 143.254, 111.8475, 141.2581)
      ..cubicTo(114.0476, 142.4795, 118.8419, 130.573, 104.8797, 121.0558)
      ..cubicTo(85.4128, 124.8902, 12.6119, 152.7528, 23.6934, 144.631)
      ..cubicTo(46.516, 140.7466, 74.5191, 119.431, 70.7486, 129.7722)
      ..cubicTo(80.3149, 125.886, 61.3921, 128.4774, 58.5447, 123.4385)
      ..cubicTo(84.4459, 134.3598, 73.9865, 135.7637, 51.364, 134.6088)
      ..cubicTo(60.2008, 125.903, 118.1264, 103.7617, 119.1965, 99.3527)
      ..cubicTo(113.1466, 109.6056, 147.7559, 170.3167, 160.3381, 169.0614)
      ..cubicTo(153.0629, 170.6878, 24.4874, 120.2029, 44.232, 123.2917)
      ..cubicTo(31.0338, 135.5359, 131.5669, 133.8115, 151.3901, 142.315)
      ..close();

    final path_2 = Path()
      ..moveTo(251.6174, -26.3463)
      ..cubicTo(237.0406, -7.9631, 192.6219, -19.2296, 218.9117, -18.115)
      ..cubicTo(199.8344, -25.4488, 224.3871, -56.9952, 214.465, -64.0656)
      ..cubicTo(220.2495, -67.5204, 176.8524, -27.9407, 173.467, -12.5981)
      ..cubicTo(157.4654, 9.3852, 152.9446, 47.1191, 179.9298, 36.236)
      ..cubicTo(147.6503, 41.9328, 158.0027, 1.6608, 175.5767, -19.5013)
      ..cubicTo(155.7035, -18.3422, 128.8025, 14.6887, 143.9569, 10.6479)
      ..cubicTo(172.9191, 3.8211, 130.4625, -18.7701, 146.4288, -27.125)
      ..cubicTo(146.2992, -15.3298, 89.418, 43.4007, 108.2835, 17.9781)
      ..cubicTo(122.1458, 6.5781, 89.0668, 42.7539, 107.0232, 18.9765)
      ..cubicTo(104.2301, 29.6007, 211.1581, -16.6269, 213.4915, -33.4921);

    final path_3 = Path()
      ..moveTo(87.1461, 107.7395)
      ..cubicTo(93.4084, 109.5952, 64.0412, 97.9995, 62.1722, 96.6889)
      ..cubicTo(63.8803, 102.7176, 48.9683, 122.5023, 50.5419, 125.3331)
      ..cubicTo(49.4804, 125.2388, 40.3329, 76.3594, 38.5554, 66.2417)
      ..cubicTo(47.8764, 82.2727, 83.7601, 67.6462, 76.8781, 59.0698)
      ..cubicTo(78.9246, 75.5831, 69.7077, 108.7567, 73.1295, 113.0973)
      ..cubicTo(69.8261, 133.2489, 73.5469, 99.8342, 65.7938, 103.3362)
      ..cubicTo(55.6639, 98.7859, 68.2913, 60.2861, 62.6768, 69.6385)
      ..cubicTo(55.2369, 62.7292, 59.6797, 133.8781, 68.5896, 144.6143)
      ..cubicTo(59.1758, 150.0874, 97.3623, 84.2433, 92.0811, 84.841)
      ..close();

    final path_4 = Path()
      ..moveTo(-76.9546, -62.1711)
      ..cubicTo(-86.29, -67.2683, -79.0825, -82.3523, -82.085, -83.3603)
      ..cubicTo(-78.3147, -89.5802, -70.2552, -42.6306, -67.5272, -47.3709)
      ..cubicTo(-53.6686, -34.0729, -98.5459, -92.5786, -86.9766, -88.6279)
      ..cubicTo(-85.0105, -90.1656, 4.4777, -24.4824, -3.0864, -33.0903)
      ..cubicTo(7.6903, -10.597, -32.7967, -79.5769, -30.373, -65.3428)
      ..cubicTo(-36.4994, -75.5097, 2.9106, -22.6434, -4.4898, -27.9166)
      ..cubicTo(5.2089, -12.3448, -13.5129, -23.2703, -10.2836, -12.2688)
      ..cubicTo(-13.035, -10.0018, -27.173, -71.3637, -15.7183, -51.6325)
      ..cubicTo(-0.3936, -32.2533, -25.6762, -62.0481, -18.7749, -39.7736)
      ..cubicTo(-12.5098, -14.9572, -39.5808, -89.4848, -53.7031, -107.3895);

    final path_5 = Path()
      ..moveTo(197.1893, -0.3275)
      ..cubicTo(213.3754, -4.2443, 119.5079, 59.3026, 106.0528, 83.4091)
      ..cubicTo(80.254, 96.2745, 123.6523, 19.8408, 120.1132, 10.4222)
      ..cubicTo(137.171, 9.2549, 112.8822, 38.5699, 102.2659, 44.6019)
      ..cubicTo(75.49, 49.3728, 129.1628, 7.6179, 137.426, 2.7205)
      ..cubicTo(159.0065, -8.0802, 49.8694, 53.4123, 56.5518, 54.4679)
      ..cubicTo(59.7419, 45.6155, 152.3652, 8.7452, 159.4548, 8.122)
      ..cubicTo(148.4933, 29.6259, 71.0015, 43.6895, 72.5919, 53.1091)
      ..cubicTo(60.7078, 55.8902, 139.0139, 55.7494, 122.4415, 74.5373)
      ..close();

    final path_6 = Path()
      ..moveTo(31.0861, 133.197)
      ..cubicTo(32.3608, 133.0314, 33.4742, 133.5013, 33.5709, 134.2457)
      ..cubicTo(33.6675, 134.99, 32.7111, 135.7288, 31.4364, 135.8943)
      ..cubicTo(30.1617, 136.0599, 29.0483, 135.59, 28.9517, 134.8456)
      ..cubicTo(28.855, 134.1013, 29.8114, 133.3625, 31.0861, 133.197)
      ..close();

    final path_7 = Path()
      ..moveTo(162.3483, 58.901)
      ..cubicTo(140.0928, 63.4481, 191.2542, 37.8305, 170.6057, 44.775)
      ..cubicTo(191.3009, 39.7439, 112.9614, 9.2848, 94.0026, 14.9697)
      ..cubicTo(81.3405, 31.9011, 35.6208, 19.7035, 45.9784, 28.153)
      ..cubicTo(42.5732, 22.5795, 37.2532, 16.0956, 41.7279, 9.1112)
      ..cubicTo(36.0812, 10.3805, 20.4087, 87.1723, 23.2468, 83.6219)
      ..cubicTo(46.9081, 94.357, 19.1121, 34.1182, 20.8868, 36.3375)
      ..cubicTo(19.0249, 30.5522, 176.8719, 33.6566, 152.6994, 37.2063)
      ..cubicTo(147.2568, 46.8251, 123.2, 83.2678, 119.5697, 75.5241)
      ..cubicTo(117.5106, 75.7485, 42.2061, 28.6803, 64.9121, 35.5226)
      ..close();

    final path_8 = Path()
      ..moveTo(83.8296, -53.8505)
      ..cubicTo(78.9215, -55.7149, 78.4686, -66.5265, 82.819, -77.9789)
      ..cubicTo(87.1693, -89.4314, 94.6861, -97.2156, 99.5943, -95.3511)
      ..cubicTo(104.5024, -93.4867, 104.9553, -82.6751, 100.6049, -71.2227)
      ..cubicTo(96.2546, -59.7703, 88.7378, -51.986, 83.8296, -53.8505)
      ..close();

    final path_9 = Path()
      ..moveTo(-73.9488, 133.1737)
      ..cubicTo(-101.1217, 144.1592, 52.6781, 168.408, 36.7087, 161.4859)
      ..cubicTo(50.6282, 149.9833, -112.0105, 70.3533, -104.0985, 59.2246)
      ..cubicTo(-97.9442, 74.7962, -38.2673, 157.1106, -32.9132, 170.8134)
      ..cubicTo(-26.5853, 177.7915, 54.4131, 95.7066, 55.3997, 91.0388)
      ..cubicTo(55.4823, 65.8622, 18.0902, 162.8122, 8.2878, 173.5186)
      ..cubicTo(-2.9382, 160.844, -83.0301, 69.5481, -57.1862, 86.9708)
      ..cubicTo(-74.9712, 74.3648, -56.1707, 106.2045, -51.7986, 100.2911)
      ..close();

    final path_10 = Path()
      ..moveTo(17.9, 16.6)
      ..cubicTo(21.1, 30.2, 0, 97.3, 7.3, 86.4)
      ..cubicTo(5.2, 67.7, 2, 100, 16.2, 99.5)
      ..cubicTo(0, 100, 64.6, 0, 71.2, 8.8)
      ..cubicTo(71.4, 13.9, 83.8, 2.6, 75.1, 9.6)
      ..cubicTo(56.5, 0, 45.1, 38.9, 57.2, 51.4)
      ..cubicTo(46, 46.5, 92.2, 56.3, 96.9, 54.5)
      ..cubicTo(77.4, 54.6, 8.7, 45.5, 1.2, 44.8)
      ..cubicTo(0, 50.6, 81.5, 80.2, 85.4, 66.6)
      ..cubicTo(90, 84.9, 57.8, 0, 45.1, 8.5)
      ..cubicTo(61.5, 25.4, 14.7, 69.8, 29.6, 77.2)
      ..close();

    final path_11 = Path()
      ..moveTo(-50.1169, 23.8633)
      ..cubicTo(-58.6277, 51.1127, 22.8834, 5.1894, 35.069, -2.7197)
      ..cubicTo(22.4757, -1.4552, -71.5762, 62.8575, -60.8367, 60.6531)
      ..cubicTo(-62.1751, 78.0384, 1.2719, -10.2371, 9.3848, -26.8385)
      ..cubicTo(7.9288, -29.0726, 37.9858, 8.0564, 42.1236, -8.8185)
      ..cubicTo(37.5606, -13.6505, 8.2513, 24.677, -0.547, 32.9781)
      ..cubicTo(-7.7417, 21.4721, -54.8628, 62.3945, -65.3597, 78.2225)
      ..cubicTo(-78.6058, 72.4341, 3.0651, 64.6702, 11.2031, 46.8697)
      ..close();

    final path_12 = Path()
      ..moveTo(-1.368, 176.7422)
      ..cubicTo(6.1011, 185.3952, 3.9775, 199.4877, -6.1073, 208.1926)
      ..cubicTo(-16.1921, 216.8976, -30.4436, 216.9398, -37.9127, 208.2868)
      ..cubicTo(-45.3817, 199.6338, -43.2581, 185.5413, -33.1733, 176.8364)
      ..cubicTo(-23.0885, 168.1314, -8.837, 168.0892, -1.368, 176.7422)
      ..close();

    final path_13 = Path()
      ..moveTo(61.3, 22.4)
      ..lineTo(69.6, 22.4)
      ..cubicTo(75.3399, 22.4, 80, 27.0601, 80, 32.8)
      ..lineTo(80, 50.2)
      ..cubicTo(80, 55.9399, 75.3399, 60.6, 69.6, 60.6)
      ..lineTo(61.3, 60.6)
      ..cubicTo(55.5601, 60.6, 50.9, 55.9399, 50.9, 50.2)
      ..lineTo(50.9, 32.8)
      ..cubicTo(50.9, 27.0601, 55.5601, 22.4, 61.3, 22.4)
      ..close();

    final path_14 = Path()
      ..moveTo(17.2791, 168.7696)
      ..cubicTo(19.4666, 140.3752, -6.4902, 102.1581, -2.9679, 88.7538)
      ..cubicTo(23.5417, 111.015, 86.6577, 39.2352, 83.1658, 32.224)
      ..cubicTo(100.2158, 54.5077, 62.2824, 156.4649, 55.181, 183.4834)
      ..cubicTo(41.0694, 176.2741, 90.8032, 143.8405, 101.3563, 153.6847)
      ..cubicTo(108.2628, 178.8964, 21.4845, 144.5672, 17.3992, 127.3429)
      ..cubicTo(30.4979, 145.067, 24.558, 132.071, 40.0275, 142.9053)
      ..cubicTo(38.7869, 122.3033, 37.7784, 204.238, 26.4103, 184.249)
      ..cubicTo(23.8077, 200.643, 68.5579, 64.8245, 70.7569, 42.7793)
      ..cubicTo(78.2648, 77.0466, 13.2962, 40.628, 13.5755, 48.2425)
      ..close();

    final path_15 = Path()
      ..moveTo(53.2289, -50.6235)
      ..cubicTo(67.3149, -60.0862, 36.2188, 52.4936, 31.2069, 43.3502)
      ..cubicTo(36.5867, 41.9665, 50.4949, -51.1631, 56.1272, -44.0172)
      ..cubicTo(69.4069, -56.6675, 60.6065, -0.7267, 53.4865, 14.4794)
      ..cubicTo(62.0352, 15.3716, 110.9639, -39.2666, 102.202, -32.7433)
      ..cubicTo(106.5232, -41.3848, 85.1135, -47.6469, 79.0657, -33.7132)
      ..cubicTo(86.4694, -32.093, 54.9984, 19.5325, 53.1943, 19.6913)
      ..cubicTo(45.2219, 39.3324, 60.5075, -43.5843, 71.3212, -46.3259)
      ..cubicTo(65.1225, -55.908, 71.3315, -19.3098, 66.4421, -19.0936)
      ..cubicTo(58.5809, -5.2604, 11.793, 30.3953, 22.4844, 27.2131)
      ..close();

    final path_16 = Path()
      ..moveTo(-46.2641, 127.2326)
      ..cubicTo(-48.6573, 137.6851, 6.3989, 77.7227, 24.8424, 65.163)
      ..cubicTo(27.8934, 71.0366, -12.1466, 128.072, -29.7349, 133.7529)
      ..cubicTo(-22.9694, 121.9522, 33.9117, 89.6698, 25.6492, 94.4539)
      ..cubicTo(1.856, 103.5492, -122.0186, 154.0724, -124.5322, 162.9613)
      ..cubicTo(-133.293, 167.3935, -92.4552, 150.934, -89.2666, 144.1349)
      ..cubicTo(-113.8416, 146.0467, -73.8664, 95.9554, -57.7863, 88.5821)
      ..cubicTo(-64.4297, 81.1124, -47.2666, 100.3126, -28.989, 84.8578)
      ..cubicTo(-36.5334, 87.1022, -64.7224, 89.7327, -83.3419, 92.2209)
      ..close();

    final path_17 = Path()
      ..moveTo(69.9128, -28.8798)
      ..cubicTo(73.2909, -28.0872, -32.4745, 50.4181, -40.5972, 31.3996)
      ..cubicTo(-27.8091, 49.9537, -94.2336, -41.0317, -83.5826, -21.2652)
      ..cubicTo(-73.16, -29.209, -99.0847, -17.9643, -96.1113, 6.0819)
      ..cubicTo(-119.9174, 1.3773, -25.5948, -68.0789, -19.0634, -77.126)
      ..cubicTo(5.8342, -69.8804, -42.4084, -28.4442, -35.6148, -16.497)
      ..cubicTo(-23.414, 13.4509, 4.0502, -57.9582, 3.688, -45.4882)
      ..cubicTo(20.4126, -61.5214, -25.371, 41.8741, -31.7899, 20.9109)
      ..close();

    final path_18 = Path()
      ..moveTo(7.5, 32.4)
      ..cubicTo(0.1, 24, 54.7, 90.1, 52.3, 87)
      ..cubicTo(59.7, 100, 82.2, 43.4, 87.9, 46.7)
      ..cubicTo(100, 35.2, 53.8, 99.1, 39.9, 95)
      ..cubicTo(31.3, 99.6, 70.3, 14.6, 57.1, 28.9)
      ..cubicTo(75.5, 40.3, 12.9, 36.8, 26.8, 49.3)
      ..cubicTo(28.5, 38.1, 38.5, 82.3, 41.6, 89.7)
      ..close();

    final path_19 = Path()
      ..moveTo(140.6047, 225.9647)
      ..cubicTo(123.6175, 212.3202, 149.422, 80.71, 127.8232, 106.2587)
      ..cubicTo(117.4798, 120.7584, 244.2032, 167.7101, 215.8409, 162.7125)
      ..cubicTo(188.7017, 198.3188, 145.4863, 246.5882, 164.9645, 227.3484)
      ..cubicTo(130.0419, 213.8099, 156.6554, 65.0396, 148.446, 58.6637)
      ..cubicTo(161.7293, 53.6636, 157.3033, 112.0342, 163.1069, 125.1833)
      ..cubicTo(157.283, 89.9905, 173.695, 110.0258, 179.2261, 131.9296)
      ..close();

    final path_20 = Path()
      ..moveTo(-2.7496, -25.7319)
      ..cubicTo(-7.372, -21.3306, 57.9456, 61.8058, 59.9974, 71.4663)
      ..cubicTo(58.4751, 83.8357, 34.7621, 48.324, 27.1418, 39.1207)
      ..cubicTo(32.1659, 60.5397, 50.9811, 50.196, 44.0216, 41.5594)
      ..cubicTo(46.5407, 49.847, 52.0696, 19.4642, 52.7976, 13.4838)
      ..cubicTo(62.4822, 39.781, 53.4926, 54.0234, 67.1226, 65.6891)
      ..cubicTo(70.7206, 77.1037, 44.4715, 16.759, 30.481, -3.0788)
      ..close();

    final path_21 = Path()
      ..moveTo(53.5281, -67.615)
      ..cubicTo(31.4783, -73.2369, 98.4937, -71.4193, 90.6197, -50.777)
      ..cubicTo(120.5591, -56.0981, 61.0416, -87.8289, 51.7166, -78.9773)
      ..cubicTo(26.6157, -69.3551, 97.1088, -103.9533, 98.1811, -83.8373)
      ..cubicTo(99.726, -87.1819, 153.0786, -63.7604, 132.4955, -47.8922)
      ..cubicTo(131.1183, -56.3638, 0.8724, -48.8045, 3.6625, -40.6162)
      ..cubicTo(1.2589, -33.0674, 7.0392, -16.1468, 19.5106, -27.5101)
      ..cubicTo(17.5251, -23.2508, 96.8376, -125.4125, 115.9617, -138.7086)
      ..close();

    final path_22 = Path()
      ..moveTo(100.5094, 135.4856)
      ..cubicTo(79.9429, 124.1486, 67.352, 75.6565, 74.4816, 86.3282)
      ..cubicTo(84.2056, 97.5667, 10.4694, 101.1651, 11.498, 116.4121)
      ..cubicTo(-10.502, 127.1553, 134.6066, 146.3766, 139.6895, 130.1244)
      ..cubicTo(154.3346, 121.9273, 86.1826, 52.5185, 79.9624, 59.033)
      ..cubicTo(81.7077, 48.9077, 64.1, 34.7, 63.7857, 41.0613)
      ..cubicTo(74.4058, 60.1467, 60.8524, 95.8539, 74.2186, 86.4551)
      ..cubicTo(99.0309, 89.3453, 58.1279, 179.6492, 56.2504, 153.71)
      ..close();

    final path_23 = Path()
      ..moveTo(-51.6086, -3.3988)
      ..lineTo(-95.3449, 36.9598)
      ..lineTo(-117.0948, 13.3896)
      ..lineTo(-73.3586, -26.969)
      ..close();

    final path_24 = Path()
      ..moveTo(67.3, 34.6)
      ..cubicTo(56.5, 16.2, 36.7, 96.8, 47.5, 93.1)
      ..cubicTo(48.9, 81.1, 7.1, 92.6, 13.6, 97)
      ..cubicTo(8.9, 100, 22.2, 14.9, 8.9, 5.1)
      ..cubicTo(20.5, 9.6, 13.8, 3.3, 25.6, 3.8)
      ..cubicTo(6.1, 22.8, 13, 15.7, 18, 18)
      ..cubicTo(22.5, 28.3, 100, 70.5, 93, 79.2)
      ..cubicTo(89.5, 97, 92.4, 35.9, 81.5, 46.5)
      ..cubicTo(84.7, 51, 11.5, 24.8, 17.5, 27.7)
      ..cubicTo(32.4, 30, 41.8, 25, 44.1, 23.3)
      ..cubicTo(49.3, 37, 40, 55, 27.2, 68.3)
      ..close();

    final path_25 = Path()
      ..moveTo(86.4104, 94.9526)
      ..cubicTo(111.3202, 105.5331, 29.5426, 145.6548, 10.4961, 148.497)
      ..cubicTo(40.7206, 142.6353, 3.9489, 107.4441, 15.6713, 98.415)
      ..cubicTo(20.7781, 112.4101, 72.03, 88.8801, 51.1046, 93.9434)
      ..cubicTo(46.9858, 86.0778, 60.495, 115.4661, 53.7233, 120.2164)
      ..cubicTo(61.8195, 104.9216, -12.9618, 94.4898, -12.7293, 93.0345)
      ..cubicTo(-25.7076, 103.3335, 33.4315, 75.7019, 19.218, 66.6778)
      ..cubicTo(37.0018, 67.4031, 78.0956, 161.9101, 98.5374, 164.0364)
      ..cubicTo(94.6198, 182.8334, 72.1902, 143.0284, 79.323, 150.5861)
      ..close();

    final path_26 = Path()
      ..moveTo(166.5049, 25.1461)
      ..cubicTo(166.7033, 24.6371, 167.5558, 24.4933, 168.4074, 24.8253)
      ..cubicTo(169.2589, 25.1573, 169.7891, 25.8401, 169.5906, 26.3492)
      ..cubicTo(169.3921, 26.8583, 168.5397, 27.0021, 167.6881, 26.6701)
      ..cubicTo(166.8366, 26.3381, 166.3064, 25.6552, 166.5049, 25.1461)
      ..close();

    final path_27 = Path()
      ..moveTo(51.9035, 74.6963)
      ..cubicTo(55.8032, 68.5353, 72.7636, 154.6285, 67.3513, 147.0086)
      ..cubicTo(58.2764, 129.708, 46.816, 80.876, 43.9863, 82.9537)
      ..cubicTo(49.9755, 92.9189, 19.0575, 67.1863, 21.392, 78.279)
      ..cubicTo(21.2815, 64.369, 58.1997, 87.0109, 54.2769, 84.8253)
      ..cubicTo(59.4195, 89.025, 72.816, 72.0135, 71.7832, 75.0261)
      ..cubicTo(67.7311, 88.6804, 39.3964, 62.3723, 32.4006, 67.4048)
      ..close();

    final path_28 = Path()
      ..moveTo(28.5927, 78.1184)
      ..cubicTo(25.1944, 87.0593, 2.3169, 116.014, 8.7473, 106.1663)
      ..cubicTo(3.1792, 104.778, -26.2815, 111.778, -20.1473, 104.6233)
      ..cubicTo(-26.5781, 110.0318, 10.0676, 110.8897, 12.0001, 117.3659)
      ..cubicTo(11.6416, 106.7736, 36.4332, 126.2771, 27.6454, 128.5466)
      ..cubicTo(32.4659, 128.3689, 0.0374, 128.1125, -1.4826, 131.739)
      ..cubicTo(-13.1365, 138.6329, -5.1136, 94.9673, 0.6148, 97.2512)
      ..cubicTo(10.2867, 97.3984, -4.9485, 113.3297, -15.755, 111.4745)
      ..cubicTo(-21.7405, 106.0398, 40.9508, 117.0921, 31.7241, 113.9428)
      ..close();

    final path_29 = Path()
      ..moveTo(77.2, 60.3)
      ..cubicTo(80.9, 67.6, 72.5, 72.4, 86.8, 61.6)
      ..cubicTo(84.3, 71.8, 31.4, 81.1, 40.1, 93)
      ..cubicTo(32.2, 100, 55, 70.2, 63.9, 59.8)
      ..cubicTo(55.4, 41.5, 42.9, 78.1, 43.2, 81.5)
      ..cubicTo(58, 97.4, 0, 34.8, 7.9, 25)
      ..cubicTo(11.2, 30.9, 53.5, 35.6, 61.5, 40.1)
      ..close();

    final path_30 = Path()
      ..moveTo(-10.7425, 196.2411)
      ..cubicTo(-6.3357, 180.093, -70.828, 182.8169, -69.0885, 190.6527)
      ..cubicTo(-60.1881, 167.739, 50.5551, 150.3243, 55.0869, 136.707)
      ..cubicTo(51.3239, 153.0652, -60.9885, 178.2227, -67.5416, 187.6584)
      ..cubicTo(-56.002, 161.6806, 14.6531, 166.5766, 34.6684, 158.3056)
      ..cubicTo(24.2045, 168.2815, -55.9916, 184.7666, -63.6406, 177.5588)
      ..cubicTo(-40.3869, 175.9306, -29.6509, 161.7589, -35.9764, 176.4956)
      ..cubicTo(-56.2707, 173.5716, 12.6272, 114.1195, 33.0491, 100.2162)
      ..cubicTo(35.5151, 87.4049, -14.5087, 213.9218, -1.1847, 199.81)
      ..cubicTo(-28.333, 208.8928, -9.7321, 139.055, -2.3237, 137.2339)
      ..close();

    final path_31 = Path()
      ..moveTo(39.5782, -74.2106)
      ..lineTo(2.1594, -101.4968)
      ..lineTo(44.3429, -159.3449)
      ..lineTo(81.7617, -132.0586)
      ..close();

    final path_32 = Path()
      ..moveTo(-36.434, 37.0968)
      ..cubicTo(-16.6869, 17.1912, -59.877, 22.519, -62.8298, 8.1234)
      ..cubicTo(-44.2831, 12.1899, -174.32, 100.8824, -162.4527, 103.7802)
      ..cubicTo(-174.8826, 99.3856, -103.4703, 11.1788, -94.9179, 12.3004)
      ..cubicTo(-86.8736, 4.0207, -125.3423, 83.7869, -129.0641, 73.8852)
      ..cubicTo(-151.4236, 100.4231, -130.342, 136.3873, -122.074, 129.2061)
      ..cubicTo(-138.6768, 138.8631, -12.4458, 28.4745, -13.0887, 41.8563)
      ..close();

    final path_33 = Path()
      ..moveTo(85.1165, -4.1876)
      ..lineTo(82.6304, -10.9448)
      ..cubicTo(80.5036, -16.7253, 88.4759, -24.9869, 100.4223, -29.3823)
      ..lineTo(116.3072, -35.2268)
      ..cubicTo(128.2536, -39.6223, 139.6793, -38.4977, 141.8061, -32.7172)
      ..lineTo(144.2923, -25.9601)
      ..cubicTo(146.4191, -20.1795, 138.4468, -11.918, 126.5004, -7.5225)
      ..lineTo(110.6155, -1.678)
      ..cubicTo(98.6691, 2.7174, 87.2434, 1.5929, 85.1165, -4.1876)
      ..close();

    final path_34 = Path()
      ..moveTo(91.8, 44.3)
      ..cubicTo(100, 30.9, 32.4, 47.3, 42.7, 53.2)
      ..cubicTo(42.9, 34.3, 9.5, 44, 13.7, 49.8)
      ..cubicTo(5.9, 47.5, 0, 44.3, 0.2, 50.9)
      ..cubicTo(14.2, 33, 100, 10.9, 95.6, 15)
      ..cubicTo(88.7, 6.7, 68.5, 100, 59.1, 97.7)
      ..cubicTo(63.6, 80.6, 66.9, 0, 78.3, 12.7)
      ..cubicTo(96.2, 13.2, 16.3, 54.5, 2.5, 41.9)
      ..close();

    final path_35 = Path()
      ..moveTo(-63.1388, 22.7686)
      ..cubicTo(-64.0209, 21.6684, 19.4822, -22.1267, 35.7186, -29.6732)
      ..cubicTo(32.3539, -35.8585, 36.2232, -41.4278, 42.7472, -47.5371)
      ..cubicTo(51.3628, -58.2478, -32.2436, -9.7844, -31.7948, -17.2845)
      ..cubicTo(-6.8431, -14.346, -66.2051, 10.9323, -59.8123, 0.9432)
      ..cubicTo(-66.9551, 7.2458, -54.0996, -41.5059, -55.9755, -35.1972)
      ..cubicTo(-48.9168, -42.5603, 44.1157, -40.8109, 35.6485, -37.135)
      ..close();

    final path_36 = Path()
      ..moveTo(230.2154, 1.6613)
      ..lineTo(262.5666, -41.2702)
      ..lineTo(291.4772, -19.4845)
      ..lineTo(259.126, 23.447)
      ..close();

    final path_37 = Path()
      ..moveTo(54.9198, 200.3823)
      ..lineTo(69.2882, 237.2353)
      ..cubicTo(69.3153, 237.3047, 69.2813, 237.3829, 69.2124, 237.4098)
      ..lineTo(35.2541, 250.6496)
      ..cubicTo(35.1852, 250.6764, 35.1073, 250.6419, 35.0803, 250.5724)
      ..lineTo(20.7119, 213.7194)
      ..cubicTo(20.6848, 213.65, 20.7188, 213.5718, 20.7877, 213.545)
      ..lineTo(54.7459, 200.3052)
      ..cubicTo(54.8149, 200.2783, 54.8928, 200.3129, 54.9198, 200.3823)
      ..close();

    final path_38 = Path()
      ..moveTo(40.8, 53.4)
      ..lineTo(34.9, 53.4)
      ..cubicTo(44.2274, 53.4, 51.8, 60.9726, 51.8, 70.3)
      ..lineTo(51.8, 47.4)
      ..cubicTo(51.8, 56.7274, 44.2274, 64.3, 34.9, 64.3)
      ..lineTo(40.8, 64.3)
      ..cubicTo(31.4726, 64.3, 23.9, 56.7274, 23.9, 47.4)
      ..lineTo(23.9, 70.3)
      ..cubicTo(23.9, 60.9726, 31.4726, 53.4, 40.8, 53.4)
      ..close();

    final path_39 = Path()
      ..moveTo(-10.3982, 150.7039)
      ..cubicTo(-17.5152, 168.6469, -11.5561, 147.9766, -22.8276, 164.0271)
      ..cubicTo(-15.6494, 184.8063, -15.7841, 74.0814, -18.531, 98.1464)
      ..cubicTo(-19.4088, 93.159, -10.1446, 180.446, -1.9333, 173.348)
      ..cubicTo(-0.3395, 192.6744, -0.428, 146.3477, 4.9988, 151.5471)
      ..cubicTo(17.1902, 134.5296, 2.2527, 113.3995, 0.5649, 127.6809)
      ..cubicTo(7.598, 147.5087, -15.5869, 111.22, -5.9817, 107.2878)
      ..close();

    final path_40 = Path()
      ..moveTo(180.3332, 65.4178)
      ..lineTo(174.7861, 68.0874)
      ..cubicTo(184.3734, 63.4734, 193.6601, 62.8504, 195.5115, 66.6972)
      ..lineTo(192.9182, 61.3087)
      ..cubicTo(194.7695, 65.1555, 188.4889, 72.0246, 178.9016, 76.6386)
      ..lineTo(184.4486, 73.969)
      ..cubicTo(174.8613, 78.5831, 165.5746, 79.206, 163.7233, 75.3593)
      ..lineTo(166.3166, 80.7477)
      ..cubicTo(164.4652, 76.901, 170.7459, 70.0319, 180.3332, 65.4178)
      ..close();

    final path_41 = Path()
      ..moveTo(120.6715, 22.9625)
      ..lineTo(156.9196, 18.7684)
      ..cubicTo(159.7498, 18.441, 162.2864, 20.2404, 162.5807, 22.7843)
      ..lineTo(163.9416, 34.5459)
      ..cubicTo(164.2359, 37.0898, 162.1772, 39.421, 159.3471, 39.7484)
      ..lineTo(123.099, 43.9425)
      ..cubicTo(120.2688, 44.2699, 117.7322, 42.4705, 117.4379, 39.9265)
      ..lineTo(116.077, 28.165)
      ..cubicTo(115.7827, 25.6211, 117.8414, 23.2899, 120.6715, 22.9625)
      ..close();

    final path_42 = Path()
      ..moveTo(68.5154, 154.9512)
      ..cubicTo(69.5449, 156.0514, 68.0859, 159.092, 65.2594, 161.737)
      ..cubicTo(62.4328, 164.3821, 59.3022, 165.6363, 58.2727, 164.5362)
      ..cubicTo(57.2432, 163.436, 58.7021, 160.3954, 61.5287, 157.7504)
      ..cubicTo(64.3552, 155.1053, 67.4859, 153.851, 68.5154, 154.9512)
      ..close();

    final path_43 = Path()
      ..moveTo(131.4121, -63.8917)
      ..cubicTo(124.7967, -91.8707, 182.4622, -17.1207, 174.2725, -23.8976)
      ..cubicTo(154.1928, -24.3006, 171.7481, 12.6511, 176.0128, -0.9528)
      ..cubicTo(194.022, 1.0066, 163.7926, -57.1233, 165.5145, -66.3962)
      ..cubicTo(166.9158, -75.9756, 63.2111, -58.5687, 52.7321, -35.397)
      ..cubicTo(51.2241, -60.0429, 90.4749, -45.6498, 69.6973, -46.1619)
      ..cubicTo(93.1669, -48.163, 130.3141, -9.2895, 137.007, -10.8927)
      ..cubicTo(103.9207, -18.398, 156.2826, -60.1481, 154.5254, -38.3765)
      ..cubicTo(149.0843, -32.8463, 159.4781, -27.0637, 147.6601, -40.4746)
      ..cubicTo(144.79, -67.726, 73.3988, -54.1001, 83.5814, -55.1581)
      ..cubicTo(54.5259, -64.4547, 125.1845, -9.2934, 119.5832, -21.8469)
      ..close();

    final path_44 = Path()
      ..moveTo(13.6209, 190.1193)
      ..lineTo(13.3739, 225.4904)
      ..cubicTo(13.3625, 227.124, 12.8962, 228.4471, 12.3333, 228.4432)
      ..lineTo(-4.3433, 228.3268)
      ..cubicTo(-4.9062, 228.3228, -5.354, 226.9934, -5.3426, 225.3597)
      ..lineTo(-5.0957, 189.9886)
      ..cubicTo(-5.0843, 188.355, -4.618, 187.0319, -4.055, 187.0358)
      ..lineTo(12.6216, 187.1522)
      ..cubicTo(13.1845, 187.1561, 13.6323, 188.4856, 13.6209, 190.1193)
      ..close();

    final path_45 = Path()
      ..moveTo(33.9758, 128.6389)
      ..cubicTo(29.7864, 117.0692, -33.4843, 64.9047, -23.8011, 73.4956)
      ..cubicTo(-33.948, 54.5797, -45.1954, 99.5948, -47.264, 94.6257)
      ..cubicTo(-51.8115, 75.2414, -0.892, 174.4024, 5.9927, 162.5515)
      ..cubicTo(-11.0551, 140.9079, 37.5887, 155.4948, 48.6922, 154.1483)
      ..cubicTo(42.9011, 170.037, -23.8917, 126.1632, -37.8373, 116.4095)
      ..cubicTo(-37.4129, 117.5791, 38.2643, 106.6339, 27.9398, 102.9819)
      ..cubicTo(32.8903, 111.9668, 22.3137, 94.8908, 6.2574, 80.6373)
      ..cubicTo(-2.5727, 55.8887, -55.8199, 62.3904, -49.9144, 59.9853)
      ..cubicTo(-35.7914, 62.595, -13.7579, 64.7889, -11.6024, 59.1947)
      ..cubicTo(-18.3198, 61.8009, 14.7239, 68.8537, 9.3887, 51.6147);

    final path_46 = Path()
      ..moveTo(67.037, 43.9533)
      ..cubicTo(80.4738, 35.9632, 86.3699, 61.6086, 87.3765, 54.3344)
      ..cubicTo(78.9539, 41.5025, 53.8498, 27.5013, 44.2958, 34.1647)
      ..cubicTo(51.3798, 35.188, 49.8444, 5.3356, 57.7489, -0.4404)
      ..cubicTo(58.1916, -2.6771, 8.7599, 22.9771, 19.1818, 17.4208)
      ..cubicTo(16.4277, 24.4484, 54.0913, -40.6556, 40.0293, -39.3742)
      ..cubicTo(39.762, -56.131, 36.4447, -28.2899, 39.8641, -12.3793)
      ..cubicTo(56.3842, -24.6387, 72.5503, -25.7529, 59.0661, -25.6692);

    final path_47 = Path()
      ..moveTo(126.161, 106.8533)
      ..cubicTo(136.2678, 98.8599, 82.7661, 56.864, 84.9265, 69.2519)
      ..cubicTo(98.116, 62.6175, 110.0579, 86.0876, 95.7165, 84.58)
      ..cubicTo(63.8602, 73.6536, 104.0452, 105.896, 101.8373, 101.7458)
      ..cubicTo(124.5771, 101.9556, 41.5469, 50.313, 13.3742, 47.5361)
      ..cubicTo(31.1513, 51.1422, 167.8692, 48.401, 185.2769, 63.7594)
      ..cubicTo(182.5667, 56.8582, 150.8792, 92.0423, 151.0389, 83.4468)
      ..cubicTo(153.6065, 78.9854, 167.3508, 108.5221, 159.9666, 112.1814)
      ..cubicTo(133.3951, 108.6488, 82.8747, 72.0671, 76.0833, 70.7248)
      ..cubicTo(51.4716, 50.9867, 72.8227, 91.0813, 53.3341, 87.9606)
      ..cubicTo(22.641, 67.1026, 56.4392, 89.2481, 65.1323, 93.2299)
      ..close();

    final path_48 = Path()
      ..moveTo(50.0896, 153.6588)
      ..cubicTo(55.7602, 141.9251, 23.9242, 132.5934, 20.3966, 118.6258)
      ..cubicTo(16.0389, 138.0295, 12.7631, 46.012, 9.4786, 59.8363)
      ..cubicTo(7.4787, 47.6074, 8.57, 47.2779, 13.6224, 50.5189)
      ..cubicTo(13.0935, 57.2783, 44.7107, 55.921, 42.6682, 49.5713)
      ..cubicTo(35.8049, 61.2986, 42.9888, 147.3698, 48.3567, 156.0153)
      ..cubicTo(57.2083, 150.043, 47.4605, 95.5444, 37.9213, 94.8801)
      ..close();

    final path_49 = Path()
      ..moveTo(100.4446, 75.339)
      ..cubicTo(84.958, 90.6773, 64.7313, 96.0336, 46.5331, 87.9877)
      ..cubicTo(41.8778, 110.4913, 156.8968, 140.5509, 151.0651, 142.9696)
      ..cubicTo(137.8671, 154.5089, 63.0544, 73.6721, 55.1605, 68.8159)
      ..cubicTo(38.3978, 94.6634, 63.9811, 153.1378, 63.1479, 145.1381)
      ..cubicTo(51.8669, 147.5048, 80.3971, 117.8198, 78.4435, 104.7249)
      ..cubicTo(69.0225, 87.1346, 132.6993, 61.5419, 138.3056, 65.9918)
      ..cubicTo(145.7108, 56.5217, 87.7015, 80.5274, 99.6468, 93.8122)
      ..cubicTo(113.333, 86.598, 123.7049, 68.5201, 136.022, 48.7643)
      ..close();

    final path_50 = Path()
      ..moveTo(118.239, -11.059)
      ..lineTo(107.5791, -35.8111)
      ..cubicTo(104.7138, -42.4642, 106.647, -49.7001, 111.8935, -51.9596)
      ..lineTo(128.1169, -58.9465)
      ..cubicTo(133.3634, -61.206, 139.9491, -57.6389, 142.8143, -50.9858)
      ..lineTo(153.4743, -26.2337)
      ..cubicTo(156.3396, -19.5806, 154.4064, -12.3447, 149.1599, -10.0852)
      ..lineTo(132.9365, -3.0983)
      ..cubicTo(127.69, -0.8388, 121.1043, -4.4059, 118.239, -11.059)
      ..close();

    final path_51 = Path()
      ..moveTo(34.3, 55)
      ..lineTo(65.1, 55)
      ..cubicTo(66.5902, 55, 67.8, 56.2098, 67.8, 57.7)
      ..lineTo(67.8, 67.4)
      ..cubicTo(67.8, 68.8902, 66.5902, 70.1, 65.1, 70.1)
      ..lineTo(34.3, 70.1)
      ..cubicTo(32.8098, 70.1, 31.6, 68.8902, 31.6, 67.4)
      ..lineTo(31.6, 57.7)
      ..cubicTo(31.6, 56.2098, 32.8098, 55, 34.3, 55)
      ..close();

    final path_52 = Path()
      ..moveTo(25.1, 28.2)
      ..cubicTo(26.7557, 28.2, 28.1, 29.5443, 28.1, 31.2)
      ..cubicTo(28.1, 32.8557, 26.7557, 34.2, 25.1, 34.2)
      ..cubicTo(23.4443, 34.2, 22.1, 32.8557, 22.1, 31.2)
      ..cubicTo(22.1, 29.5443, 23.4443, 28.2, 25.1, 28.2)
      ..close();

    final path_53 = Path()
      ..moveTo(89.834, 174.5919)
      ..cubicTo(103.5238, 179.7792, 99.4811, 129.8786, 100.7066, 145.3855)
      ..cubicTo(128.1113, 157.9424, 49.1923, 121.8808, 66.3676, 128.1406)
      ..cubicTo(36.6438, 124.8353, 117.3076, 112.8132, 136.8052, 110.0943)
      ..cubicTo(121.0982, 77.4577, 127.8828, 109.2206, 141.2897, 112.577)
      ..cubicTo(119.3415, 107.2743, 112.2766, 114.1217, 131.7042, 116.7614)
      ..cubicTo(112.7051, 122.9571, 86.3377, 120.9, 78.6848, 99.1839)
      ..cubicTo(101.5545, 122.0695, 150.4336, 178.803, 136.9685, 176.08)
      ..cubicTo(123.3644, 189.8904, 86.1113, 43.6425, 88.7027, 46.7632)
      ..cubicTo(95.3379, 65.4326, 85.4286, 41.2475, 81.0998, 52.4039)
      ..cubicTo(102.3742, 73.3062, 66.1941, 118.6811, 52.7864, 109.5084)
      ..close();

    final path_54 = Path()
      ..moveTo(212.2126, 57.8429)
      ..cubicTo(211.8384, 49.0433, 114.1837, 92.1825, 137.825, 86.3774)
      ..cubicTo(168.9076, 87.8377, 117.305, 184.4393, 108.2934, 160.8234)
      ..cubicTo(119.1355, 186.3415, 80.5208, 117.4783, 73.9918, 134.5239)
      ..cubicTo(90.3155, 155.2249, 151.7366, 70.929, 160.5115, 83.5519)
      ..cubicTo(169.8863, 93.9946, 189.3137, 93.3895, 196.0591, 66.289)
      ..cubicTo(177.7063, 75.0197, 141.6442, 16.7525, 122.9227, 27.6699)
      ..cubicTo(138.0054, -0.813, 167.0858, 142.7169, 188.4828, 130.1407)
      ..cubicTo(183.125, 168.7294, 228.0132, 107.6712, 219.1571, 103.1411)
      ..cubicTo(215.8763, 95.9937, 96.5715, 107.7571, 88.702, 120.139)
      ..cubicTo(117.9749, 117.6161, 162.4494, 51.6892, 145.9727, 46.2489)
      ..close();

    final path_55 = Path()
      ..moveTo(17.5703, 46.1401)
      ..cubicTo(17.7537, 46.7593, 17.5116, 47.3778, 17.0301, 47.5204)
      ..cubicTo(16.5485, 47.6631, 16.0086, 47.2762, 15.8252, 46.6571)
      ..cubicTo(15.6418, 46.0379, 15.8839, 45.4194, 16.3655, 45.2768)
      ..cubicTo(16.847, 45.1341, 17.3869, 45.521, 17.5703, 46.1401)
      ..close();

    final path_56 = Path()
      ..moveTo(17.3, 33.7)
      ..cubicTo(21.4946, 33.7, 24.9, 37.1054, 24.9, 41.3)
      ..cubicTo(24.9, 45.4946, 21.4946, 48.9, 17.3, 48.9)
      ..cubicTo(13.1054, 48.9, 9.7, 45.4946, 9.7, 41.3)
      ..cubicTo(9.7, 37.1054, 13.1054, 33.7, 17.3, 33.7)
      ..close();

    final path_57 = Path()
      ..moveTo(-16.6416, 8.6003)
      ..lineTo(-32.2, 47.4992)
      ..lineTo(-67.1111, 33.5358)
      ..lineTo(-51.5526, -5.3631)
      ..close();

    final path_58 = Path()
      ..moveTo(-99.6704, -6.7939)
      ..cubicTo(-102.7863, -4.7549, -107.1533, -5.9071, -109.4162, -9.3652)
      ..cubicTo(-111.6791, -12.8233, -110.9866, -17.2863, -107.8707, -19.3253)
      ..cubicTo(-104.7548, -21.3643, -100.3878, -20.2122, -98.1249, -16.754)
      ..cubicTo(-95.862, -13.2959, -96.5545, -8.8329, -99.6704, -6.7939)
      ..close();

    final path_59 = Path()
      ..moveTo(41.3892, -43.1062)
      ..lineTo(27.8485, -57.3253)
      ..cubicTo(25.0339, -60.281, 24.6967, -64.5356, 27.096, -66.8204)
      ..lineTo(35.5406, -74.862)
      ..cubicTo(37.9398, -77.1468, 42.1729, -76.6022, 44.9875, -73.6466)
      ..lineTo(58.5282, -59.4274)
      ..cubicTo(61.3428, -56.4718, 61.68, -52.2172, 59.2807, -49.9324)
      ..lineTo(50.8361, -41.8908)
      ..cubicTo(48.4369, -39.6059, 44.2038, -40.1506, 41.3892, -43.1062)
      ..close();

    final path_60 = Path()
      ..moveTo(15.5226, 62.2515)
      ..cubicTo(10.6021, 60.2335, 7.4938, 56.4335, 8.5857, 53.771)
      ..cubicTo(9.6777, 51.1086, 14.559, 50.5854, 19.4795, 52.6034)
      ..cubicTo(24.4, 54.6215, 27.5083, 58.4215, 26.4164, 61.0839)
      ..cubicTo(25.3244, 63.7464, 20.4431, 64.2696, 15.5226, 62.2515)
      ..close();

    final path_61 = Path()
      ..moveTo(66.2941, 48.8703)
      ..cubicTo(67.403, 49.0222, 68.1674, 50.1382, 67.9999, 51.3609)
      ..cubicTo(67.8324, 52.5835, 66.7961, 53.4529, 65.6872, 53.301)
      ..cubicTo(64.5783, 53.1491, 63.8139, 52.0331, 63.9814, 50.8104)
      ..cubicTo(64.1489, 49.5877, 65.1852, 48.7184, 66.2941, 48.8703)
      ..close();

    final path_62 = Path()
      ..moveTo(111.248, 185.3566)
      ..lineTo(98.8886, 180.7356)
      ..cubicTo(110.4324, 185.0517, 116.2763, 197.9925, 111.9305, 209.6159)
      ..lineTo(113.1576, 206.3338)
      ..cubicTo(108.8118, 217.9572, 95.9114, 223.8899, 84.3676, 219.5738)
      ..lineTo(96.727, 224.1948)
      ..cubicTo(85.1832, 219.8788, 79.3394, 206.9379, 83.6852, 195.3145)
      ..lineTo(82.4581, 198.5966)
      ..cubicTo(86.8039, 186.9732, 99.7042, 181.0406, 111.248, 185.3566)
      ..close();

    final path_63 = Path()
      ..moveTo(-107.9878, 11.3357)
      ..cubicTo(-111.5909, 11.4552, -114.5797, 9.6364, -114.658, 7.2766)
      ..cubicTo(-114.7363, 4.9168, -111.8746, 2.9039, -108.2715, 2.7844)
      ..cubicTo(-104.6683, 2.6649, -101.6795, 4.4837, -101.6012, 6.8435)
      ..cubicTo(-101.5229, 9.2033, -104.3847, 11.2162, -107.9878, 11.3357)
      ..close();

    final path_64 = Path()
      ..moveTo(33.136, 20.7356)
      ..cubicTo(31.4953, 23.9309, 163.0668, -33.6729, 173.7331, -19.8705)
      ..cubicTo(172.7446, 9.6323, 109.7042, -62.9653, 118.3958, -74.827)
      ..cubicTo(149.4325, -99.4206, 84.4146, -106.3329, 104.6526, -104.099)
      ..cubicTo(130.654, -87.1438, 105.8636, -92.8186, 95.8474, -111.5454)
      ..cubicTo(93.0913, -105.0147, 62.7286, -96.1793, 44.8754, -71.8779)
      ..cubicTo(15.8953, -65.1348, 193.296, 11.481, 190.8262, 10.5879)
      ..close();

    final path_65 = Path()
      ..moveTo(99.0105, 94.8909)
      ..cubicTo(112.5538, 70.7528, 106.2999, 90.9316, 104.9265, 75.4205)
      ..cubicTo(99.1251, 58.8973, 77.627, 158.5723, 73.8617, 158.5243)
      ..cubicTo(59.984, 148.6404, 71.5699, 53.1288, 67.5686, 55.0472)
      ..cubicTo(70.8952, 57.4866, 66.8006, 122.426, 67.324, 120.5927)
      ..cubicTo(65.8531, 118.528, 104.6136, 56.8026, 103.8995, 42.1157)
      ..cubicTo(108.9544, 48.434, 92.631, 54.7147, 84.3145, 60.2396)
      ..cubicTo(84.3042, 48.1962, 98.6154, 49.667, 91.6817, 68.1819)
      ..close();

    final path_66 = Path()
      ..moveTo(35.2765, 118.1296)
      ..lineTo(94.5558, 131.0546)
      ..lineTo(85.6682, 171.817)
      ..lineTo(26.3889, 158.892)
      ..close();

    final path_67 = Path()
      ..moveTo(100.4475, 46.3692)
      ..cubicTo(97.493, 42.6416, 96.7709, 38.2866, 98.8358, 36.65)
      ..cubicTo(100.9007, 35.0133, 104.9757, 36.7109, 107.9302, 40.4385)
      ..cubicTo(110.8846, 44.166, 111.6068, 48.5211, 109.5419, 50.1577)
      ..cubicTo(107.477, 51.7943, 103.4019, 50.0967, 100.4475, 46.3692)
      ..close();

    final path_68 = Path()
      ..moveTo(117.5978, 45.0934)
      ..cubicTo(119.1727, 43.1346, 121.4078, 42.3134, 122.5859, 43.2606)
      ..cubicTo(123.764, 44.2078, 123.4419, 46.5672, 121.867, 48.526)
      ..cubicTo(120.2921, 50.4848, 118.0569, 51.306, 116.8788, 50.3588)
      ..cubicTo(115.7007, 49.4116, 116.0228, 47.0522, 117.5978, 45.0934)
      ..close();

    final path_69 = Path()
      ..moveTo(126.4827, 56.6269)
      ..cubicTo(106.1946, 46.6083, 147.5652, 73.5824, 144.2314, 70.2676)
      ..cubicTo(132.5177, 69.876, 159.4298, 68.7874, 156.0042, 59.6054)
      ..cubicTo(151.0186, 43.7696, 147.7206, 81.5505, 135.706, 77.0586)
      ..cubicTo(143.9516, 78.819, 188.5629, 153.5685, 187.1451, 140.2528)
      ..cubicTo(200.2245, 156.1285, 173.6866, 153.8736, 164.783, 154.3069)
      ..cubicTo(173.8892, 164.4456, 195.8281, 158.6976, 199.0564, 155.9888)
      ..cubicTo(190.5745, 137.7554, 95.03, 53.1323, 98.1748, 63.9586)
      ..cubicTo(89.5657, 62.9041, 203.3483, 154.3032, 195.634, 149.6009)
      ..cubicTo(188.7707, 162.8216, 144.8308, 143.2696, 149.1165, 157.3764)
      ..close();

    final path_70 = Path()
      ..moveTo(13, 16.8)
      ..cubicTo(14.2142, 16.8, 15.2, 17.7858, 15.2, 19)
      ..cubicTo(15.2, 20.2142, 14.2142, 21.2, 13, 21.2)
      ..cubicTo(11.7858, 21.2, 10.8, 20.2142, 10.8, 19)
      ..cubicTo(10.8, 17.7858, 11.7858, 16.8, 13, 16.8)
      ..close();

    final path_71 = Path()
      ..moveTo(14, 11.6)
      ..cubicTo(0.2, 5, 74.2, 46, 75.3, 42.2)
      ..cubicTo(80.2, 45.9, 98.5, 46.7, 90.1, 32.2)
      ..cubicTo(88.2, 39.6, 7.8, 82.9, 14.5, 97.4)
      ..cubicTo(0, 100, 91.2, 30.3, 92, 16.6)
      ..cubicTo(82.3, 17.4, 59, 62.4, 44, 65.5)
      ..cubicTo(38.6, 68, 98, 40.7, 84.5, 39.4)
      ..cubicTo(78.6, 39.4, 84.8, 77.6, 96.5, 73)
      ..cubicTo(81.1, 71.2, 56.3, 69.6, 42.4, 59)
      ..cubicTo(47.6, 52.8, 15, 37.6, 18.6, 35.1)
      ..cubicTo(9, 31.7, 0.2, 57, 14.6, 49)
      ..close();

    final path_72 = Path()
      ..moveTo(87.6047, -135.2176)
      ..cubicTo(88.1929, -152.9486, 100.9359, -166.937, 116.0434, -166.4358)
      ..cubicTo(131.151, -165.9347, 142.9388, -151.1324, 142.3506, -133.4014)
      ..cubicTo(141.7624, -115.6704, 129.0195, -101.682, 113.9119, -102.1832)
      ..cubicTo(98.8044, -102.6843, 87.0165, -117.4865, 87.6047, -135.2176)
      ..close();

    final path_73 = Path()
      ..moveTo(132.1917, 46.0669)
      ..cubicTo(132.6016, 34.4382, 162.8394, -56.0101, 145.623, -30.9762)
      ..cubicTo(118.231, -40.192, 142.9782, -107.4889, 139.0735, -102.7433)
      ..cubicTo(136.2639, -107.6413, 54.7883, 7.6059, 47.3977, -14.2264)
      ..cubicTo(51.4479, -6.0774, 120.4086, 63.346, 128.7289, 50.6435)
      ..cubicTo(134.2464, 71.359, 95.0928, 46.2993, 83.068, 22.7504)
      ..cubicTo(89.1253, 26.1107, 61.1328, 30.4888, 61.6399, 21.0108)
      ..cubicTo(77.2703, 14.3827, 182.2219, 3.694, 173.2331, 0.8044)
      ..cubicTo(161.2226, 28.1049, 127.6983, -39.082, 119.5939, -55.201)
      ..cubicTo(120.0841, -44.6261, 173.4275, -104.2913, 177.8221, -92.0164)
      ..close();

    final path_74 = Path()
      ..moveTo(35.056, 64.3084)
      ..lineTo(41.6968, 88.2546)
      ..lineTo(21.8538, 93.7576)
      ..lineTo(15.2129, 69.8113)
      ..close();

    final path_75 = Path()
      ..moveTo(-2.2437, 54.6159)
      ..cubicTo(-25.3829, 63.45, -35.6269, 62.8773, -55.9388, 44.9675)
      ..cubicTo(-87.9851, 59.95, 5.4416, 60.1095, -19.3876, 54.9234)
      ..cubicTo(-46.8109, 48.4845, -101.9403, 20.2411, -120.9948, 3.6676)
      ..cubicTo(-130.4051, -1.6059, 58.6048, -43.2601, 45.2639, -36.0936)
      ..cubicTo(36.0436, -27.7473, -36.3467, 31.5042, -27.3025, 39.9221)
      ..cubicTo(-16.0884, 23.142, 4.2664, -14.174, 7.1695, -4.8334)
      ..cubicTo(36.9922, -27.6943, -119.1156, -2.7155, -102.4743, 12.7736)
      ..cubicTo(-126.4656, -7.3991, 32.7984, 50.7199, 6.8042, 32.3342)
      ..cubicTo(33.2311, 63.4038, -65.8355, -6.0665, -45.5372, -4.9317)
      ..close();

    final path_76 = Path()
      ..moveTo(171.8811, -74.5875)
      ..cubicTo(157.8858, -71.3768, 87.9193, 78.2512, 95.6864, 73.3538)
      ..cubicTo(85.3455, 75.8427, 146.9929, 21.7097, 145.9818, 11.7038)
      ..cubicTo(127.0785, 23.7818, 113.8817, 25.1513, 96.6793, 41.6682)
      ..cubicTo(110.0695, 14.0774, 148.7215, 7.0199, 145.7267, -2.5126)
      ..cubicTo(129.6088, 10.1012, 79.775, 36.4622, 77.2796, 33.0917)
      ..cubicTo(64.6984, 46.4265, 55.9307, 28.9033, 55.2735, 28.2884)
      ..cubicTo(67.7068, 11.7089, 182.191, -78.1409, 184.11, -87.2166)
      ..cubicTo(173.9931, -71.5758, 174.4986, -21.4042, 158.473, -19.3168)
      ..cubicTo(147.1978, -20.5495, 95.7084, 62.244, 95.0414, 53.0779)
      ..cubicTo(91.4991, 60.3757, 89.7388, -12.7131, 115.395, -25.2018)
      ..close();

    final path_77 = Path()
      ..moveTo(-47.3276, 60.4943)
      ..lineTo(-99.3646, 99.5648)
      ..lineTo(-115.6552, 77.8678)
      ..lineTo(-63.6182, 38.7972)
      ..close();

    final path_78 = Path()
      ..moveTo(-11.6208, 138.4314)
      ..cubicTo(-11.9822, 158.327, -15.29, 148.007, -28.521, 143.7473)
      ..cubicTo(-12.2264, 162.8344, -14.5261, 194.7207, -13.9474, 178.7466)
      ..cubicTo(0.1041, 165.2127, 10.7333, 183.1377, 1.5145, 199.9879)
      ..cubicTo(9.6842, 202.5074, -108.6497, 158.3454, -103.8589, 165.0803)
      ..cubicTo(-110.2265, 187.4607, 8.0283, 159.0442, -9.0722, 170.7025)
      ..cubicTo(-34.8198, 154.28, 4.892, 108.5367, 8.4067, 112.3924)
      ..cubicTo(-13.8908, 114.2393, -52.5287, 89.9102, -55.1804, 93.9206)
      ..close();

    final path_79 = Path()
      ..moveTo(41.3302, 48.2444)
      ..cubicTo(22.1783, 54.7511, -34.1664, 105.883, -38.8027, 108.8486)
      ..cubicTo(-52.796, 97.2109, -50.8293, 108.9601, -54.0301, 100.9663)
      ..cubicTo(-75.3632, 81.0886, 22.1587, 21.9924, 7.9215, 23.7349)
      ..cubicTo(23.8179, 30.6684, 35.5286, 59.5803, 34.7129, 46.2992)
      ..cubicTo(44.735, 43.1149, -43.0645, 26.7603, -30.8397, 39.7029)
      ..cubicTo(-52.6794, 50.9238, -94.4449, 114.9682, -80.88, 134.4326)
      ..cubicTo(-71.9237, 138.9763, 27.0019, 154.2908, 14.4165, 149.5799)
      ..cubicTo(-3.4926, 138.783, -35.646, 133.1476, -50.8081, 131.5897)
      ..cubicTo(-30.8359, 140.8643, -85.0475, 114.976, -70.1735, 127.6709)
      ..cubicTo(-45.703, 106.2018, 16.4283, 64.911, 28.8817, 67.102)
      ..close();

    final path_80 = Path()
      ..moveTo(173.7896, 121.2445)
      ..cubicTo(171.043, 126.9057, 83.1737, 82.4246, 102.4116, 89.4928)
      ..cubicTo(114.4627, 83.4153, 155.7147, 95.4835, 161.1641, 89.5283)
      ..cubicTo(169.7925, 78.4288, 146.2197, 90.7177, 143.5465, 94.6047)
      ..cubicTo(148.1605, 91.2088, 172.9195, 75.716, 197.8616, 83.983)
      ..cubicTo(193.1863, 93.5567, 65.5352, 58.6483, 63.5505, 63.5244)
      ..cubicTo(61.1795, 49.1527, 161.018, 100.4925, 139.7985, 92.3524)
      ..cubicTo(122.6879, 89.4896, 168.8435, 103.695, 189.744, 102.7089)
      ..cubicTo(153.5708, 99.5044, 78.7312, 76.9815, 64.454, 64.405)
      ..close();

    final path_81 = Path()
      ..moveTo(188.4617, 71.2417)
      ..cubicTo(215.4585, 95.4802, 106.9419, 20.8693, 109.9806, 18.4086)
      ..cubicTo(123.7005, 1.9351, 136.4901, 21.3251, 140.1207, 38.5484)
      ..cubicTo(126.0079, 26.6849, 128.3236, 47.0466, 125.8573, 74.1821)
      ..cubicTo(125.8211, 87.9492, 177.62, 164.8438, 177.069, 144.9434)
      ..cubicTo(178.3602, 148.9899, 176.3147, 1.7581, 187.4577, 6.4871)
      ..cubicTo(188.5526, -14.4971, 244.6796, 150.8809, 255.3085, 137.6871)
      ..cubicTo(247.2374, 112.9449, 173.5298, 116.9195, 154.4627, 117.0835)
      ..close();

    final path_82 = Path()
      ..moveTo(123.1663, -23.8366)
      ..cubicTo(140.1277, -36.1753, 126.9089, -75.8463, 138.0326, -74.8014)
      ..cubicTo(108.1744, -66.7606, 47.6164, -19.5173, 62.4857, -27.3335)
      ..cubicTo(78.4574, -37.215, 171.9997, -87.0247, 152.1946, -83.0238)
      ..cubicTo(172.53, -100.73, 138.2686, -77.2281, 149.6544, -90.4787)
      ..cubicTo(151.2445, -106.0559, 157.0504, -66.4166, 158.8268, -73.5736)
      ..cubicTo(181.2353, -76.7337, 128.9813, -35.7613, 121.4349, -29.7641)
      ..cubicTo(141.661, -30.2525, 62.3155, -16.3923, 77.1664, -30.6788)
      ..cubicTo(96.1562, -33.2399, 91.7484, -37.8695, 100.2662, -52.7942);

    final path_83 = Path()
      ..moveTo(122.2118, -96.5308)
      ..cubicTo(99.3921, -71.3934, 61.7122, -0.4824, 66.8321, 4.1353)
      ..cubicTo(33.1105, -9.873, 175.4856, -105.5064, 153.5635, -100.349)
      ..cubicTo(160.0611, -84.3515, 66.9557, -43.3452, 43.0924, -55.1518)
      ..cubicTo(65.1551, -39.3536, 182.8413, -107.5187, 173.6391, -96.0438)
      ..cubicTo(191.6284, -107.8232, 213.6077, -27.4804, 194.8171, -28.4981)
      ..cubicTo(197.7705, -35.3244, 113.8453, -32.6593, 104.0031, -24.2284)
      ..cubicTo(112.5926, -53.4507, 7.5599, -98.3362, 36.0864, -87.1056)
      ..cubicTo(16.6812, -85.4359, 184.7003, -26.7102, 176.4171, -27.3834)
      ..close();

    final path_84 = Path()
      ..moveTo(-53.0128, -4.9697)
      ..cubicTo(-59.0849, -2.2881, -39.7972, 50.9403, -29.5216, 61.6933)
      ..cubicTo(-11.468, 79.4238, 4.8639, -51.4465, 2.4273, -34.9875)
      ..cubicTo(18.7249, -46.1744, -23.0339, -20.4818, -7.4182, -35.0658)
      ..cubicTo(-24.7178, -47.2313, -49.0256, 59.0896, -40.8151, 60.0318)
      ..cubicTo(-29.8062, 27.9566, -74.5723, 30.0327, -87.6072, 32.4934)
      ..cubicTo(-69.7883, 54.7884, 7.4948, -25.2686, -2.4326, -17.8032)
      ..cubicTo(-31.1785, 3.4762, 54.6414, -78.4155, 54.4324, -77.9208)
      ..close();

    final path_85 = Path()
      ..moveTo(15.2765, 57.3217)
      ..lineTo(8.7557, 68.3478)
      ..cubicTo(7.9297, 69.7445, 4.5863, 69.2977, 1.2941, 67.3507)
      ..lineTo(-12.34, 59.2875)
      ..cubicTo(-15.6321, 57.3405, -17.6344, 54.6259, -16.8084, 53.2293)
      ..lineTo(-10.2875, 42.2032)
      ..cubicTo(-9.4616, 40.8065, -6.1182, 41.2533, -2.826, 43.2002)
      ..lineTo(10.8081, 51.2635)
      ..cubicTo(14.1003, 53.2104, 16.1025, 55.925, 15.2765, 57.3217)
      ..close();

    final path_86 = Path()
      ..moveTo(67.6008, 93.0469)
      ..cubicTo(83.1422, 92.8782, -7.343, 141.9467, -20.5355, 138.6572)
      ..cubicTo(-20.5719, 150.4827, 56.9348, 210.0849, 68.8433, 198.8718)
      ..cubicTo(61.9688, 220.8653, 124.7786, 199.8729, 123.7383, 206.8868)
      ..cubicTo(110.4999, 188.7326, 80.7905, 172.6236, 98.7429, 176.5633)
      ..cubicTo(95.7259, 202.0964, 53.6572, 181.8707, 54.0078, 195.4793)
      ..cubicTo(48.3723, 207.9211, 12.9682, 96.0408, -4.0063, 101.8797)
      ..cubicTo(19.0216, 113.5246, 57.7311, 205.9137, 38.0914, 192.9863)
      ..cubicTo(26.2311, 191.4951, -24.5377, 148.871, -23.4448, 147.0928)
      ..cubicTo(-30.7853, 127.5057, 5.2209, 143.0862, -12.5143, 150.4603)
      ..close();

    final path_87 = Path()
      ..moveTo(-30.2692, 177.4222)
      ..cubicTo(-42.0383, 158.251, -144.1613, 132.2081, -119.6096, 134.0193)
      ..cubicTo(-143.6455, 106.4743, -8.6692, 135.2826, -3.0409, 146.5917)
      ..cubicTo(16.6367, 169.5763, -111.9435, 53.6543, -107.7968, 61.1107)
      ..cubicTo(-108.4673, 82.0372, -59.2679, 151.0718, -31.7623, 143.9322)
      ..cubicTo(-4.4508, 142.3862, 16.5858, 150.3399, 21.5038, 168.8521)
      ..cubicTo(28.5278, 159.3823, -90.5333, 174.8356, -61.663, 167.4838)
      ..close();

    final path_88 = Path()
      ..moveTo(-30.6254, -70.5736)
      ..cubicTo(-33.2903, -72.6706, -34.4784, -75.6126, -33.277, -77.1394)
      ..cubicTo(-32.0755, -78.6661, -28.9367, -78.2031, -26.2718, -76.1061)
      ..cubicTo(-23.607, -74.0091, -22.4189, -71.0671, -23.6203, -69.5404)
      ..cubicTo(-24.8217, -68.0136, -27.9606, -68.4766, -30.6254, -70.5736)
      ..close();

    final path_89 = Path()
      ..moveTo(22.0724, 190.0581)
      ..cubicTo(22.6909, 190.4109, 22.9665, 191.0943, 22.6876, 191.5833)
      ..cubicTo(22.4087, 192.0723, 21.6801, 192.1829, 21.0617, 191.8302)
      ..cubicTo(20.4433, 191.4774, 20.1676, 190.794, 20.4465, 190.305)
      ..cubicTo(20.7254, 189.816, 21.454, 189.7054, 22.0724, 190.0581)
      ..close();

    final path_90 = Path()
      ..moveTo(123.0302, -33.7267)
      ..cubicTo(125.2912, -27.4694, 84.8854, -20.6208, 79.5159, -20.3053)
      ..cubicTo(63.0019, 4.9692, 64.3335, 16.0066, 65.2744, 1.0783)
      ..cubicTo(50.8036, 27.1058, 65.277, 4.9502, 50.4461, 27.5304)
      ..cubicTo(41.6656, 48.1917, 94.8581, -5.9348, 108.1284, -16.527)
      ..cubicTo(112.6999, -16.7891, 132.3759, 3.1657, 120.7223, 7.8637)
      ..cubicTo(132.4914, -24.7922, 106.078, -23.3326, 117.986, -36.2814)
      ..cubicTo(120.0114, -57.0683, 99.3347, -15.2253, 106.8716, -25.5666)
      ..close();

    final path_91 = Path()
      ..moveTo(109.1898, 57.205)
      ..cubicTo(112.8938, 55.1855, 117.3725, 56.2447, 119.1849, 59.5689)
      ..cubicTo(120.9973, 62.893, 119.4615, 67.2314, 115.7574, 69.2509)
      ..cubicTo(112.0534, 71.2705, 107.5747, 70.2113, 105.7623, 66.8871)
      ..cubicTo(103.9499, 63.5629, 105.4857, 59.2245, 109.1898, 57.205)
      ..close();

    final path_92 = Path()
      ..moveTo(-84.5243, 49.9644)
      ..lineTo(-121.6029, 86.0218)
      ..lineTo(-136.5753, 70.6254)
      ..lineTo(-99.4967, 34.568)
      ..close();

    final path_93 = Path()
      ..moveTo(5.075, 32.0371)
      ..lineTo(-2.851, 47.7961)
      ..cubicTo(-5.559, 53.1804, -11.2546, 55.7929, -15.562, 53.6265)
      ..lineTo(-12.7318, 55.0499)
      ..cubicTo(-17.0393, 52.8835, -18.3378, 46.7533, -15.6298, 41.3691)
      ..lineTo(-7.7038, 25.61)
      ..cubicTo(-4.9958, 20.2257, 0.6999, 17.6132, 5.0073, 19.7796)
      ..lineTo(2.1771, 18.3562)
      ..cubicTo(6.4845, 20.5226, 7.783, 26.6528, 5.075, 32.0371)
      ..close();

    final path_94 = Path()
      ..moveTo(86.5, 54.6)
      ..cubicTo(75.2, 69.1, 19.4, 65.4, 6.2, 61.6)
      ..cubicTo(0, 72.4, 63.3, 0, 61.8, 5.8)
      ..cubicTo(65.3, 21.9, 48.4, 78.2, 57.1, 63.7)
      ..cubicTo(45.5, 69.3, 58.7, 39.3, 50.3, 36.2)
      ..cubicTo(49.6, 37.5, 44.5, 69.2, 43.8, 79.6)
      ..cubicTo(63, 66.1, 1.2, 43.7, 8.8, 43.2)
      ..cubicTo(25.6, 25.4, 32.6, 69.6, 24.5, 67.1)
      ..cubicTo(5, 81.3, 45.1, 55.5, 31.6, 49.7)
      ..cubicTo(46.6, 54.1, 0, 10.2, 6.8, 20.9)
      ..close();

    final path_95 = Path()
      ..moveTo(-30.3351, 88.9244)
      ..cubicTo(-50.8745, 80.2576, -109.8274, 94.4726, -108.6933, 90.2282)
      ..cubicTo(-95.0549, 84.2292, -13.5938, 53.0428, 5.011, 54.7024)
      ..cubicTo(7.0296, 57.8676, -112.2577, 50.4123, -93.1129, 57.0552)
      ..cubicTo(-121.4831, 58.3185, 15.9631, 50.5426, 3.1269, 41.9333)
      ..cubicTo(1.9591, 52.8993, -76.145, 42.8049, -91.9294, 46.985)
      ..cubicTo(-97.9687, 55.7318, -18.9862, 90.1986, -13.2414, 99.1877)
      ..cubicTo(4.8435, 97.0157, -134.8754, 61.1127, -133.9828, 51.6877)
      ..cubicTo(-111.7756, 43.4268, -63.3816, 55.8961, -62.9141, 56.7201)
      ..cubicTo(-40.5202, 50.5043, -78.1931, 63.8999, -80.7026, 58.5668)
      ..cubicTo(-63.9386, 58.5943, -11.7687, 105.691, -4.524, 105.4365)
      ..close();

    final path_96 = Path()
      ..moveTo(67.0795, -41.5023)
      ..cubicTo(64.2369, -62.5115, -3.7658, -40.8117, 4.5187, -28.6684)
      ..cubicTo(-2.0437, -9.5835, 36.285, -73.8762, 24.2716, -72.7093)
      ..cubicTo(31.6549, -62.4647, 72.6388, -9.6278, 83.7151, 1.7813)
      ..cubicTo(76.7503, 11.1446, 78.3859, 47.7368, 75.9178, 39.8095)
      ..cubicTo(68.5272, 33.8297, 29.9504, -65.3905, 31.0302, -64.7857)
      ..cubicTo(37.1539, -59.6353, 25.7936, -2.1273, 39.7855, 7.125)
      ..cubicTo(48.467, 0.0736, 42.8898, 68.3566, 43.4731, 56.2359)
      ..cubicTo(28.5025, 32.4851, 57.9221, -78.3869, 56.6581, -74.4992)
      ..cubicTo(53.6378, -88.4313, 38.3637, -38.3862, 48.7596, -22.5774);

    final path_97 = Path()
      ..moveTo(118.1269, -127.4421)
      ..cubicTo(119.1528, -129.0819, 92.162, -105.7008, 102.2905, -110.8857)
      ..cubicTo(116.9928, -130.457, 74.9944, -156.993, 92.0876, -137.4109)
      ..cubicTo(116.6196, -106.7874, 90.8045, -158.2911, 76.341, -138.7701)
      ..cubicTo(62.0604, -134.9472, 126.0538, -56.1025, 144.3147, -41.0372)
      ..cubicTo(128.8891, -68.0887, 122.7855, -23.6879, 120.7001, -19.3844)
      ..cubicTo(96.8208, -21.4702, 76.6311, -26.1639, 62.7534, -21.6124)
      ..cubicTo(61.1791, -31.4492, 97.5605, -154.6305, 113.3818, -154.1005)
      ..cubicTo(107.9166, -168.2016, 118.8092, -87.5219, 109.0391, -114.9517)
      ..cubicTo(121.7753, -117.2289, 80.6711, -10.5422, 93.9556, -1.3428)
      ..cubicTo(103.7895, -22.1253, 63.8498, 20.8643, 55.0906, -4.1347)
      ..close();

    final path_98 = Path()
      ..moveTo(114.2328, 114.7073)
      ..cubicTo(99.0361, 115.7133, 52.6821, 155.0042, 42.5623, 163.383)
      ..cubicTo(23.8039, 173.5476, 134.4099, 112.3567, 132.0579, 112.1416)
      ..cubicTo(129.3015, 105.4782, -15.2756, 178.0867, -8.3365, 166.4985)
      ..cubicTo(-21.1983, 171.1852, 39.2956, 185.8199, 48.2449, 175.3283)
      ..cubicTo(73.2066, 160.6353, -7.5282, 165.9767, 2.2276, 166.5003)
      ..cubicTo(-20.9354, 171.5392, 34.5492, 159.8388, 47.2004, 149.5015)
      ..cubicTo(38.122, 146.6699, 82.1108, 131.0298, 74.9413, 146.8698)
      ..cubicTo(88.7217, 139.9314, 64.0866, 115.6159, 68.401, 104.2505)
      ..close();

    final path_99 = Path()
      ..moveTo(62.5, 28.9)
      ..lineTo(86.9, 28.9)
      ..lineTo(86.9, 47.9)
      ..lineTo(62.5, 47.9)
      ..close();

    final path_100 = Path()
      ..moveTo(91.9165, -21.8327)
      ..cubicTo(88.7189, -27.6251, 97.1539, -38.4172, 110.741, -45.9177)
      ..cubicTo(124.328, -53.4182, 137.955, -54.8049, 141.1526, -49.0125)
      ..cubicTo(144.3502, -43.2202, 135.9152, -32.428, 122.3281, -24.9276)
      ..cubicTo(108.7411, -17.4271, 95.1141, -16.0404, 91.9165, -21.8327)
      ..close();

    final path_101 = Path()
      ..moveTo(16.3, 67.3)
      ..cubicTo(21.0465, 67.3, 24.9, 71.1535, 24.9, 75.9)
      ..cubicTo(24.9, 80.6465, 21.0465, 84.5, 16.3, 84.5)
      ..cubicTo(11.5535, 84.5, 7.7, 80.6465, 7.7, 75.9)
      ..cubicTo(7.7, 71.1535, 11.5535, 67.3, 16.3, 67.3)
      ..close();

    final path_102 = Path()
      ..moveTo(47.6, 59.8)
      ..cubicTo(65.2, 58.2, 40.1, 87.2, 52.5, 87.3)
      ..cubicTo(53.2, 77.9, 60.4, 30.5, 61.7, 24.3)
      ..cubicTo(69.4, 34.4, 94.5, 91.3, 91, 94.5)
      ..cubicTo(89, 100, 53, 33.2, 50.8, 29.3)
      ..cubicTo(36.8, 48.1, 0, 50.9, 1.7, 59.1)
      ..cubicTo(9.3, 78.3, 53.9, 79.7, 42.6, 80)
      ..cubicTo(47.4, 88.2, 17.7, 38.6, 10.3, 41.8)
      ..cubicTo(14.9, 26, 100, 45.7, 96.1, 32)
      ..close();

    final path_103 = Path()
      ..moveTo(28.2, 72.4)
      ..cubicTo(15.1, 90.1, 25.1, 48.1, 25.6, 56.1)
      ..cubicTo(42.8, 58.9, 20.4, 93.3, 9.3, 78.9)
      ..cubicTo(15.2, 93.9, 1, 74.3, 1.6, 67.5)
      ..cubicTo(0, 65.1, 28.1, 0, 27.8, 9.6)
      ..cubicTo(22, 0, 62.8, 93.7, 65.7, 97)
      ..cubicTo(62.7, 100, 32.1, 44.1, 33.4, 50.8)
      ..cubicTo(34.3, 60.4, 86.8, 87.7, 74.1, 88.3)
      ..cubicTo(77.1, 79.6, 11.8, 0, 16.7, 4.5)
      ..close();

    final path_104 = Path()
      ..moveTo(108.6123, 44.1815)
      ..cubicTo(107.778, 39.6357, 110.7913, 35.2677, 115.3371, 34.4334)
      ..cubicTo(119.8829, 33.5991, 124.2509, 36.6124, 125.0852, 41.1582)
      ..cubicTo(125.9195, 45.704, 122.9063, 50.072, 118.3604, 50.9063)
      ..cubicTo(113.8146, 51.7406, 109.4467, 48.7273, 108.6123, 44.1815)
      ..close();

    final path_105 = Path()
      ..moveTo(203.5139, 145.5221)
      ..cubicTo(196.5553, 130.0851, 114.7082, 49.776, 122.2308, 56.2816)
      ..cubicTo(112.5975, 53.3174, 111.9157, 63.0313, 113.0103, 77.4908)
      ..cubicTo(120.6652, 80.9118, 146.628, 63.0941, 139.169, 46.4591)
      ..cubicTo(143.2928, 72.8953, 118.727, 101.95, 107.9319, 77.2514)
      ..cubicTo(92.129, 68.0602, 197.4781, 108.953, 190.6536, 99.1335)
      ..cubicTo(160.6698, 83.1022, 155.422, 100.8654, 142.9522, 100.1982)
      ..cubicTo(155.5702, 95.2484, 151.4951, 150.9992, 166.273, 170.6403)
      ..cubicTo(152.1491, 136.727, 228.3235, 167.5756, 236.6072, 178.733)
      ..cubicTo(230.6376, 158.6014, 233.3353, 142.4452, 239.4155, 162.9453)
      ..close();

    final path_106 = Path()
      ..moveTo(74.6, 66.7)
      ..cubicTo(82.658, 66.7, 89.2, 73.242, 89.2, 81.3)
      ..cubicTo(89.2, 89.358, 82.658, 95.9, 74.6, 95.9)
      ..cubicTo(66.542, 95.9, 60, 89.358, 60, 81.3)
      ..cubicTo(60, 73.242, 66.542, 66.7, 74.6, 66.7)
      ..close();

    final path_107 = Path()
      ..moveTo(157.857, -24.7703)
      ..cubicTo(155.1095, -22.1828, 79.1551, -47.5009, 60.752, -45.4996)
      ..cubicTo(51.6203, -57.804, 62.3519, -10.6719, 72.654, -8.8625)
      ..cubicTo(64.4771, -19.969, 128.1579, 31.8748, 133.1049, 42.105)
      ..cubicTo(116.5794, 36.5102, 144.8132, -24.7261, 133.6201, -37.6054)
      ..cubicTo(153.8247, -30.4648, 119.3213, -25.0549, 110.8945, -21.8646)
      ..cubicTo(95.1375, -21.8367, 148.1832, -22.4034, 158.6011, -9.0146)
      ..cubicTo(172.1154, -2.3279, 123.75, -36.5436, 116.5945, -42.663)
      ..cubicTo(120.3969, -39.2685, 104.3949, -50.1353, 112.2132, -44.2429)
      ..cubicTo(123.6725, -42.4638, 85.2431, -40.4976, 66.5092, -41.9816)
      ..cubicTo(68.3668, -32.9809, 93.8117, -21.3828, 79.3383, -35.7311)
      ..close();

    final path_108 = Path()
      ..moveTo(28.5917, -32.8898)
      ..cubicTo(21.0316, -18.1281, 23.3721, -21.6246, 26.1284, -38.7581)
      ..cubicTo(32.723, -57.4977, 40.3718, -102.4812, 32.5468, -99.8951)
      ..cubicTo(8.3626, -81.0263, 28.341, -75.5092, 20.8439, -82.2306)
      ..cubicTo(21.9619, -53.3729, 3.2526, 20.922, 2.8269, 12.3079)
      ..cubicTo(12.9929, 6.0432, 92.005, -74.4803, 87.0746, -84.9426)
      ..cubicTo(71.7494, -87.9856, 110.8756, -101.2801, 99.6225, -83.1941)
      ..cubicTo(98.7625, -97.5095, 42.0223, 1.0559, 37.3886, 17.5559);

    final path_109 = Path()
      ..moveTo(155.5505, 120.5593)
      ..cubicTo(162.6605, 128.4925, 79.2716, 86.296, 70.9521, 89.0007)
      ..cubicTo(91.3302, 90.0533, 143.1269, 140.3232, 146.5537, 146.3667)
      ..cubicTo(143.1301, 150.0477, 63.0241, 120.2303, 71.3347, 118.9644)
      ..cubicTo(65.4286, 111.5566, 33.0136, 125.4184, 35.5279, 124.5083)
      ..cubicTo(58.9389, 123.9676, 139.102, 147.9133, 126.8794, 136.6823)
      ..cubicTo(115.4129, 133.9362, 44.735, 137.9361, 45.1538, 136.3939)
      ..cubicTo(49.1003, 131.3101, 91.8741, 114.2848, 86.8438, 111.2426)
      ..cubicTo(98.7927, 107.2362, 138.5714, 121.5234, 141.4415, 120.8)
      ..cubicTo(121.3403, 107.1342, 115.0286, 136.6854, 108.3, 131.5846)
      ..close();

    final path_110 = Path()
      ..moveTo(183.7856, 6.3613)
      ..cubicTo(181.9865, 9.7267, 181.1601, 90.6605, 176.5934, 75.3595)
      ..cubicTo(173.0023, 91.6799, 148.4078, 79.1455, 140.7243, 61.6853)
      ..cubicTo(115.4351, 50.1026, 176.3715, 0.4545, 164.7732, -2.5831)
      ..cubicTo(166.8052, -12.1208, 190.0235, 124.8202, 184.0443, 113.4896)
      ..cubicTo(190.0235, 124.8202, 177.8817, 14.1439, 184.0974, 31.3459)
      ..cubicTo(197.0918, 27.572, 119.7363, 21.7874, 127.8926, 36.4926)
      ..cubicTo(134.734, 58.3303, 197.0213, 48.8842, 189.972, 29.9247)
      ..cubicTo(194.1517, 15.6255, 140.4914, 9.2536, 121.9096, -1.3793)
      ..cubicTo(132.5003, 22.3453, 217.2515, 76.5291, 216.4368, 61.2745)
      ..close();

    final path_111 = Path()
      ..moveTo(77.1847, 109.2142)
      ..cubicTo(71.4515, 118.3805, 147.1643, 114.9268, 163.3006, 122.6534)
      ..cubicTo(140.3639, 131.9397, 194.1318, 38.7811, 209.169, 22.9977)
      ..cubicTo(241.1077, 44.1862, 233.3715, 61.0887, 224.6105, 65.1279)
      ..cubicTo(221.0445, 63.2808, 113.3425, 91.8794, 137.0681, 88.4377)
      ..cubicTo(100.7036, 102.9659, 202.1154, 30.5351, 185.0915, 29.601)
      ..cubicTo(214.5159, 38.8728, 243.5574, 46.8602, 245.9231, 64.2771)
      ..cubicTo(219.4922, 82.0121, 69.3839, 90.0802, 75.5719, 92.4941)
      ..cubicTo(70.394, 100.8374, 71.2735, 119.6687, 82.7203, 125.322)
      ..cubicTo(103.627, 119.9109, 169.4925, 45.2712, 163.8222, 36.6526)
      ..close();

    final path_112 = Path()
      ..moveTo(0.0375, -76.7537)
      ..cubicTo(2.3112, -70.4067, -62.7175, 44.2512, -76.5061, 19.7787)
      ..cubicTo(-64.4449, -15.8253, 4.1033, 28.3385, -0.2706, 5.9175)
      ..cubicTo(11.7266, -16.2601, -52.3378, -110.0622, -50.0556, -101.2435)
      ..cubicTo(-50.1303, -74.9249, -91.1147, -125.9463, -77.7112, -104.974)
      ..cubicTo(-93.1673, -108.2947, -94.595, -125.6601, -87.4854, -103.1109)
      ..cubicTo(-88.3165, -71.7854, -19.8905, -3.0651, -28.2979, 22.5259)
      ..cubicTo(-9.6196, 18.8711, -21.0422, -96.3885, -24.0679, -96.493)
      ..cubicTo(-22.7022, -113.0285, 7.732, -0.9212, 14.5905, 20.9423)
      ..cubicTo(16.5, 41.8, -31.0316, -88.8567, -29.2739, -95.8884)
      ..cubicTo(-30.1563, -111.3561, -66.8037, -122.6472, -77.77, -113.9755)
      ..close();

    final path_113 = Path()
      ..moveTo(146.8083, -118.196)
      ..lineTo(147.0078, -175.3237)
      ..lineTo(223.6223, -175.0562)
      ..lineTo(223.4229, -117.9286)
      ..close();

    final path_114 = Path()
      ..moveTo(47.9061, 60.6823)
      ..cubicTo(39.3227, 62.1659, -78.505, 32.4084, -79.9306, 33.2397)
      ..cubicTo(-77.7357, 18.608, -20.0639, 39.4651, -16.5968, 44.3749)
      ..cubicTo(1.6876, 37.2901, -86.4724, 66.6906, -91.4986, 75.1754)
      ..cubicTo(-108.2553, 77.9925, 8.0472, 121.4026, 10.7421, 134.9382)
      ..cubicTo(30.5681, 131.6534, 30.7111, 104.1774, 41.6753, 102.594)
      ..cubicTo(44.9964, 103.5789, -45.8207, 11.5509, -66.1846, 15.8826)
      ..cubicTo(-42.1446, 28.3578, -54.3634, 98.11, -48.5848, 115.0351)
      ..cubicTo(-31.3945, 105.2226, 18.7198, 133.9855, 3.8609, 121.7775)
      ..close();

    final path_115 = Path()
      ..moveTo(138.2133, -54.4085)
      ..cubicTo(137.568, -58.8321, 143.1496, -63.3143, 150.6698, -64.4114)
      ..cubicTo(158.1901, -65.5085, 164.8195, -62.8077, 165.4649, -58.384)
      ..cubicTo(166.1102, -53.9603, 160.5287, -49.4782, 153.0084, -48.3811)
      ..cubicTo(145.4881, -47.284, 138.8587, -49.9848, 138.2133, -54.4085)
      ..close();

    final path_116 = Path()
      ..moveTo(-53.8229, 114.1666)
      ..cubicTo(-45.2759, 140.1871, -20.7095, 151.4799, -20.3755, 133.7458)
      ..cubicTo(-39.706, 128.3918, -87.9, 122.5316, -85.5867, 108.6892)
      ..cubicTo(-109.0831, 117.1084, -33.6515, 107.5817, -25.8693, 120.998)
      ..cubicTo(-39.7649, 111.1931, -66.8065, 97.6184, -88.7088, 89.8028)
      ..cubicTo(-92.2695, 99.6378, 24.2119, 91.3364, 11.5144, 85.658)
      ..cubicTo(5.8292, 110.5308, -97.9422, 74.1098, -89.8038, 84.6019)
      ..cubicTo(-69.4578, 91.6331, -70.5154, 21.5204, -62.9482, 29.2626)
      ..cubicTo(-50.5671, 58.826, -50.0297, 116.1567, -27.0843, 120.2155)
      ..cubicTo(-23.8947, 116.2308, -16.2793, 143.2617, -25.6657, 157.6651)
      ..close();

    final path_117 = Path()
      ..moveTo(36.1017, 66.3074)
      ..cubicTo(34.4594, 57.5189, 33.8255, 63.7098, 32.824, 59.7973)
      ..cubicTo(34.2223, 65.6713, 24.1396, 25.2691, 20.847, 28.7598)
      ..cubicTo(5.4429, 37.2875, 17.3745, 47.8392, 10.6958, 52.8742)
      ..cubicTo(3.2564, 45.4477, 27.9937, 55.2564, 22.491, 55.9022)
      ..cubicTo(5.2489, 51.0171, 35.1769, 55.9885, 44.3344, 52.4128)
      ..cubicTo(41.4733, 59.2658, 59.8108, 49.7351, 55.6184, 55.4363)
      ..close();

    final path_118 = Path()
      ..moveTo(20.2, 4.6)
      ..lineTo(66.9, 4.6)
      ..lineTo(66.9, 34.3)
      ..lineTo(20.2, 34.3)
      ..close();

    final path_119 = Path()
      ..moveTo(-62.8954, 109.8255)
      ..cubicTo(-58.0301, 131.0606, -39.0561, 85.5839, -43.4648, 75.988)
      ..cubicTo(-37.7243, 69.559, -60.689, 159.2875, -52.1477, 166.226)
      ..cubicTo(-52.1058, 172.582, -119.7332, 134.7662, -124.1153, 123.5695)
      ..cubicTo(-98.9859, 112.8537, -57.9241, 47.9875, -40.0193, 42.2582)
      ..cubicTo(-47.6545, 64.3326, -66.151, 109.1012, -66.438, 116.1184)
      ..cubicTo(-45.1165, 116.0784, -93.2203, 116.4484, -74.0509, 109.3647)
      ..cubicTo(-80.987, 126.76, -61.8815, 147.0048, -73.9215, 145.9473)
      ..cubicTo(-77.1225, 125.5406, -76.2817, 126.5491, -95.2319, 131.5732)
      ..close();

    final path_120 = Path()
      ..moveTo(3.2032, -27.219)
      ..cubicTo(1.9178, -27.37, 1.1926, -30.2027, 1.5848, -33.541)
      ..cubicTo(1.9769, -36.8792, 3.3389, -39.4668, 4.6243, -39.3158)
      ..cubicTo(5.9097, -39.1648, 6.6349, -36.332, 6.2427, -32.9938)
      ..cubicTo(5.8506, -29.6556, 4.4886, -27.068, 3.2032, -27.219)
      ..close();

    final path_121 = Path()
      ..moveTo(160.3425, -87.2338)
      ..cubicTo(170.9272, -94.5836, 69.4111, -66.1731, 83.3206, -55.8223)
      ..cubicTo(71.8452, -53.3291, 164.758, -37.7957, 163.0774, -30.1586)
      ..cubicTo(146.0768, -14.666, 151.7714, -1.8078, 135.844, 16.8613)
      ..cubicTo(114.2256, 42.2218, 87.3536, 66.3317, 109.529, 54.1212)
      ..cubicTo(87.7821, 44.109, 89.2459, -15.06, 81.564, 2.1249)
      ..cubicTo(70.9239, 6.0688, 155.8745, 6.1177, 159.0094, -13.601)
      ..close();

    final path_122 = Path()
      ..moveTo(63.8297, 99.5357)
      ..cubicTo(47.0685, 82.7516, 99.0554, 107.7457, 100.1845, 120.4736)
      ..cubicTo(103.9849, 128.6288, 59.2889, 62.9671, 63.4885, 76.4126)
      ..cubicTo(49.3525, 72.6298, 176.6931, 150.261, 175.0308, 152.6182)
      ..cubicTo(159.2721, 121.7739, 164.4742, 121.1592, 152.5731, 111.9935)
      ..cubicTo(168.2681, 131.2958, 166.7889, 163.8427, 162.3127, 162.7639)
      ..cubicTo(190.5443, 175.8003, 169.4811, 187.3953, 159.3689, 188.8346)
      ..cubicTo(164.5307, 207.5167, 170.1505, 154.6482, 177.4802, 171.2221)
      ..close();

    final path_123 = Path()
      ..moveTo(137.2618, -82.0777)
      ..cubicTo(157.8963, -77.2621, 74.8442, 0.8696, 78.0744, -23.2083)
      ..cubicTo(99.1684, -37.798, 48.2647, -79.2589, 71.4537, -95.9985)
      ..cubicTo(67.7965, -127.2053, 107.647, -6.8159, 81.9561, -7.3981)
      ..cubicTo(73.2011, -38.5334, 8.862, 2.5803, -5.9748, -5.8508)
      ..cubicTo(-11.6454, -41.8987, 123.7074, -74.8978, 121.7327, -64.8173)
      ..cubicTo(142.3126, -64.7917, 28.5762, -10.4979, 26.0093, -2.6081)
      ..close();

    final path_124 = Path()
      ..moveTo(26.661, -59.6315)
      ..cubicTo(18.5256, -48.5329, 31.1339, 16.7548, 28.7538, 16.4042)
      ..cubicTo(21.653, 40.6469, 72.4543, -87.7642, 64.191, -70.3107)
      ..cubicTo(66.8706, -60.5574, 52.9022, -53.425, 48.5733, -61.2953)
      ..cubicTo(41.0047, -84.1543, 64.5165, -51.8613, 62.5076, -64.0755)
      ..cubicTo(64.9094, -56.1859, 19.7076, 13.5307, 11.1658, 15.0508)
      ..cubicTo(14.7438, 48.3224, 42.6784, -15.1856, 36.4131, -37.7769)
      ..close();

    final path_125 = Path()
      ..moveTo(20.0792, 126.8553)
      ..lineTo(19.7466, 126.5133)
      ..cubicTo(22.1326, 128.9669, 18.8831, 136.0027, 12.4945, 142.2153)
      ..lineTo(20.2114, 134.711)
      ..cubicTo(13.8228, 140.9236, 6.699, 143.9755, 4.313, 141.5219)
      ..lineTo(4.6455, 141.8639)
      ..cubicTo(2.2595, 139.4103, 5.5091, 132.3745, 11.8977, 126.1619)
      ..lineTo(4.1808, 133.6662)
      ..cubicTo(10.5694, 127.4536, 17.6932, 124.4017, 20.0792, 126.8553)
      ..close();

    final path_126 = Path()
      ..moveTo(32.8361, 46.661)
      ..cubicTo(30.7014, 56.6196, 44.6816, 85.9873, 47.3547, 86.8392)
      ..cubicTo(50.2974, 71.1792, 56.06, 28.0306, 45.3714, 28.4559)
      ..cubicTo(43.9502, 28.1169, 55.6226, 39.5497, 53.1545, 29.1886)
      ..cubicTo(54.7802, 34.719, 41.4401, 82.0596, 43.0805, 74.0556)
      ..cubicTo(48.5548, 86.2544, 44.181, 41.074, 50.1947, 39.5826)
      ..cubicTo(58.6382, 34.0868, 29.3571, 46.0769, 26.1121, 52.7497)
      ..cubicTo(22.0079, 44.4256, 13.936, 55.4723, 12.9595, 41.7471)
      ..cubicTo(8.4335, 36.0411, 63.9283, 40.66, 61.6097, 40.0928)
      ..close();

    final path_127 = Path()
      ..moveTo(111.5835, 30.2996)
      ..cubicTo(121.6942, 29.2046, 132.587, 24.8246, 129.8671, 27.2003)
      ..cubicTo(116.2261, 54.7618, 136.6478, 73.1918, 138.6215, 85.2501)
      ..cubicTo(143.3376, 95.0798, 59.9822, 82.6623, 54.2106, 81.8874)
      ..cubicTo(68.1029, 60.1661, 41.9116, 99.7473, 51.8491, 117.6714)
      ..cubicTo(29.716, 129.1979, 100.5616, 24.6002, 105.6602, 19.2979)
      ..cubicTo(85.0746, 9.0326, 54.3841, 164.4633, 36.0489, 164.7065)
      ..cubicTo(31.1813, 150.5286, 124.701, 37.9393, 126.4839, 24.4019)
      ..close();

    final path_128 = Path()
      ..moveTo(-111.8968, 47.7518)
      ..cubicTo(-116.2848, 47.591, -122.2129, 49.9373, -116.1076, 38.6845)
      ..cubicTo(-121.5227, 33.1824, -37.9269, -2.4966, -13.8723, -0.8111)
      ..cubicTo(-8.2867, -14.228, -20.0769, -2.4917, -17.0487, -6.0918)
      ..cubicTo(-3.5879, 0.5845, -2.1724, 49.7436, 2.295, 49.1029)
      ..cubicTo(4.8765, 48.8274, -72.5815, 74.4077, -83.2332, 75.5353)
      ..cubicTo(-72.7107, 74.5264, -55.6073, 41.1526, -55.056, 39.7356)
      ..cubicTo(-41.165, 48.294, 12.5, 51.3, 9.5667, 44.1566)
      ..cubicTo(10.2625, 44.2464, -91.9969, 74.2007, -79.1432, 76.334)
      ..cubicTo(-75.8579, 79.3288, -96.0539, 23.5505, -111.1029, 28.169)
      ..close();

    final path_129 = Path()
      ..moveTo(7.1, 57.1)
      ..cubicTo(8.7557, 57.1, 10.1, 58.4443, 10.1, 60.1)
      ..cubicTo(10.1, 61.7557, 8.7557, 63.1, 7.1, 63.1)
      ..cubicTo(5.4443, 63.1, 4.1, 61.7557, 4.1, 60.1)
      ..cubicTo(4.1, 58.4443, 5.4443, 57.1, 7.1, 57.1)
      ..close();

    final path_130 = Path()
      ..moveTo(95.9617, 109.4733)
      ..cubicTo(99.7194, 131.1917, 171.9058, 178.5251, 175.1845, 170.1446)
      ..cubicTo(174.3566, 147.1485, 159.0998, 149.2251, 167.042, 148.5258)
      ..cubicTo(155.6246, 135.4604, 168.9027, 10.2209, 156.3679, 19.8498)
      ..cubicTo(165.1297, 10.3066, 180.4939, 102.8828, 173.3914, 122.598)
      ..cubicTo(168.6296, 101.5947, 91.8383, 31.1777, 93.4935, 36.6776)
      ..cubicTo(87.1009, 56.2036, 161.8717, 87.0392, 158.5414, 61.6773)
      ..cubicTo(149.9833, 48.7201, 148.5007, 46.3311, 134.4829, 26.576)
      ..close();

    final path_131 = Path()
      ..moveTo(78.6336, -37.377)
      ..cubicTo(75.6132, -23.8156, 131.9161, 29.2964, 144.7341, 40.046)
      ..cubicTo(125.6197, 60.3709, 154.1693, -4.9789, 150.1764, -15.2901)
      ..cubicTo(140.3125, -41.4572, 109.7954, -42.2402, 123.3334, -49.8303)
      ..cubicTo(118.2201, -62.9917, 91.5342, 31.1824, 84.0693, 14.033)
      ..cubicTo(73.9862, 1.3438, 139.0123, -12.7052, 146.7552, -8.5007)
      ..cubicTo(157.2019, 2.8892, 116.6944, -65.3391, 112.1783, -61.7951)
      ..cubicTo(125.85, -39.7469, 93.132, -42.5241, 96.9469, -58.2827)
      ..cubicTo(109.5443, -72.9444, 116.1466, 2.2184, 114.6025, -11.3736)
      ..cubicTo(115.7772, -28.0967, 137.2612, 8.6103, 126.2957, 3.8006)
      ..cubicTo(116.3013, -16.0257, 170.5319, -50.4819, 169.2926, -65.906)
      ..close();

    final path_132 = Path()
      ..moveTo(94.3723, 154.1174)
      ..lineTo(135.3916, 174.5688)
      ..lineTo(115.5911, 214.2824)
      ..lineTo(74.5718, 193.831)
      ..close();

    final path_133 = Path()
      ..moveTo(177.2302, 30.9664)
      ..lineTo(185.699, -7.2341)
      ..lineTo(206.5136, -2.6196)
      ..lineTo(198.0448, 35.5809)
      ..close();

    final path_134 = Path()
      ..moveTo(0, 0)
      ..lineTo(1, 0)
      ..lineTo(1, 100)
      ..lineTo(0, 100)
      ..close();

    final path_135 = Path()
      ..moveTo(22, 0)
      ..lineTo(23, 0)
      ..lineTo(23, 100)
      ..lineTo(22, 100)
      ..close();

    final path_136 = Path()
      ..moveTo(44, 0)
      ..lineTo(45, 0)
      ..lineTo(45, 100)
      ..lineTo(44, 100)
      ..close();

    final path_137 = Path()
      ..moveTo(66, 0)
      ..lineTo(67, 0)
      ..lineTo(67, 100)
      ..lineTo(66, 100)
      ..close();

    final path_138 = Path()
      ..moveTo(88, 0)
      ..lineTo(89, 0)
      ..lineTo(89, 100)
      ..lineTo(88, 100)
      ..close();

    final path_139 = Path()
      ..moveTo(0, 0)
      ..lineTo(100, 0)
      ..lineTo(100, 1)
      ..lineTo(0, 1)
      ..close();

    final path_140 = Path()
      ..moveTo(0, 22)
      ..lineTo(100, 22)
      ..lineTo(100, 23)
      ..lineTo(0, 23)
      ..close();

    final path_141 = Path()
      ..moveTo(0, 44)
      ..lineTo(100, 44)
      ..lineTo(100, 45)
      ..lineTo(0, 45)
      ..close();

    final path_142 = Path()
      ..moveTo(0, 66)
      ..lineTo(100, 66)
      ..lineTo(100, 67)
      ..lineTo(0, 67)
      ..close();

    final path_143 = Path()
      ..moveTo(0, 88)
      ..lineTo(100, 88)
      ..lineTo(100, 89)
      ..lineTo(0, 89)
      ..close();

    canvas.drawPath(path_0, paint0Fill);
    canvas.drawPath(path_1, paint1Fill);
    canvas.drawPath(path_2, paint2Stroke);
    canvas.drawPath(path_3, paint3Fill);
    canvas.drawPath(path_4, paint4Fill);
    canvas.drawPath(path_5, paint5Fill);
    canvas.drawPath(path_6, paint6Fill);
    canvas.drawPath(path_7, paint7Stroke);
    canvas.drawPath(path_8, paint8Fill);
    canvas.drawPath(path_9, paint9Stroke);
    canvas.drawPath(path_10, paint10Fill);
    canvas.drawPath(path_11, paint11Fill);
    canvas.drawPath(path_12, paint12Fill);
    canvas.drawPath(path_13, paint13Stroke);
    canvas.drawPath(path_14, paint14Stroke);
    canvas.drawPath(path_15, paint15Stroke);
    canvas.drawPath(path_16, paint16Fill);
    canvas.drawPath(path_17, paint17Stroke);
    canvas.drawPath(path_18, paint18Stroke);
    canvas.drawPath(path_19, paint19Fill);
    canvas.drawPath(path_20, paint20Stroke);
    canvas.drawPath(path_21, paint21Stroke);
    canvas.drawPath(path_22, paint22Fill);
    canvas.drawPath(path_23, paint23Fill);
    canvas.drawPath(path_23, paint24Stroke);
    canvas.drawPath(path_24, paint25Fill);
    canvas.drawPath(path_25, paint26Fill);
    canvas.drawPath(path_26, paint27Fill);
    canvas.drawPath(path_27, paint28Fill);
    canvas.drawPath(path_28, paint29Fill);
    canvas.drawPath(path_29, paint30Stroke);
    canvas.drawPath(path_30, paint31Stroke);
    canvas.drawPath(path_31, paint32Fill);
    canvas.drawPath(path_31, paint33Stroke);
    canvas.drawPath(path_32, paint34Fill);
    canvas.drawPath(path_33, paint35Fill);
    canvas.drawPath(path_33, paint36Stroke);
    canvas.drawPath(path_34, paint37Stroke);
    canvas.drawPath(path_35, paint38Fill);
    canvas.drawPath(path_36, paint39Fill);
    canvas.drawPath(path_37, paint40Fill);
    canvas.drawPath(path_38, paint41Fill);
    canvas.drawPath(path_39, paint42Fill);
    canvas.drawPath(path_40, paint43Fill);
    canvas.drawPath(path_41, paint44Fill);
    canvas.drawPath(path_42, paint45Fill);
    canvas.drawPath(path_43, paint46Stroke);
    canvas.drawPath(path_44, paint47Fill);
    canvas.drawPath(path_44, paint48Stroke);
    canvas.drawPath(path_45, paint49Stroke);
    canvas.drawPath(path_46, paint50Stroke);
    canvas.drawPath(path_47, paint51Fill);
    canvas.drawPath(path_48, paint52Fill);
    canvas.drawPath(path_49, paint53Fill);
    canvas.drawPath(path_50, paint54Fill);
    canvas.drawPath(path_50, paint55Stroke);
    canvas.drawPath(path_51, paint56Fill);
    canvas.drawPath(path_52, paint57Fill);
    canvas.drawPath(path_53, paint58Fill);
    canvas.drawPath(path_54, paint59Fill);
    canvas.drawPath(path_55, paint60Fill);
    canvas.drawPath(path_56, paint61Fill);
    canvas.drawPath(path_57, paint62Fill);
    canvas.drawPath(path_58, paint63Fill);
    canvas.drawPath(path_59, paint64Stroke);
    canvas.drawPath(path_60, paint65Fill);
    canvas.drawPath(path_61, paint66Fill);
    canvas.drawPath(path_62, paint67Fill);
    canvas.drawPath(path_63, paint68Fill);
    canvas.drawPath(path_64, paint69Fill);
    canvas.drawPath(path_65, paint70Fill);
    canvas.drawPath(path_66, paint71Fill);
    canvas.drawPath(path_66, paint72Stroke);
    canvas.drawPath(path_67, paint73Fill);
    canvas.drawPath(path_68, paint74Fill);
    canvas.drawPath(path_69, paint75Stroke);
    canvas.drawPath(path_70, paint76Fill);
    canvas.drawPath(path_71, paint77Stroke);
    canvas.drawPath(path_72, paint78Fill);
    canvas.drawPath(path_73, paint79Fill);
    canvas.drawPath(path_74, paint80Stroke);
    canvas.drawPath(path_75, paint81Fill);
    canvas.drawPath(path_76, paint82Fill);
    canvas.drawPath(path_77, paint83Fill);
    canvas.drawPath(path_78, paint84Stroke);
    canvas.drawPath(path_79, paint85Stroke);
    canvas.drawPath(path_80, paint86Stroke);
    canvas.drawPath(path_81, paint87Stroke);
    canvas.drawPath(path_82, paint88Stroke);
    canvas.drawPath(path_83, paint89Fill);
    canvas.drawPath(path_84, paint90Fill);
    canvas.drawPath(path_85, paint91Stroke);
    canvas.drawPath(path_86, paint92Stroke);
    canvas.drawPath(path_87, paint93Stroke);
    canvas.drawPath(path_88, paint94Fill);
    canvas.drawPath(path_89, paint95Fill);
    canvas.drawPath(path_90, paint96Fill);
    canvas.drawPath(path_91, paint97Fill);
    canvas.drawPath(path_92, paint98Fill);
    canvas.drawPath(path_93, paint99Stroke);
    canvas.drawPath(path_94, paint100Fill);
    canvas.drawPath(path_95, paint101Fill);
    canvas.drawPath(path_96, paint102Fill);
    canvas.drawPath(path_97, paint103Fill);
    canvas.drawPath(path_98, paint104Stroke);
    canvas.drawPath(path_99, paint105Fill);
    canvas.drawPath(path_100, paint106Fill);
    canvas.drawPath(path_101, paint107Fill);
    canvas.drawPath(path_102, paint68Fill);
    canvas.drawPath(path_103, paint108Stroke);
    canvas.drawPath(path_104, paint109Fill);
    canvas.drawPath(path_105, paint110Fill);
    canvas.drawPath(path_106, paint111Fill);
    canvas.drawPath(path_107, paint112Fill);
    canvas.drawPath(path_108, paint113Fill);
    canvas.drawPath(path_109, paint3Fill);
    canvas.drawPath(path_110, paint114Fill);
    canvas.drawPath(path_111, paint115Stroke);
    canvas.drawPath(path_112, paint116Fill);
    canvas.drawPath(path_113, paint117Fill);
    canvas.drawPath(path_114, paint118Stroke);
    canvas.drawPath(path_115, paint119Fill);
    canvas.drawPath(path_116, paint120Stroke);
    canvas.drawPath(path_117, paint121Fill);
    canvas.drawPath(path_118, paint122Stroke);
    canvas.drawPath(path_119, paint123Fill);
    canvas.drawPath(path_120, paint124Fill);
    canvas.drawPath(path_121, paint125Fill);
    canvas.drawPath(path_122, paint126Fill);
    canvas.drawPath(path_123, paint127Fill);
    canvas.drawPath(path_124, paint128Fill);
    canvas.drawPath(path_125, paint129Fill);
    canvas.drawPath(path_126, paint130Fill);
    canvas.drawPath(path_127, paint131Stroke);
    canvas.drawPath(path_128, paint132Fill);
    canvas.drawPath(path_129, paint133Fill);
    canvas.drawPath(path_130, paint134Stroke);
    canvas.drawPath(path_131, paint135Stroke);
    canvas.drawPath(path_132, paint136Fill);
    canvas.drawPath(path_133, paint137Stroke);
    canvas.saveLayer(null, paint138Fill);
    canvas.drawPath(path_134, paint139Fill);
    canvas.drawPath(path_135, paint139Fill);
    canvas.drawPath(path_136, paint139Fill);
    canvas.drawPath(path_137, paint139Fill);
    canvas.drawPath(path_138, paint139Fill);
    canvas.drawPath(path_139, paint139Fill);
    canvas.drawPath(path_140, paint139Fill);
    canvas.drawPath(path_141, paint139Fill);
    canvas.drawPath(path_142, paint139Fill);
    canvas.drawPath(path_143, paint139Fill);
    canvas.restore();

    canvas.restore();
  }

  @override
  bool shouldRepaint(GeneratedPainter oldDelegate) =>
      oldDelegate._colorFilter != _colorFilter;
}
