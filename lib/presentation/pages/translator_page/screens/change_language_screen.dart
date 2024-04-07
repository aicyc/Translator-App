import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../models/language_model/language_model.dart';
import '../../../utils/utils_translator.dart';
import '../../widgets/custom_highlighted_text.dart';
import '../translator_cubit/translator_cubit.dart';
import '../widgets/language_list_tile.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({
    super.key,
    required this.ft,
    required this.selectedLanguage,
  });
  final FT ft;
  final LanguageModel selectedLanguage;

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Translate ${widget.ft.text}'),
        leading: UtilsTranslator.goBackButton,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 18,
                ),
                suffixIcon: suffixIcon,
              ),
              onChanged: (val) => setState(() {}),
            ),
          ),
          if (!languagesIsEmptyFromSearch) ...[
            const CustomHighlightedText('Languages'),
            Expanded(
              child: ListView.builder(
                itemCount: searchedLanguages?.length ?? languages.length,
                itemBuilder: (ctx, i) {
                  final language = searchedLanguages?[i] ?? languages[i];
                  return LanguageListTile(
                    countryName: language.countryName,
                    isSelected: language == widget.selectedLanguage,
                    onTap: () => Get.back(result: language),
                  );
                },
              ),
            ),
          ] else
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Language not found for your request',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<LanguageModel> get languages {
    if (widget.ft.isFrom) {
      return LanguageModel.languages
        ..removeWhere((e) => e == widget.selectedLanguage)
        ..insert(0, widget.selectedLanguage);
    }
    return LanguageModel.languagesWithoutAuto
      ..removeWhere((e) => e == widget.selectedLanguage)
      ..insert(0, widget.selectedLanguage);
  }

  List<LanguageModel>? get searchedLanguages {
    if (textController.text.isEmpty) return null;

    final searchedLanguages = languages
        .where((e) => e.countryName
            .toLowerCase()
            .trim()
            .contains(textController.text.toLowerCase().trim()))
        .toList();

    return searchedLanguages;
  }

  bool get languagesIsEmptyFromSearch => searchedLanguages?.isEmpty ?? false;

  Widget? get suffixIcon {
    if (textController.text.isEmpty) return null;
    return IconButton(
      icon: const FaIcon(FontAwesomeIcons.xmark),
      onPressed: () => setState(() => textController.clear()),
    );
  }
}
