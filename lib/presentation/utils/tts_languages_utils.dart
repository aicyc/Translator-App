import 'package:collection/collection.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'utils_languages.dart';

class TtsLanguagesUtils {
  const TtsLanguagesUtils._();

  static List<String> _instance = [];
  static List<String> get instance => _instance;

  static Future<void> init() async {
    final List<Object?> languagesObj = await FlutterTts().getLanguages;
    final languages = languagesObj.map<String>((e) => e.toString()).toList();
    final List<String> languagesInstance = [];
    for (final item in UtilsLanguages.list) {
      if (item['isoCode'] == 'auto') continue;
      final language = languages.firstWhereOrNull(
        (e) => e.toLowerCase().contains(item['isoCode']!.toLowerCase()),
      );
      if (language == null) continue;
      languagesInstance.add(language);
    }
    _instance = languagesInstance;
  }
}
