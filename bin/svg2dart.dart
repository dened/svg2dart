import 'dart:async';
import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:path/path.dart' as p;
import 'package:svg2dart/generator.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart'
    show
        initializePathOpsFromFlutterCache,
        initializeTessellatorFromFlutterCache;

final $log = io.stdout.writeln; // Log to stdout
final $err = io.stderr.writeln; // Log to stderr

Future<void> _fix(String path) async {
  $log('Applying fixes to $path...');
  final result = await io.Process.run('dart', ['fix', '--apply', path]);
  if (result.exitCode != 0) {
    // Don't exit, just warn.
    $err('Could not apply fixes to $path. Error: ${result.stderr}');
  }
}

void main([List<String> arguments = const <String>[]]) => runZonedGuarded<void>(
      () async {
        final parser = ArgParser()
          ..addOption('input',
              abbr: 'i',
              help: 'Path to the input SVG file or directory.',
              mandatory: true)
          ..addOption('output',
              abbr: 'o',
              help: 'Path to the output Dart file or directory.',
              mandatory: true)
          ..addFlag(
            'optimizations',
            aliases: ['opt'],
            help:
                'Enable optimizations (e.g., path simplification, masking, overdraw).',
            defaultsTo: false,
          )
          ..addFlag('help',
              abbr: 'h', negatable: false, help: 'Show this help message.');

        ArgResults argResults;
        try {
          argResults = parser.parse(arguments);
        } on FormatException catch (e) {
          $err(e.message);
          $err(parser.usage);
          io.exit(1);
        }

        if (argResults['help'] as bool) {
          $log('A tool to convert SVG files to Flutter CustomPainters.');
          $log(parser.usage);
          io.exit(0);
        }

        final enableOptimizations = argResults['optimizations'] != false;
        final inputPath = argResults['input'] as String;
        final outputPath = argResults['output'] as String;

        if (enableOptimizations) {
          initializePathOpsFromFlutterCache();
          initializeTessellatorFromFlutterCache();
        }

        final inputType = io.FileSystemEntity.typeSync(inputPath);

        if (inputType == io.FileSystemEntityType.notFound) {
          $err('Error: Input path does not exist: $inputPath');
          io.exit(1);
        }

        if (inputType == io.FileSystemEntityType.file) {
          if (p.extension(outputPath) == '') {
            $err(
                'Error: When input is a file, output must be a file path (e.g., path/to/file.dart).');
            io.exit(1);
          }
          $log('Start parsing file $inputPath...');
          await generateWidgets(inputPath, outputPath);
          await _fix(outputPath);
          $log('Finished conversion.');
        } else if (inputType == io.FileSystemEntityType.directory) {
          if (p.extension(outputPath) != '') {
            $err('When input is a directory, output must also be a directory.');
            io.exit(1);
          }

          final svgFiles = io.Directory(inputPath)
              .listSync(recursive: true)
              .whereType<io.File>()
              .where((file) => p.extension(file.path) == '.svg');

          $log('Found ${svgFiles.length} SVG files in $inputPath.');
          $log('Starting conversion...');

          for (final svgFile in svgFiles) {
            final relativePath = p.relative(svgFile.path, from: inputPath);
            final outputFilePath = p.setExtension(
                p.join(outputPath, relativePath.replaceAll('-', '_')), '.dart');
            await generateWidgets(svgFile.path, outputFilePath);
          }
          await _fix(outputPath);
          $log('Finished conversion of all SVG files.');
        }
      },
      (error, stackTrace) {
        $err('Error: $error');
        $err('Stack trace: $stackTrace');
        io.exit(1);
      },
    );
