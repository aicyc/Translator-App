import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/history_model/history_model.dart';
import '../settings_page/settings_page.dart';
import 'translator_cubit/translator_cubit.dart';
import 'widgets/change_both_languages_widget.dart';
import 'widgets/custom_bot_nav_bar.dart';
import 'widgets/translate_input_field.dart';
import 'widgets/translator_buttons_widget.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({super.key});

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  late final translatorCubit = BlocProvider.of<TranslatorCubit>(context);
  final focusNode = FocusNode();

  TextEditingController get translateController =>
      translatorCubit.translateController;

  @override
  void initState() {
    super.initState();
    translatorCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslatorCubit, TranslatorState>(
      builder: (context, state) {
        final fromCountryName = state.fromLanguageModel.countryName;
        final recognized = getRecognized(
          countryName: fromCountryName,
          recognizedCountryName: state.recognizedCountryName,
        );
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Translator'),
            actions: [
              IconButton(
                onPressed: () async {
                  translatorCubit.onPrevTap();
                  final historyModel = await Get.to<HistoryModel>(
                    () => const SettingsPage(),
                  );
                  if (historyModel == null) return;
                  translatorCubit.setDataFromHistoryModel(historyModel);
                },
                icon: const FaIcon(FontAwesomeIcons.gear),
              ),
            ],
          ),
          body: Column(
            children: [
              ChangeBothLanguagesWidget(
                onSwap: translatorCubit.swapLanguages,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: focusNode.requestFocus,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: inputDecorationTheme.hoverColor,
                          border: Border.all(color: color),
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.only(top: 12.0, left: 12.0),
                              child: Text(
                                '$fromCountryName $recognized',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            TranslateInputField(
                              focusNode: focusNode,
                              controller: translateController,
                              onChanged: (_) => translatorCubit.translate(),
                            ),
                            TranslatorButtonsWidget(
                              ft: FT.from,
                              isMicListening: state.isMicListening,
                              isListen: state.fromTtsModel.ttsState.isListen,
                              micPressed: () {
                                if (state.isMicListening) {
                                  translatorCubit.stopListening();
                                  return;
                                }
                                translatorCubit.startListening();
                              },
                              paste: translatorCubit.paste,
                              clear: () {
                                translateController.clear();
                                translatorCubit.clearTranslatedText();
                              },
                              listenText: () {
                                if (state.fromTtsModel.ttsState.isListen) {
                                  translatorCubit.ttsStop();
                                  return;
                                }
                                translatorCubit.ttsListen(
                                  FT.from,
                                  translateController.text,
                                );
                              },
                            ),
                            if (translateController.text.isNotEmpty) ...[
                              Divider(
                                indent: sizeDevice.width * .35,
                                endIndent: sizeDevice.width * .35,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(
                                  top: 12.0,
                                  left: 12.0,
                                ),
                                child: Text(
                                  state.toLanguageModel.countryName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  TranslateInputField(
                                    readOnly: true,
                                    onTap: focusNode.requestFocus,
                                    controller: TextEditingController(
                                      text: state.translatedText,
                                    ),
                                  ),
                                  if (state.isTranslating)
                                    const Positioned.fill(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                ],
                              ),
                              TranslatorButtonsWidget(
                                ft: FT.to,
                                listenText: () {
                                  if (state.toTtsModel.ttsState.isListen) {
                                    translatorCubit.ttsStop();
                                    return;
                                  }
                                  translatorCubit.ttsListen(
                                    FT.to,
                                    state.translatedText,
                                  );
                                },
                                isMicListening:
                                    state.isTranslating || state.isMicListening,
                                isListen: state.toTtsModel.ttsState.isListen,
                                isTranslating: state.isTranslating,
                                copy: translatorCubit.copy,
                                share: translatorCubit.share,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomBotNavBar(
            onPrevTap: translatorCubit.ttsStop,
            gettedTextFromScreen: (value) async {
              translateController.text = value;
              translatorCubit.translate();
            },
          ),
        );
      },
    );
  }

  String getRecognized({
    required String countryName,
    required String recognizedCountryName,
  }) {
    if (countryName != 'Auto' || recognizedCountryName.isEmpty) return '';

    return '($recognizedCountryName)';
  }

  Color get color {
    var border = inputDecorationTheme.disabledBorder;
    if (focusNode.hasFocus) {
      border = inputDecorationTheme.focusedBorder;
    }
    return border!.borderSide.color;
  }

  Size get sizeDevice => MediaQuery.of(context).size;

  ThemeData get themeData => Theme.of(context);
  InputDecorationTheme get inputDecorationTheme =>
      themeData.inputDecorationTheme;
  ColorScheme get colorScheme => themeData.colorScheme;
}
