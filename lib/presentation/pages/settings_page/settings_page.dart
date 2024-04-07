import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/app_package_info.dart';
import '../../utils/rate_app_utils.dart';
import '../../utils/utils_translator.dart';
import '../history_page/history_page.dart';
import '../widgets/custom_highlighted_text.dart';
import 'widgets/theme_mode_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        leading: UtilsTranslator.goBackButton,
      ),
      body: Column(
        children: [
          const CustomHighlightedText('Preferences'),
          ListTile(
            title: const Text('History'),
            onTap: () => Get.to(() => const HistoryPage()),
            trailing: const FaIcon(FontAwesomeIcons.angleRight),
          ),
          const CustomHighlightedText('General'),
          const ThemeModeWidget(),
          ListTile(
            title: const Text('Share'),
            onTap: () => Share.shareUri(Uri.parse(
              'https://play.google.com/store/apps/details?id=${AppPackageInfo.packageName}',
            )),
            trailing: const FaIcon(FontAwesomeIcons.angleRight),
          ),
          const ListTile(
            title: Text('Rate us'),
            onTap: RateAppUtils.showRateDialog,
            trailing: FaIcon(FontAwesomeIcons.angleRight),
          ),
        ],
      ),
    );
  }
}
