import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/history_model/history_model.dart';
import '../../../utils/preference_utils.dart';

part 'history_state.dart';
part 'history_cubit_helper.dart';
part 'history_cubit.freezed.dart';
part 'history_cubit.g.dart';

class HistoryCubit extends HistoryCubitHelper {
  HistoryCubit() : super(const HistoryState.initial());

  void init() async {
    final dataJson = _storage.getString(_dataHistory);
    if (dataJson == null) return;

    final data = jsonDecode(dataJson);
    emit(HistoryState.fromJson(data));
  }

  Future<bool> addAndSaveIntoStorage(HistoryModel historyModel) async {
    final historyModels = state.historyModels.toList();
    if (historyModels.isNotEmpty && historyModels.first == historyModel) {
      return true;
    }

    historyModels.insert(0, historyModel);
    emit(state.copyWith(historyModels: historyModels));
    return _saveStateIntoStorage();
  }

  Future<bool> deleteHistory(HistoryModel historyModel) async {
    final historyModels = state.historyModels.toList();
    historyModels.removeWhere((e) => e == historyModel);
    emit(state.copyWith(historyModels: historyModels));
    return _saveStateIntoStorage();
  }
}
