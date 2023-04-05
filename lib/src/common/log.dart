import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  /// `View file to view format at the top`
  static void i(dynamic log, {dynamic title}) {
    _logger.i(
      log,
      title,
    );
  }

  static void d(dynamic message, {dynamic title}) {
    _logger.d(message, title);
  }

  static void e(dynamic message, {dynamic error}) {
    _logger.e(message, error);
  }

  static void v(dynamic message, {dynamic title}) {
    _logger.v(message, title);
  }

  static void w(dynamic message, {dynamic title}) {
    _logger.w(message, title);
  }

  /// `View file to view format at the top`
  static void wtf(dynamic message, {dynamic error}) {
    _logger.wtf(message, error);
  }
}
