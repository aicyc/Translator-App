// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryModelImpl _$$HistoryModelImplFromJson(Map<String, dynamic> json) =>
    _$HistoryModelImpl(
      fromLanguageModel: LanguageModel.fromJson(
          json['fromLanguageModel'] as Map<String, dynamic>),
      toLanguageModel: LanguageModel.fromJson(
          json['toLanguageModel'] as Map<String, dynamic>),
      textToBeTranslated: json['textToBeTranslated'] as String,
      translatedText: json['translatedText'] as String,
    );

Map<String, dynamic> _$$HistoryModelImplToJson(_$HistoryModelImpl instance) =>
    <String, dynamic>{
      'fromLanguageModel': instance.fromLanguageModel,
      'toLanguageModel': instance.toLanguageModel,
      'textToBeTranslated': instance.textToBeTranslated,
      'translatedText': instance.translatedText,
    };
