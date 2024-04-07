part of 'translator_camera_cubit.dart';

@freezed
class TranslatorCameraState with _$TranslatorCameraState {
  const factory TranslatorCameraState.loading() = _Loading;
  const factory TranslatorCameraState.initial({
    required CameraController cameraController,
    @Default(true) bool isActiveButton,
    @Default([]) List<DetectedObject> detectedObjects,
    @Default(Size.zero) Size sizeCamera,
  }) = _Initial;
  const factory TranslatorCameraState.noPermission() = _NoPermission;
  const factory TranslatorCameraState.noSupportedCamera() = _NoSupportedCamera;
}
