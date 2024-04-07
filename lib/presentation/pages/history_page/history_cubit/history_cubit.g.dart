// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Initial _$$_InitialFromJson(Map<String, dynamic> json) => _$_Initial(
      historyModels: (json['historyModels'] as List<dynamic>?)
              ?.map((e) => HistoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_InitialToJson(_$_Initial instance) =>
    <String, dynamic>{
      'historyModels': instance.historyModels,
    };
