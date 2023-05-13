import 'package:dart_utility/logger/logger_factory.dart';
import 'package:test/test.dart';

void main() {
  group('LoggerFactory.getLogger(Type)', () {
    test('#getLogger returns Logger object with provided class name - LoggerFactory', () {
      Logger logger = LoggerFactory.getLogger(LoggerFactory);

      expect(logger.getType(), 'LoggerFactory');
    });

    test('#getLogger returns Logger object with info log level - info', () {
      Logger logger = LoggerFactory.getLogger(LoggerFactory);

      expect(logger.logLevel, LogLevel.info);
    });

    test('#getLogger returns Logger object with provided log level - trace', () {
      Logger logger = LoggerFactory.getLogger(LoggerFactory, logLevel: LogLevel.trace);

      expect(logger.logLevel, LogLevel.trace);
    });
  });
}
