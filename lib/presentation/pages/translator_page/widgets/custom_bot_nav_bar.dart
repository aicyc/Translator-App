import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../translate_camera_page/translator_camera_page.dart';
import 'custom_icon_button.dart';

class CustomBotNavBar extends StatelessWidget {
  const CustomBotNavBar({
    super.key,
    required this.gettedTextFromScreen,
    required this.onPrevTap,
  });
  final ValueSetter<String> gettedTextFromScreen;
  final VoidCallback onPrevTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CutomIconButton(
                onPressed: () async {
                  onPrevTap();
                  final res = await Get.to(
                    () => const TranslatorCameraPage(activeIndex: 0),
                  );
                  if (res != null) gettedTextFromScreen(res);
                },
                icon: const FaIcon(FontAwesomeIcons.camera),
                label: 'Camera',
              ),
              CutomIconButton(
                onPressed: () async {
                  onPrevTap();
                  final res = await Get.to(
                    () => const TranslatorCameraPage(activeIndex: 1),
                  );
                  if (res != null) gettedTextFromScreen(res);
                },
                icon: const FaIcon(FontAwesomeIcons.objectGroup),
                label: 'Object',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
