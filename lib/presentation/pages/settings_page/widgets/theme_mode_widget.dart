import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme_cubit/theme_cubit.dart';

class ThemeModeWidget extends StatefulWidget {
  const ThemeModeWidget({super.key});

  @override
  State<ThemeModeWidget> createState() => _ThemeModeWidgetState();
}

class _ThemeModeWidgetState extends State<ThemeModeWidget> {
  late final themeCubit = BlocProvider.of<ThemeCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final themeMode = state.themeMode;
        return ListTile(
          onTap: () => themeCubit.changeThemeMode(context: context),
          title: const Text('Theme Mode'),
          subtitle: Text('Theme ${themeMode.name}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ToggleButtons(
                borderRadius: BorderRadius.circular(32),
                isSelected: [
                  themeMode.isLight,
                  themeMode.isSystem,
                  themeMode.isDark,
                ],
                children: const [
                  FaIcon(FontAwesomeIcons.sun),
                  FaIcon(FontAwesomeIcons.phone),
                  FaIcon(FontAwesomeIcons.moon),
                ],
                onPressed: (val) {
                  final themeMode = getTheme(val);
                  themeCubit.changeThemeMode(themeMode: themeMode);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  ThemeMode getTheme(int val) {
    switch (val) {
      case 0:
        return ThemeMode.light;
      case 1:
        return ThemeMode.system;
      default:
        return ThemeMode.dark;
    }
  }
}
