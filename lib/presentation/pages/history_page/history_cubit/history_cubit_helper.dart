part of 'history_cubit.dart';

abstract class HistoryCubitHelper extends Cubit<HistoryState> {
  HistoryCubitHelper(super.initialState);

  String get _dataHistory => 'DATA_HISTORY';

  SharedPreferences get _storage => PreferenceUtils.instance;

  Future<bool> _saveStateIntoStorage() async {
    final data = state.toJson();
    final dataJson = jsonEncode(data);
    return _storage.setString(_dataHistory, dataJson);
  }
}
