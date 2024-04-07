import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'presentation/theme_cubit/theme_cubit.dart';
import 'presentation/pages/history_page/history_cubit/history_cubit.dart';
import 'presentation/pages/translator_page/translator_page.dart';
import 'presentation/utils/app_package_info.dart';
import 'presentation/utils/directory_utils.dart';
import 'presentation/utils/preference_utils.dart';
import 'presentation/utils/rate_app_utils.dart';
import 'presentation/utils/tts_languages_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final themeCubit = BlocProvider.of<ThemeCubit>(context),
      historyCubit = BlocProvider.of<HistoryCubit>(context);
  @override
  void initState() {
    super.initState();
    initApp();
  }

  bool isClicked = false;

  void initApp() async {
    await PreferenceUtils.init();
    historyCubit.init();
    themeCubit.initApp();
    
    await AppPackageInfo.init();
    await DirectoryUtils.init();
    await TtsLanguagesUtils.init();
    await RateAppUtils.init();

    Get.off(() => const TranslatorPage());
  }

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: CircularProgressIndicator()));
}
