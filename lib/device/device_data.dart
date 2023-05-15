// TODO Needs Flutter
// import 'dart:io';
//
// import 'package:dart_utility/logger/logger_factory.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:platform_device_id/platform_device_id.dart';
//
// class DeviceDataHelper {
//   static final Logger _logger = LoggerFactory.getLogger(DeviceDataHelper);
//   static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
//   static DeviceData? _deviceData;
//
//   DeviceDataHelper._();
//
//   static Future<DeviceData> getDeviceData() async {
//     if (_deviceData == null) {
//       _logger.info("Loading device data");
//       await _loadDeviceData();
//     }
//
//     return _deviceData!;
//   }
//
//   static Future<void> _loadDeviceData() async {
//     String deviceId = await PlatformDeviceId.getDeviceId ?? "";
//
//     if (Platform.isAndroid) {
//       _deviceData = _getAndroidData(await _deviceInfoPlugin.androidInfo, deviceId);
//     } else if (Platform.isIOS) {
//       _deviceData = _getIOSData(await _deviceInfoPlugin.iosInfo, deviceId);
//     } else {
//       _logger.warn("Unsupported platform");
//     }
//   }
//
//   static DeviceData _getAndroidData(AndroidDeviceInfo data, String deviceId) {
//     return DeviceData(
//       platform: "android",
//       platformVersion: data.version.release ?? "unknown",
//       deviceId: deviceId,
//     );
//   }
//
//   static DeviceData _getIOSData(IosDeviceInfo data, String deviceId) {
//     return DeviceData(
//       platform: "ios",
//       platformVersion: data.systemVersion ?? "unknown",
//       deviceId: deviceId,
//     );
//   }
//
//   static Future<String> getDeviceId() async {
//     return await PlatformDeviceId.getDeviceId ?? "";
//   }
// }
//
// class DeviceData {
//   final String platform;
//   final String platformVersion;
//   final String deviceId;
//
//   DeviceData({
//     required this.platform,
//     required this.platformVersion,
//     required this.deviceId,
//   });
// }