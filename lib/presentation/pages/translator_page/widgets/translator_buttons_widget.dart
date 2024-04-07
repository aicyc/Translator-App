import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../translator_cubit/translator_cubit.dart';

class TranslatorButtonsWidget extends StatelessWidget {
  const TranslatorButtonsWidget({
    super.key,
    required this.ft,
    required this.listenText,
    required this.isListen,
    required this.isMicListening,
    this.copy,
    this.clear,
    this.paste,
    this.share,
    this.micPressed,
    this.isTranslating = false,
  });
  final FT ft;
  final VoidCallback? micPressed, clear, copy, share, paste, listenText;
  final bool isListen, isMicListening, isTranslating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (ft.isFrom)
            IconButton(
              onPressed: micPressed,
              icon: FaIcon(isMicListening
                  ? FontAwesomeIcons.microphoneSlash
                  : FontAwesomeIcons.microphone),
            )
          else
            const SizedBox(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: isMicListening ? null : listenText,
                icon: FaIcon(
                  isListen
                      ? FontAwesomeIcons.volumeXmark
                      : FontAwesomeIcons.volumeHigh,
                ),
              ),
              if (ft.isFrom) ...[
                IconButton(
                  onPressed: paste,
                  icon: const FaIcon(FontAwesomeIcons.paste),
                ),
                IconButton(
                  onPressed: clear,
                  icon: const FaIcon(FontAwesomeIcons.xmark),
                ),
              ] else ...[
                IconButton(
                  onPressed: isTranslating ? null : share,
                  icon: const FaIcon(FontAwesomeIcons.share),
                ),
                IconButton(
                  onPressed: isTranslating ? null : copy,
                  icon: const FaIcon(FontAwesomeIcons.copy),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
