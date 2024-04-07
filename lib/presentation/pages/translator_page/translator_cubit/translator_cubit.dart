import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/translator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../models/history_model/history_model.dart';
import '../../../models/language_model/language_model.dart';
import '../../../models/tts_model/tts_model.dart';
import '../../../utils/tts_languages_utils.dart';
import '../../history_page/history_cubit/history_cubit.dart';

part 'translator_state.dart';
part 'translator_cubit_helper.dart';
part 'translator_cubit.freezed.dart';

class TranslatorCubit extends TranslatorCubitHelper {
  TranslatorCubit() : super(const TranslatorState.initial());

  void init() {
    _setTtsHandler();
  }

  void changeLanguage({
    required FT ft,
    required LanguageModel newLanguage,
  }) {
    final isLanguagesEquals = newLanguage == ft._getLanguageModel(state);

    if (isLanguagesEquals) {
      swapLanguages();
      return;
    }

    emit(ft._changeLanguage(state, newLanguage));
    clearTranslatedText();
    translate();
  }

  void swapLanguages() {
    if (state.fromLanguageModel.isoCode == 'auto') return;

    emit(state.copyWith(
      toLanguageModel: state.fromLanguageModel,
      fromLanguageModel: state.toLanguageModel,
    ));
    translateController.text = state.translatedText;
    clearTranslatedText();
    translate();
  }

  void clearTranslatedText() => emit(state.copyWith(
        translatedText: '',
        recognizedCountryName: '',
        recognizedIsoCode: '',
      ));

  Future<void> copy() async {
    await Clipboard.setData(ClipboardData(text: state.translatedText));
    Get
      ..closeAllSnackbars()
      ..snackbar(
        'Success!',
        'The translated text has been copied',
        duration: const Duration(seconds: 5),
      );
  }

  Future<void> paste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text;
    if (text == null || text.isEmpty) return;

    translateController.text = text;
    translate();
  }

  Future<void> share() => Share.share(state.translatedText);

  void ttsListen(FT ft, String text) async {
    String isoCode = _getIsoCodeFromFT(ft);
    if (isoCode.isEmpty) isoCode = 'en';
    String? language = TtsLanguagesUtils.instance.firstWhereOrNull(
      (e) => e.toLowerCase().contains(isoCode.toLowerCase()),
    );
    language ??= 'en-US';
    _stopTtsHandler();
    if (ft.isFrom) {
      emit(state.copyWith.fromTtsModel(ttsState: TtsState.playing));
    } else {
      emit(state.copyWith.toTtsModel(ttsState: TtsState.playing));
    }
    await _flutterTts.setLanguage(language);
    await _flutterTts.speak(text);
    emit(state.copyWith(ftTtsModel: ft));
  }

  void ttsStop() async {
    await _flutterTts.stop();
    _stopTtsHandler();
  }

  Future<void> startListening() async {
    final micStatus = await _micPermission.request();
    if (!micStatus.isGranted) {
      if (!_showPermSnackbar) {
        Get
          ..closeAllSnackbars()
          ..snackbar(
            'Error',
            'You must provide permission to use the microphone',
            duration: const Duration(seconds: 5),
          );
      } else {
        openAppSettings();
      }
      _showPermSnackbar = !_showPermSnackbar;
      return;
    }
    await _speechToText.initialize(options: [SpeechToText.androidNoBluetooth]);
    if (!_speechToText.isAvailable) return;

    emit(state.copyWith(isMicListening: true));

    _cancelableOperationListeningMic =
        CancelableOperation.fromFuture(_listenSpeech());
    _cancelableOperationListeningMic!.then(
      (_) => _cancelableOperationListeningMic = null,
    );
  }

  Future<void> stopListening() async {
    _cancelableOperationListeningMic?.cancel();
    _cancelableOperationListeningMic = null;
    await _speechToText.stop();
    _gettedTextFromSpeech = '';
    emit(state.copyWith(isMicListening: false));
  }

  void onPrevTap() {
    ttsStop();
    if (state.isMicListening) stopListening();
  }

  void setDataFromHistoryModel(HistoryModel historyModel) async {
    emit(state.copyWith(
      fromLanguageModel: historyModel.fromLanguageModel,
      toLanguageModel: historyModel.toLanguageModel,
      translatedText: historyModel.translatedText,
    ));
    translateController.text = historyModel.textToBeTranslated;
  }
}
