import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:dash_flags/dash_flags.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({
    super.key,
    required this.isoCode,
    this.height = 32,
  });
  final String isoCode;
  final double height;

  @override
  Widget build(BuildContext context) => flag ?? Container();

  Widget? get flag {
    var key = isoCode.replaceAll('-', '_');
    if (key.contains('zh_')) {
      key = key.toLowerCase().contains('tw') ? 'zh_TW' : 'zh';
    }
    if (key == 'jw') key = 'jv';
    if (key == 'is') key = 'l_is';

    final language = Language.values.firstWhereOrNull((e) => e.name == key);
    if (language != null) {
      return LanguageFlag(language: language, height: height);
    }

    final country = Country.values.firstWhereOrNull((e) => e.name == key);
    if (country != null) {
      return CountryFlag(country: country, height: height);
    }

    return null;
  }
}
