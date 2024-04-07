// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) {
  return _HistoryModel.fromJson(json);
}

/// @nodoc
mixin _$HistoryModel {
  LanguageModel get fromLanguageModel => throw _privateConstructorUsedError;
  LanguageModel get toLanguageModel => throw _privateConstructorUsedError;
  String get textToBeTranslated => throw _privateConstructorUsedError;
  String get translatedText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryModelCopyWith<HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res, HistoryModel>;
  @useResult
  $Res call(
      {LanguageModel fromLanguageModel,
      LanguageModel toLanguageModel,
      String textToBeTranslated,
      String translatedText});

  $LanguageModelCopyWith<$Res> get fromLanguageModel;
  $LanguageModelCopyWith<$Res> get toLanguageModel;
}

/// @nodoc
class _$HistoryModelCopyWithImpl<$Res, $Val extends HistoryModel>
    implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromLanguageModel = null,
    Object? toLanguageModel = null,
    Object? textToBeTranslated = null,
    Object? translatedText = null,
  }) {
    return _then(_value.copyWith(
      fromLanguageModel: null == fromLanguageModel
          ? _value.fromLanguageModel
          : fromLanguageModel // ignore: cast_nullable_to_non_nullable
              as LanguageModel,
      toLanguageModel: null == toLanguageModel
          ? _value.toLanguageModel
          : toLanguageModel // ignore: cast_nullable_to_non_nullable
              as LanguageModel,
      textToBeTranslated: null == textToBeTranslated
          ? _value.textToBeTranslated
          : textToBeTranslated // ignore: cast_nullable_to_non_nullable
              as String,
      translatedText: null == translatedText
          ? _value.translatedText
          : translatedText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageModelCopyWith<$Res> get fromLanguageModel {
    return $LanguageModelCopyWith<$Res>(_value.fromLanguageModel, (value) {
      return _then(_value.copyWith(fromLanguageModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageModelCopyWith<$Res> get toLanguageModel {
    return $LanguageModelCopyWith<$Res>(_value.toLanguageModel, (value) {
      return _then(_value.copyWith(toLanguageModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryModelImplCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$$HistoryModelImplCopyWith(
          _$HistoryModelImpl value, $Res Function(_$HistoryModelImpl) then) =
      __$$HistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LanguageModel fromLanguageModel,
      LanguageModel toLanguageModel,
      String textToBeTranslated,
      String translatedText});

  @override
  $LanguageModelCopyWith<$Res> get fromLanguageModel;
  @override
  $LanguageModelCopyWith<$Res> get toLanguageModel;
}

/// @nodoc
class __$$HistoryModelImplCopyWithImpl<$Res>
    extends _$HistoryModelCopyWithImpl<$Res, _$HistoryModelImpl>
    implements _$$HistoryModelImplCopyWith<$Res> {
  __$$HistoryModelImplCopyWithImpl(
      _$HistoryModelImpl _value, $Res Function(_$HistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromLanguageModel = null,
    Object? toLanguageModel = null,
    Object? textToBeTranslated = null,
    Object? translatedText = null,
  }) {
    return _then(_$HistoryModelImpl(
      fromLanguageModel: null == fromLanguageModel
          ? _value.fromLanguageModel
          : fromLanguageModel // ignore: cast_nullable_to_non_nullable
              as LanguageModel,
      toLanguageModel: null == toLanguageModel
          ? _value.toLanguageModel
          : toLanguageModel // ignore: cast_nullable_to_non_nullable
              as LanguageModel,
      textToBeTranslated: null == textToBeTranslated
          ? _value.textToBeTranslated
          : textToBeTranslated // ignore: cast_nullable_to_non_nullable
              as String,
      translatedText: null == translatedText
          ? _value.translatedText
          : translatedText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryModelImpl implements _HistoryModel {
  const _$HistoryModelImpl(
      {required this.fromLanguageModel,
      required this.toLanguageModel,
      required this.textToBeTranslated,
      required this.translatedText});

  factory _$HistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryModelImplFromJson(json);

  @override
  final LanguageModel fromLanguageModel;
  @override
  final LanguageModel toLanguageModel;
  @override
  final String textToBeTranslated;
  @override
  final String translatedText;

  @override
  String toString() {
    return 'HistoryModel(fromLanguageModel: $fromLanguageModel, toLanguageModel: $toLanguageModel, textToBeTranslated: $textToBeTranslated, translatedText: $translatedText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryModelImpl &&
            (identical(other.fromLanguageModel, fromLanguageModel) ||
                other.fromLanguageModel == fromLanguageModel) &&
            (identical(other.toLanguageModel, toLanguageModel) ||
                other.toLanguageModel == toLanguageModel) &&
            (identical(other.textToBeTranslated, textToBeTranslated) ||
                other.textToBeTranslated == textToBeTranslated) &&
            (identical(other.translatedText, translatedText) ||
                other.translatedText == translatedText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fromLanguageModel,
      toLanguageModel, textToBeTranslated, translatedText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryModelImplCopyWith<_$HistoryModelImpl> get copyWith =>
      __$$HistoryModelImplCopyWithImpl<_$HistoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryModelImplToJson(
      this,
    );
  }
}

abstract class _HistoryModel implements HistoryModel {
  const factory _HistoryModel(
      {required final LanguageModel fromLanguageModel,
      required final LanguageModel toLanguageModel,
      required final String textToBeTranslated,
      required final String translatedText}) = _$HistoryModelImpl;

  factory _HistoryModel.fromJson(Map<String, dynamic> json) =
      _$HistoryModelImpl.fromJson;

  @override
  LanguageModel get fromLanguageModel;
  @override
  LanguageModel get toLanguageModel;
  @override
  String get textToBeTranslated;
  @override
  String get translatedText;
  @override
  @JsonKey(ignore: true)
  _$$HistoryModelImplCopyWith<_$HistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
