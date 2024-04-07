import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/preference_utils.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';
part 'theme_cubit.g.dart';
part 'theme_cubit_helper.dart';

extension ExtThemeMode on ThemeMode {
  bool get isLight => this == ThemeMode.light;
  bool get isDark => this == ThemeMode.dark;
  bool get isSystem => this == ThemeMode.system;

  Brightness get brightness {
    switch (this) {
      case ThemeMode.light:
        return Brightness.light;
      default:
        return Brightness.dark;
    }
  }
}

class ThemeCubit extends ThemeCubitHelper {
  ThemeCubit() : super(const ThemeState.initial());

  void initApp() {
    final jsonState = _storage.getString(_keyStorage);
    if (jsonState == null) return;

    emit(ThemeState.fromJson(jsonDecode(jsonState)));
  }

  void changeThemeMode({
    ThemeMode? themeMode,
    BuildContext? context,
  }) {
    if (themeMode == null) {
      if (context == null) return;
      var brightness = MediaQuery.of(context).platformBrightness;
      if (!state.themeMode.isSystem) brightness = state.themeMode.brightness;
      themeMode = _getThemeFrom(brightness);
    }

    emit(state.copyWith(themeMode: themeMode));
    _saveData();
  }
}
