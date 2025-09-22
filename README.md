 # SVG to Dart CustomPainter Converter (`svg2dart`)

`svg2dart` is a command-line tool that converts SVG files into pure Dart code. It generates Flutter `StatelessWidget`s that use `CustomPainter` to render the vector graphics.

This approach allows you to use your vector graphics directly in your Flutter application without runtime dependencies like `flutter_svg`, which can lead to better performance and a smaller dependency tree.

## Features

- Converts SVG paths, fills, strokes, and basic gradients.
- Generates a self-contained `StatelessWidget` for each SVG.
- Supports processing a single SVG file or an entire directory of SVGs.
- Preserves the source directory structure in the output directory.

## Installation

To use `svg2dart` from the command line, install it globally using `pub`:

```bash
dart pub global activate svg2dart
```

## Usage

Once activated, you can use the `svg2dart` command from anywhere in your terminal.

```bash
svg2dart [options]
```

### Options

| Flag | Abbreviation | Description | Required |
|---|---|---|---|
| `--input` | `-i` | Path to the input SVG file or directory. | Yes |
| `--output` | `-o` | Path to the output Dart file or directory. | Yes |
| `--help` | `-h` | Show the help message. | No |

### Examples

#### 1. Converting a Single File

To convert a single SVG file into a Dart widget:

```bash
dart run svg2dart --input assets/icons/cloud.svg --output lib/icons/cloud_icon.dart
```

This command will read `assets/icons/cloud.svg` and generate a `CloudIcon` widget inside `lib/icons/cloud_icon.dart`.

#### 2. Converting an Entire Directory

To convert all `.svg` files within a directory (and its subdirectories):

```bash
dart run svg2dart --input assets/icons/ --output lib/generated/icons/
```

This command will scan the `assets/icons/` directory recursively. For each `.svg` file found, it will create a corresponding `.dart` file in `lib/generated/icons/`, preserving the original folder structure.

For example, `assets/icons/user/profile.svg` will be converted to `lib/generated/icons/user/profile.dart`.

## Using the Generated Widget

After generation, you can import the Dart file and use the widget like any other Flutter widget. You can override the original SVG dimensions by providing `width` and `height` properties.

```dart
import 'package:my_app/generated/icons/cloud_icon.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // Use the generated widget with a custom size
        child: CloudIcon(
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
```
