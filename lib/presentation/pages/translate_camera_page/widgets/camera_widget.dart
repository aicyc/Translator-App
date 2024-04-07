import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({super.key, required this.cameraController});
  final CameraController cameraController;

  @override
  Widget build(BuildContext context) {
    if (cameraIsInitialized) return CameraPreview(cameraController);
    return const Center(child: CircularProgressIndicator());
  }

  bool get cameraIsInitialized => cameraController.value.isInitialized;
}
