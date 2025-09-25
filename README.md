 # SVG to Dart Widget Converter (`svg2dart`)

`svg2dart` is a command-line tool that converts SVG files into pure Dart code. It generates performant Flutter widgets that use `LeafRenderObjectWidget` and a pre-recorded `ui.Picture` for rendering.

This approach allows you to use your vector graphics directly in your Flutter application without runtime dependencies like `flutter_svg`, which can lead to better performance and a smaller dependency tree.

## Features

- Converts SVG paths, fills, strokes, and basic gradients.
- Generates a self-contained, high-performance `LeafRenderObjectWidget` for each SVG.
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
svg2dart --input assets/icons/cloud.svg --output lib/icons/cloud.dart
``` 

This command will read `assets/icons/cloud.svg` and generate a `Cloud` widget inside `lib/icons/cloud.dart`.

#### 2. Converting an Entire Directory

To convert all `.svg` files within a directory (and its subdirectories):

```bash
svg2dart --input assets/icons/ --output lib/generated/icons/
```

## Alternative: Usage with `build_runner`

For automatic code generation that integrates with your development workflow, you can use `svg2dart` as a builder.

1.  **Add dependencies** to your project's `pubspec.yaml`:

    ```yaml
    dev_dependencies:
      build_runner: ^2.4.0 # or latest
      svg2dart: ^0.0.4 # or latest
    ```

2.  **Run the builder**:

    To generate the Dart files once:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
    To watch for file changes and regenerate automatically:
    ```bash
    dart run build_runner watch --delete-conflicting-outputs
    ```

By default, the builder processes `.svg` files from the `assets/svg` directory and places the generated `.dart` files into `lib/generated/svg`. You can customize these paths by creating a `build.yaml` file in your project's root.

Here is an example of a `build.yaml` file that changes the default input and output directories:

```yaml
targets:
  $default:
    builders:
      svg2dart:
        options:
          # Default is "assets/svg"
          input: "assets/my_icons"
          # Default is "lib/generated/svg"
          output: "lib/my_generated_icons"
```
```

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
