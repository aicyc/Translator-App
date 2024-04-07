import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingRecognizedScreen extends StatefulWidget {
  const LoadingRecognizedScreen({
    super.key,
    required this.onImportImage,
  });
  final AsyncValueGetter<bool> onImportImage;

  @override
  State<LoadingRecognizedScreen> createState() =>
      _LoadingRecognizedScreenState();
}

class _LoadingRecognizedScreenState extends State<LoadingRecognizedScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final res = await widget.onImportImage();
    if (res) return;
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
