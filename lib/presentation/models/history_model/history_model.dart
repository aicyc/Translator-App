import 'package:freezed_annotation/freezed_annotation.dart';

import '../language_model/language_model.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
class HistoryModel with _$HistoryModel {
  const factory HistoryModel({
    required LanguageModel fromLanguageModel,
    required LanguageModel toLanguageModel,
    required String textToBeTranslated,
    required String translatedText,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}
