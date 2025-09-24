// @dart=2.12

library svg2dart;

export 'src/stub_svg2dart_builder.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'src/svg2dart_builder.dart';
