import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DirectoryUtils {
  const DirectoryUtils._();

  static Directory? _tempDir;
  static Directory get tempDir => _tempDir!;
  static Directory? _applicationDir;
  static Directory get applicationDir => _applicationDir!; 

  static Future<void> init() async {
    _tempDir ??= await getTemporaryDirectory();
    _applicationDir ??= await getApplicationSupportDirectory();
  }
}