# Changelog

## Unreleased
* FIX: Ensure generated widgets properly clip their content to the specified width and height, preventing overflow issues.

## 0.0.5

*   Added the ability to generate three types of classes for rendering, selectable with the `convertTo` option:
    *   `customPainter`: Renders the SVG using a `CustomPainter`.
    *   `record`: Pre-records the SVG into a `ui.Picture` for optimized performance.
    *   `renderBox`: Renders the SVG directly within a `LeafRenderObjectWidget`.
*   Added a new `optimizations` flag. When enabled, it uses `pathops` for path simplification and
    `Tessellator` to convert paths into vertices for direct GPU rendering, which can significantly improve performance.

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