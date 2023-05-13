import 'dart:developer';

enum LogLevel {
  trace,
  debug,
  info,
  warn,
  error,
  fatal,
}

class LoggerFactory {
  static Logger getLogger(Type clazz, { LogLevel logLevel = LogLevel.info, }) {
    return Logger._(logLevel, clazz);
  }
}

class Logger {
  late final LogLevel logLevel;
  late final Type _class;

  Logger._(LogLevel level, Type type) {
    logLevel = level;
    _class = type;
  }

  void trace(
      String message, {
        Exception? exception,
        Error? error,
        StackTrace? stackTrace,
      }) {
    if (logLevel.index <= LogLevel.trace.index) {
      _log(
        level: LogLevel.trace,
        msg: message,
        ex: exception,
        err: error,
        stackTrace: stackTrace,
      );
    }
  }

  void debug(
      String message, {
        Exception? exception,
        Error? error,
        StackTrace? stackTrace,
        bool syncToServer = false,
      }) {
    if (logLevel.index <= LogLevel.debug.index) {
      _log(
        level: LogLevel.debug,
        msg: message,
        ex: exception,
        err: error,
        stackTrace: stackTrace,
      );
    }
  }

  void info(
      String message, {
        Exception? exception,
        Error? error,
        StackTrace? stackTrace,
        bool syncToServer = false,
      }) {
    if (logLevel.index <= LogLevel.info.index) {
      _log(
        level: LogLevel.info,
        msg: message,
        ex: exception,
        err: error,
        stackTrace: stackTrace,
      );
    }
  }

  void warn(
      String message, {
        Exception? exception,
        Error? error,
        StackTrace? stackTrace,
        bool syncToServer = true,
      }) {
    if (logLevel.index <= LogLevel.warn.index) {
      _log(
        level: LogLevel.warn,
        msg: message,
        ex: exception,
        err: error,
        stackTrace: stackTrace,
      );
    }
  }

  void error(
      String message, {
        Exception? exception,
        Error? error,
        StackTrace? stackTrace,
        bool syncToServer = true,
      }) {
    if (logLevel.index <= LogLevel.error.index) {
      _log(
        level: LogLevel.error,
        msg: message,
        ex: exception,
        err: error,
        stackTrace: stackTrace,
      );
    }
  }

  void fatal(
      String message, {
        Exception? exception,
        Error? error,
        StackTrace? stackTrace,
        bool syncToServer = true,
      }) {
    if (logLevel.index <= LogLevel.fatal.index) {
      _log(
        level: LogLevel.fatal,
        msg: message,
        ex: exception,
        err: error,
        stackTrace: stackTrace,
      );
    }
  }

  void _log({
    required LogLevel level,
    required String msg,
    Exception? ex,
    Error? err,
    StackTrace? stackTrace,
  }) {
    String timestamp = DateTime.now().toUtc().toIso8601String();

    String message = "[$timestamp][${level.name.padRight(5)}][$_class] $msg";

    if (ex != null || err != null || stackTrace != null) {
      String errorMsg = "";

      if (ex != null) {
        errorMsg += ex.toString();
      }

      if (err != null) {
        errorMsg += err.toString();
      }

      if (stackTrace != null) {
        errorMsg += errorMsg.isNotEmpty ? "\n" : "";
        errorMsg += stackTrace.toString();
      }
      message = "[$timestamp][${logLevel.name.padRight(5)}][$_class] $errorMsg";
    }

    log(message);
  }

  String getType() {
    return _class.toString();
  }
}