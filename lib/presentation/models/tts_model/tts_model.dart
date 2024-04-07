import 'package:freezed_annotation/freezed_annotation.dart';

import '../../pages/translator_page/translator_cubit/translator_cubit.dart';

part 'tts_model.freezed.dart';

enum TtsState {
  playing,
  stopped;

  bool get isListen => this == playing;
}

@freezed
class TtsModel with _$TtsModel {
  const factory TtsModel({
    @Default(TtsState.stopped) TtsState ttsState,
    required FT ft,
  }) = _TtsModel;
}