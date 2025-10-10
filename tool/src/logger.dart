import 'dart:io' as io;

enum _Level { info, error }

void _log(_Level level, String message) {
  // ignore: avoid_print
  print('[${level.name.toUpperCase()}] $message');
}

void info(String message) => _log(_Level.info, message);

void error(String message) {
  _log(_Level.error, message);
  io.exit(1);
}

void complete(String message) {
  _log(_Level.info, message);
  io.exit(0);
}
