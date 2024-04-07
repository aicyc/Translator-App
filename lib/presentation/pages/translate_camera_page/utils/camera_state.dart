import 'package:flutter/material.dart';

import '../translator_camera_cubit/translator_camera_cubit.dart';

extension _LifecycleState on AppLifecycleState {
  bool get isResumed => this == AppLifecycleState.resumed;
  bool get isInactive => this == AppLifecycleState.inactive;
}

class CameraState extends WidgetsBindingObserver {
  CameraState(this.translatorCameraCubit);

  final TranslatorCameraCubit translatorCameraCubit;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (!translatorCameraCubit.isInitialState && state.isResumed) {
      translatorCameraCubit.initTranslator(translatorCameraCubit.activeIndex);
      return;
    }
    if (!translatorCameraCubit.isCameraInit) return;
    if (state.isResumed) {
      translatorCameraCubit.initTranslator(translatorCameraCubit.activeIndex);
      return;
    }
    if (state.isInactive) {
      translatorCameraCubit.dispose();
      return;
    }
  }
}
