import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:uuid/uuid.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../../utils/directory_utils.dart';
import '../screens/recognized_text_screen.dart';

part 'translator_camera_state.dart';
part 'translator_camera_cubit_helper.dart';
part 'translator_camera_cubit.freezed.dart';

class TranslatorCameraCubit extends TranslatorCameraCubitHelper {
  TranslatorCameraCubit() : super(const TranslatorCameraState.loading());

  int activeIndex = -1;


  bool get isInitialState => state is _Initial;
  bool get isCameraInit => _initialState.cameraController.value.isInitialized;

  Future<void> initTranslator(int activeIndex) async {
    this.activeIndex = activeIndex;
    final permission = await _getPermissionCamera();
    if (!permission.isGranted) {
      emit(const TranslatorCameraState.noPermission());
      return;
    }
    final cameras = await availableCameras();
    final camera = cameras.firstWhereOrNull(
      (e) => e.lensDirection == CameraLensDirection.back,
    );
    if (camera == null) {
      emit(const TranslatorCameraState.noSupportedCamera());
      return;
    }

    _objectDetector = await _initializeObjectDetector();
    await _initializeCameraController(camera);
    if (activeIndex == 1) addStreamCamera();
  }

  Future<bool> importImage() async {
    final xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile == null) return false;

    final file = await _getFileFromXFile(xFile);

    final inputImage = InputImage.fromFile(file);
    final recognized = await _getRecognizedTextFromImage(
      isoCode: 'auto',
      inputImage: inputImage,
    );
    if (recognized.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Failed to recognize text',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      if (isInitialState) emit(_initialState.copyWith(isActiveButton: true));
      return false;
    }

    Get.off(() => RecognizedTextScreen(
          fileImage: file,
          recognizedText: recognized.text,
        ));
    return true;
  }

  String getTitleFromIndex(int index) {
    if (_isLoadingState) return 'Loading...';
    if (_isNoPermissionState) return 'No Permission';
    if (_isNoSupportedCameraState) return 'No supported camera';
    switch (index) {
      case 0:
        return 'Camera';
      case 1:
        return 'Object';
      default:
        return '';
    }
  }

  void takePicture(String isoCode) async {
    emit(_initialState.copyWith(isActiveButton: false));
    final picture = await _initialState.cameraController.takePicture();
    final file = await _getFileFromXFile(picture);

    final inputImage = InputImage.fromFile(file);
    final recognized = await _getRecognizedTextFromImage(
      isoCode: isoCode,
      inputImage: inputImage,
    );
    if (recognized.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Failed to recognize text',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      if (isInitialState) emit(_initialState.copyWith(isActiveButton: true));
      return;
    }
    if (isInitialState) emit(_initialState.copyWith(isActiveButton: true));
    Get.to(() => RecognizedTextScreen(
          fileImage: file,
          recognizedText: recognized.text,
        ));
  }

  void addStreamCamera() async {
    _hasStream = true;
    activeIndex = 1;
    if (!isInitialState) return;
    _initialState.cameraController.startImageStream((image) async {
      if (!isInitialState) return;
      final inputImage = _inputImageFromCameraImage(image);
      if (inputImage == null) {
        emit(_initialState.copyWith(detectedObjects: []));
        return;
      }
      _objectDetector ??= await _initializeObjectDetector();
      final detectedObjects = await _objectDetector!.processImage(inputImage);
      emit(_initialState.copyWith(
        detectedObjects: detectedObjects,
        sizeCamera: inputImage.metadata!.size,
      ));
    });
  }

  Future<void> removeStreamCamera() async {
    _hasStream = false;
    activeIndex = 0;
    await _initialState.cameraController.stopImageStream();
  }

  Future<void> dispose() async {
    if (isInitialState) {
      if (_hasStream) await removeStreamCamera();
      await _initialState.cameraController.dispose();
    }
    await _objectDetector?.close();
    _objectDetector = null;
    emit(const TranslatorCameraState.loading());
  }
}
