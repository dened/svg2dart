import 'package:meta/meta.dart';

@internal
String generateCodeFromTemplate(
    {required String widgetName,
    required bool useTypedDataImport,
    required StringBuffer definitions,
    required StringBuffer drawCommands,
    required Size size}) {
  final template = '''
import 'dart:math';
${useTypedDataImport ? "import 'dart:typed_data';" : ''}
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';


/// {@template $widgetName}
/// $widgetName widget.
/// {@endtemplate}
class $widgetName extends LeafRenderObjectWidget {
  /// {@macro $widgetName}
  const $widgetName({super.key, this.width, this.height, this.colorFilter});

  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;

  static const Size svgSize = Size(${shortDouble(size.width)}, ${shortDouble(size.height)});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      ${widgetName}RenderObject()
        ..width = width
        ..height = height
        ..colorFilter = colorFilter;

  @override
  void updateRenderObject(
    BuildContext context,
    ${widgetName}RenderObject renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height
      ..colorFilter = colorFilter;
  }
}

class ${widgetName}RenderObject extends RenderBox {
  ${widgetName}RenderObject();

  final _painter = _${widgetName}Painter();
  
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
    final desiredWidth = _width ?? $widgetName.svgSize.width;
    final desiredHeight = _height ?? $widgetName.svgSize.height;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
    if ($widgetName.svgSize.width == 0 || $widgetName.svgSize.height == 0) {
      _scale = 1.0;
      return;
    }
    _scale = min(
      size.width / $widgetName.svgSize.width,
      size.height / $widgetName.svgSize.height,
    );
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final scale = _scale;
    final canvas = context.canvas..save();

    final dx = (size.width - $widgetName.svgSize.width * scale) / 2;
    final dy = (size.height - $widgetName.svgSize.height * scale) / 2;

    canvas
      ..translate(offset.dx + dx, offset.dy + dy)
      ..clipRect(Offset.zero & size)
      ..scale(scale, scale);

    canvas.drawPicture(_painter.getPicture(_colorFilter));

    canvas.restore();
  }
}

class _${widgetName}Painter {
  ui.Picture? _picture;
  ui.ColorFilter? _colorFilter;

  ui.Picture getPicture(ui.ColorFilter? newColorFilter) {
    if (_picture == null || _colorFilter != newColorFilter) {
      _colorFilter = newColorFilter;
      _createPicture();
    }
    return _picture!;
  }

  void _createPicture() {
    _picture?.dispose();
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    ${definitions.toString()}
    ${drawCommands.toString()}
     _picture = recorder.endRecording();
  }
}
''';

  return template;
}

@internal
String drawTextFunction = '''
    void drawText(
      Paint paint, {
      required String text,
      required double xAnchorMultiplier,
      required int fontWeight,
      required TextDecorationStyle decorationStyle,
      required double dx,
      required double dy,
      String? fontFamily,
      double? fontSize,
      TextDecoration? decoration,
      Color? decorationColor,
      Float64List? transform,
    }) {
      final paragraphBuilder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
        ),
      );
      paragraphBuilder.pushStyle(
        ui.TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.values[fontWeight],
          decoration: decoration,
          decorationStyle: decorationStyle,
          decorationColor: decorationColor,
        ),
      );
      paragraphBuilder.pushStyle(ui.TextStyle(foreground: paint));
      paragraphBuilder.addText(text);
      final paragraph = paragraphBuilder.build();
      paragraph.layout(const ui.ParagraphConstraints(width: double.infinity));
      paragraphWidth = paragraph.maxIntrinsicWidth;

      if (transform != null) {
        canvas.save();
        canvas.transform(transform);
      }
      canvas.drawParagraph(
        paragraph,
        Offset(
          dx + accumulatedTextWidth - paragraph.maxIntrinsicWidth * xAnchorMultiplier,
          dy - paragraph.alphabeticBaseline,
        ),
      );
      if (transform != null) canvas.restore();
    }
    ''';

@internal
String shortDouble(double val) {
  if (val == val.roundToDouble()) {
    return val.toInt().toString();
  }
  var s = val.toStringAsFixed(4);
  s = s.replaceAll(RegExp(r'0+$'), '');
  s = s.replaceAll(RegExp(r'\.$'), '');
  return s;
}

@internal
class Size {
  final double width;
  final double height;

  const Size(this.width, this.height);

  static const Size zero = Size(0, 0);
}
