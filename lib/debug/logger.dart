import 'dart:developer';

class Logger {
  // Logging function
  static void write(String text, {bool isError = false}) {
    Future.microtask(() =>
        log(text + (isError ? '. isError: [$isError]' : ''), name: 'GETX'));
  }
}
