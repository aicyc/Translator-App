import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../models/language_model/language_model.dart';
import '../translator_cubit/translator_cubit.dart';
import '../screens/change_language_screen.dart';
import 'flag_widget.dart';

class CustomChangeCountryButton extends StatelessWidget {
  const CustomChangeCountryButton({
    super.key,
    required this.languageModel,
    required this.onTap,
    required this.ft,
    required this.onPrevTap,
    this.isActiveButton = true,
    this.width,
  });
  final bool isActiveButton;
  final LanguageModel languageModel;
  final FT ft;
  final ValueSetter<LanguageModel?> onTap;
  final VoidCallback onPrevTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    return Opacity(
      opacity: isActiveButton ? 1 : .4,
      child: Container(
        height: 64,
        width: width ?? sizeDevice.width * .4,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: borderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: isActiveButton
                ? () async {
                    onPrevTap();
                    final selected = await Get.to(
                      () => ChangeLanguageScreen(
                        ft: ft,
                        selectedLanguage: languageModel,
                      ),
                    );
                    onTap(selected);
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FlagWidget(
                    isoCode: languageModel.isoCode,
                    height: 24,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(languageModel.countryName),
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.circleChevronDown,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius get borderRadius => BorderRadius.circular(12.0);
}
