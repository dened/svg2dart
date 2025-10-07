import 'dart:async';
import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:path/path.dart' as p;
import 'package:svg2dart/generator.dart';
import 'package:svg2dart/src/not_supported_exception.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart'
    show
        initializePathOpsFromFlutterCache,
        initializeTessellatorFromFlutterCache;

final $info = io.stdout.writeln; // Log to stdout
final $err = io.stderr.writeln; // Log to stderr

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
          $info('A tool to convert SVG files to Flutter CustomPainters.');
          $info(parser.usage);
          io.exit(0);
        }

        final enableOptimizations = argResults['optimizations'] != false;
        final inputPath = argResults['input'] as String;
        final outputPath = argResults['output'] as String;

        _printSettings(inputPath, outputPath, enableOptimizations);

        if (enableOptimizations) {
          initializePathOpsFromFlutterCache();
          initializeTessellatorFromFlutterCache();
        }

        final inputType = io.FileSystemEntity.typeSync(inputPath);
        final outputType = io.FileSystemEntity.typeSync(outputPath);

        if (outputType != io.FileSystemEntityType.directory) {
          $err('Error: Output path must be a directory: $outputPath');
          io.exit(1);
        }

        if (inputType == io.FileSystemEntityType.notFound) {
          $err('Error: Input path does not exist: $inputPath');
          io.exit(1);
        }

        late List<io.File> svgFiles;
        final inputDir = inputType == io.FileSystemEntityType.directory
            ? inputPath
            : p.dirname(inputPath);

        if (inputType == io.FileSystemEntityType.file) {
          svgFiles = [io.File(inputPath)];
        } else if (inputType == io.FileSystemEntityType.directory) {
          svgFiles = io.Directory(inputPath)
              .listSync(recursive: true)
              .whereType<io.File>()
              .where((file) => p.extension(file.path) == '.svg')
              .toList();

          $info('Found ${svgFiles.length} SVG files in $inputPath.');
        }

        $info('Starting conversion...');
        var skip = 0;
        for (final svgFile in svgFiles) {
          try {
            final relativePath = p.relative(svgFile.path, from: inputDir);
            final outputFilePath = p.setExtension(
                p.join(outputPath, relativePath.replaceAll('-', '_')),
                '.gen.dart');
            generateWidgets(svgFile.path, outputFilePath);
          } on NotSupportedException catch (e) {
            $info('Warning: ${e.message} Skipping file: ${svgFile.path}');
            skip++;
          
          }
        }

        final converted = svgFiles.length - skip;
        final total = svgFiles.length;

        $info('Finished conversion [$converted/$total] files.');
      },
      (error, stackTrace) {
        $err('Error: $error');
        $err('Stack trace: $stackTrace');
        io.exit(1);
      },
    );

void _printSettings(
  String input,
  String output,
  bool opt,
) {
  $info('=================================================');
  $info('Input directory (-i):       $input');
  $info('Output directory (-o):      $output');
  $info('Optimizations (--opt):      $opt');
  $info('=================================================\n');
}
