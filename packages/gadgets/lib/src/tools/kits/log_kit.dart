import 'package:logger/logger.dart';

class LogKit {
  static var logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      methodCount: 3,
      lineLength: 90,
    ),
  );

  static void debugLog(dynamic data) =>
      logger.d(data, stackTrace: StackTrace.empty);

  static void infoLog(dynamic data) =>
      logger.i(data, stackTrace: StackTrace.empty);

  static void errorLog(dynamic data) =>
      logger.e(data, stackTrace: StackTrace.empty);
}
