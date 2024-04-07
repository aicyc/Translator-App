import '../../utils/utils_languages.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class LanguageModel with _$LanguageModel {
  const factory LanguageModel({
    @Default('') String isoCode,
    @Default('') String countryName,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  static List<LanguageModel> get languages =>
      UtilsLanguages.list.map((e) => LanguageModel.fromJson(e)).toList();
  static List<LanguageModel> get languagesWithoutAuto =>
      languages..removeWhere((e) => e.isoCode == 'auto');

  static const LanguageModel defaultFromValue = LanguageModel(
    isoCode: 'auto',
    countryName: 'Auto',
  );
  static const LanguageModel defaultToValue = LanguageModel(
    isoCode: 'en',
    countryName: 'English',
  );
}
