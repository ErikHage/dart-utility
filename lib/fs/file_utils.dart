// TODO Needs Flutter

// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:mime_type/mime_type.dart';
// import 'package:path/path.dart' as path;
//
// class AmosFileUtils {
//   static final Logger _logger = LoggerFactory.getLogger(AmosFileUtils);
//
//   static Future<void> saveToLocalStorage(String filePath, List<int> content) async {
//     String documentsPath = await getApplicationDocumentsDirectoryPath();
//     File file = File(path.join(documentsPath, filePath));
//     try {
//       file = await file.create(recursive: true);
//       await file.writeAsBytes(content);
//     } on Exception catch (ex, st) {
//       _logger.error("Exception saving file $filePath", exception: ex, stackTrace: st);
//       throw FileSaveException(message: "Exception saving file $filePath");
//     } on Error catch (err, st) {
//       _logger.error("Error saving file $filePath", error: err, stackTrace: st);
//       throw FileSaveException(message: "Error saving file $filePath");
//     }
//   }
//
//   static Future<Uint8List> loadFromLocalStorage(String filePath) async {
//     String documentsPath = await getApplicationDocumentsDirectoryPath();
//     File file = File(path.join(documentsPath, filePath));
//     try {
//       return await file.readAsBytes();
//     } on Exception catch (ex, st) {
//       _logger.error("Exception reading file $filePath", exception: ex, stackTrace: st);
//       throw FileReadException(message: "Exception reading file $filePath", cause: ex);
//     } on Error catch (err, st) {
//       _logger.error("Error reading file $filePath", error: err, stackTrace: st);
//       throw FileReadException(
//           message: "Error reading file $filePath due to error ${err.toString()}");
//     }
//   }
//
//   static Future<String> getApplicationDocumentsDirectoryPath() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     return documentDirectory.path;
//   }
//
//   static String getFileExtensionFromMimeType({
//     required String mimeType,
//     String defaultExtension = "",
//   }) {
//     String? fileExtension = extensionFromMime(mimeType);
//
//     if (fileExtension == null) {
//       return defaultExtension;
//     }
//
//     return ".$fileExtension";
//   }
// }
//
// class FileSaveException extends AmosException {
//   FileSaveException({
//     required String message,
//     Exception? cause,
//   }) : super(
//     message: message,
//     cause: cause,
//   );
// }
//
// class FileReadException extends AmosException {
//   FileReadException({
//     required String message,
//     Exception? cause,
//   }) : super(
//     message: message,
//     cause: cause,
//   );
// }