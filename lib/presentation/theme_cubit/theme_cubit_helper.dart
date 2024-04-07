part of 'theme_cubit.dart';

abstract class ThemeCubitHelper extends Cubit<ThemeState> {
  ThemeCubitHelper(super.initialState);

  final _keyStorage = 'THEME_DATA';

  ThemeMode _getThemeFrom(Brightness brightness) {
    if (brightness == Brightness.light) return ThemeMode.dark;
    return ThemeMode.light;
  }

  SharedPreferences get _storage => PreferenceUtils.instance;

  Future<bool> _saveData() {
    final jsonState = jsonEncode(state.toJson());
    return _storage.setString(_keyStorage, jsonState);
  }
}
