import 'dart:async';
import 'dart:io';

import 'package:dart_utility/logger/logger_factory.dart';

class ConnectivityUtils {
  static final Logger _logger = LoggerFactory.getLogger(ConnectivityUtils);
  static const int _networkCheckIntervalSeconds = 30;
  static const int _networkCheckTimeoutSeconds = 3;

  static bool _isConnected = false;
  static Timer? _networkCheckTimer;

  static bool hasNetwork() {
    return _isConnected;
  }

  static Future<void> refreshNetworkConnectionStatus() async {
    try {
      final result = await InternetAddress.lookup('example.com').timeout(
        const Duration(seconds: _networkCheckTimeoutSeconds),
        onTimeout: () async {
          throw TimeoutException("lookup of example.com timed out");
        },
      );
      _isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on TimeoutException {
      _logger.debug(
          "timed out trying to lookup for network connectivity, assume no network connectivity");
      _isConnected = false;
    } on SocketException {
      _logger.debug("no response from lookup, assume no network connectivity");
      _isConnected = false;
    } on Exception catch (ex, st) {
      _logger.debug(
        "unexpected exception occurred when checking network connectivity, assume no network connectivity",
        exception: ex,
        stackTrace: st,
      );
      _isConnected = false;
    }
    _logger.trace("has network connection: $_isConnected");
  }

  static Future<void> initializeNetworkConnectivityCheck() async {
    await refreshNetworkConnectionStatus();
    _logger.debug("initializing network connection status periodic check");
    _networkCheckTimer?.cancel();
    _networkCheckTimer = Timer.periodic(
      const Duration(seconds: _networkCheckIntervalSeconds),
          (timer) {
        _logger.trace("refreshing network connection status");
        refreshNetworkConnectionStatus();
      },
    );
  }

  static void stopNetworkConnectivityCheck() {
    _logger.debug("stopping network connection status periodic check");
    _networkCheckTimer?.cancel();
  }
}