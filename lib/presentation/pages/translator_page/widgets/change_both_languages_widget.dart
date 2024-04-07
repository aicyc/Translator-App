import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../translator_cubit/translator_cubit.dart';
import 'custom_change_country_button.dart';

class ChangeBothLanguagesWidget extends StatefulWidget {
  const ChangeBothLanguagesWidget({
    super.key,
    required this.onSwap,
    this.isActiveButton = true,
    this.swapColor,
  });
  final VoidCallback onSwap;
  final bool isActiveButton;
  final Color? swapColor;

  @override
  State<ChangeBothLanguagesWidget> createState() =>
      _ChangeBothLanguagesWidgetState();
}

class _ChangeBothLanguagesWidgetState extends State<ChangeBothLanguagesWidget> {
  late final translatorCubit = BlocProvider.of<TranslatorCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<TranslatorCubit, TranslatorState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomChangeCountryButton(
                isActiveButton: widget.isActiveButton,
                languageModel: state.fromLanguageModel,
                ft: FT.from,
                onPrevTap: translatorCubit.onPrevTap,
                onTap: (languageModel) {
                  if (languageModel == null) return;
                  translatorCubit.changeLanguage(
                    ft: FT.from,
                    newLanguage: languageModel,
                  );
                },
              ),
              IconButton(
                onPressed: widget.isActiveButton ? widget.onSwap : null,
                icon: FaIcon(
                  FontAwesomeIcons.rightLeft,
                  color: widget.swapColor,
                ),
              ),
              CustomChangeCountryButton(
                isActiveButton: widget.isActiveButton,
                languageModel: state.toLanguageModel,
                onPrevTap: translatorCubit.onPrevTap,
                ft: FT.to,
                onTap: (languageModel) {
                  if (languageModel == null) return;
                  translatorCubit.changeLanguage(
                    ft: FT.to,
                    newLanguage: languageModel,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
