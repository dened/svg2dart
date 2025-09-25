# Changelog

## 0.0.4

* The code generator has been completely rewritten to produce widgets based on `LeafRenderObjectWidget` and a pre-recorded `ui.Picture`.
* Generated widgets now accept `width` and `height` parameters for direct sizing, similar to `flutter_svg`.
* The generator now detects and skips SVG files that contain `<image>` tags, as raster images are not supported.
* Updated package description and `README.md` to reflect the new architecture.

## 0.0.3
* Add support for build_runner

## 0.0.2

* Add formatting and fixing functions for SVG output.
* Improve code generation.

## 0.0.1

* Initial release of the package.
* Converts SVG files to Flutter `CustomPainter` widgets.
* Supports paths, fills, strokes, and basic gradients.
* Handles single files and entire directories.