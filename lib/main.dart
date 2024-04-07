import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:translator_app/presentation/utils/themes_utils.dart';

import 'presentation/theme_cubit/theme_cubit.dart';
import 'presentation/pages/history_page/history_cubit/history_cubit.dart';
import 'presentation/pages/translate_camera_page/translator_camera_cubit/translator_camera_cubit.dart';
import 'presentation/pages/translator_page/translator_cubit/translator_cubit.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => HistoryCubit()),
        BlocProvider(create: (context) => TranslatorCubit()),
        BlocProvider(create: (context) => TranslatorCameraCubit()),
      ],
      child: const CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) => GetMaterialApp(
        title: 'Translator App',
        theme: ThemesUtils.light,
        darkTheme: ThemesUtils.dark,
        themeMode: state.themeMode,
        home: const SplashScreen(),
      ),
    );
  }
}
