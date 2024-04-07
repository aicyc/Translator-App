part of 'translator_cubit.dart';

enum FT {
  from,
  to;

  bool get isFrom => this == from;
  bool get isTo => this == to;

  String get text {
    switch (this) {
      case FT.from:
        return 'From';
      case FT.to:
        return 'To';
    }
  }

  LanguageModel _getLanguageModel(TranslatorState state) =>
      isFrom ? state.toLanguageModel : state.fromLanguageModel;
  TranslatorState _changeLanguage(
    TranslatorState state,
    LanguageModel newLanguage,
  ) =>
      state.copyWith(
        fromLanguageModel: isFrom ? newLanguage : state.fromLanguageModel,
        toLanguageModel: isTo ? newLanguage : state.toLanguageModel,
      );
}

abstract class TranslatorCubitHelper extends Cubit<TranslatorState> {
  TranslatorCubitHelper(super.initialState);

  final _flutterTts = FlutterTts();
  final _speechToText = SpeechToText();
  final _translator = GoogleTranslator();
  String _gettedTextFromSpeech = '';
  CancelableOperation<Translation?>? _cancelableOperationTranslation;
  CancelableOperation<dynamic>? _cancelableOperationListeningMic;
  final _historyCubit = BlocProvider.of<HistoryCubit>(Get.context!);

  bool _showPermSnackbar = false;

  Permission get _micPermission => Permission.microphone;

  final translateController = TextEditingController();

  void translate() async {
    final val = translateController.text;
    emit(state.copyWith(isTranslating: true));
    _cancelableOperationTranslation?.cancel();
    _cancelableOperationTranslation =
        CancelableOperation.fromFuture(_translate(val));
    final fromLanguageModel = state.fromLanguageModel;
    final toLanguageModel = state.toLanguageModel;
    _cancelableOperationTranslation!.then((translation) async {
      final translatedText = translation?.text ?? '';
      final recognizedCountryName = translation?.sourceLanguage.name ?? '';
      final recognizedIsoCode = translation?.sourceLanguage.code ?? '';
      emit(state.copyWith(
        isTranslating: false,
        translatedText: translatedText,
        recognizedCountryName: recognizedCountryName,
        recognizedIsoCode: recognizedIsoCode,
      ));
      if (translatedText.isNotEmpty && val.isNotEmpty) {
        final historyModel = HistoryModel(
          fromLanguageModel: fromLanguageModel,
          toLanguageModel: toLanguageModel,
          textToBeTranslated: val.trim(),
          translatedText: translatedText.trim(),
        );
        await _historyCubit.addAndSaveIntoStorage(historyModel);
      }
      _cancelableOperationTranslation = null;
    });
  }

  void _stopTtsHandler([_]) => emit(
        state.copyWith
            .fromTtsModel(ttsState: TtsState.stopped)
            .copyWith
            .toTtsModel(ttsState: TtsState.stopped),
      );

  void _setTtsHandler() {
    _flutterTts.setCompletionHandler(_stopTtsHandler);
    _flutterTts.setErrorHandler(_stopTtsHandler);
  }

  Future<Translation?> _translate(String val) async {
    if (val.isEmpty) return null;
    await Future.delayed(const Duration(milliseconds: 500));
    final fromLanguageModel = state.fromLanguageModel;
    final toLanguageModel = state.toLanguageModel;
    final result = await _translator.translate(
      val,
      from: fromLanguageModel.isoCode,
      to: toLanguageModel.isoCode,
    );
    await Future.delayed(const Duration(seconds: 2));
    return result;
  }

  String _getIsoCodeFromFT(FT ft) {
    if (ft.isTo) return state.toLanguageModel.isoCode;

    final fromIsoCode = state.fromLanguageModel.isoCode;
    if (fromIsoCode != 'auto') return fromIsoCode;

    return state.recognizedIsoCode;
  }

  Future _listenSpeech() async {
    while (state.isMicListening) {
      await _speechToText.listen(
        onResult: _onSpeechResult,
        listenFor: const Duration(seconds: 999),
        pauseFor: const Duration(seconds: 999),
        listenMode: ListenMode.dictation,
      );
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (result.recognizedWords.isEmpty) return;
    if (!result.finalResult) return;
    final recognizedWords = _gettedTextFromSpeech.isEmpty
        ? result.recognizedWords
        : result.recognizedWords.toLowerCase();
    _gettedTextFromSpeech += ' $recognizedWords';
    _gettedTextFromSpeech = _gettedTextFromSpeech.trim();
    translateController.text = _gettedTextFromSpeech;
    translate();
  }
}
