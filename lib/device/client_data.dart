// TODO Needs Flutter
// import 'package:dart_utility/logger/logger_factory.dart';
// import 'package:package_info_plus/package_info_plus.dart';
//
// class ClientDataHelper {
//   static final Logger _logger = LoggerFactory.getLogger(ClientDataHelper);
//   static ClientData? _clientData;
//
//   ClientDataHelper._();
//
//   static Future<ClientData> getClientData() async {
//     if (_clientData == null) {
//       _logger.info("Loading client data");
//       await _loadClientData();
//     }
//
//     return _clientData!;
//   }
//
//   static Future<void> _loadClientData() async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//
//     _clientData = ClientData(
//       appName: packageInfo.appName,
//       packageName: packageInfo.packageName,
//       version: packageInfo.version,
//       buildNumber: packageInfo.buildNumber,
//       buildSignature: packageInfo.buildSignature,
//     );
//   }
// }
//
// class ClientData {
//   final String appName;
//   final String packageName;
//   final String version;
//   final String buildNumber;
//   final String buildSignature;
//
//   ClientData({
//     required this.appName,
//     required this.packageName,
//     required this.version,
//     required this.buildNumber,
//     required this.buildSignature,
//   });
// }