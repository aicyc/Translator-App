part of 'translator_cubit.dart';

@freezed
class TranslatorState with _$TranslatorState {
  const factory TranslatorState.initial({
    @Default(LanguageModel.defaultFromValue) LanguageModel fromLanguageModel,
    @Default(LanguageModel.defaultToValue) LanguageModel toLanguageModel,

    @Default('') String translatedText,
    @Default('') String recognizedCountryName,
    @Default('') String recognizedIsoCode,
    @Default(false) bool isTranslating,

    @Default(TtsModel(ft: FT.from)) TtsModel fromTtsModel,
    @Default(TtsModel(ft: FT.to)) TtsModel toTtsModel,
    @Default(FT.from) FT ftTtsModel,

    @Default(false) bool isMicListening,
  }) = _Initial;
}
