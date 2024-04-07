import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_highlighted_text.dart';

class RecognizedTextScreen extends StatelessWidget {
  const RecognizedTextScreen({
    super.key,
    required this.fileImage,
    required this.recognizedText,
  });
  final File fileImage;
  final String recognizedText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Recognized Text'),
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(
              fileImage,
              height: Get.height * .65,
            ),
            const CustomHighlightedText('Recognized Text:'),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(recognizedText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.back(result: recognizedText);
                },
                style: ElevatedButton.styleFrom(fixedSize: Size(Get.width, 48)),
                child: const Text('Confirm'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0)
                  .add(const EdgeInsets.only(bottom: 16.0)),
              child: ElevatedButton(
                onPressed: Get.back,
                style: ElevatedButton.styleFrom(fixedSize: Size(Get.width, 48)),
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
