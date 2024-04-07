// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translator_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TranslatorState {
  LanguageModel get fromLanguageModel => throw _privateConstructorUsedError;
  LanguageModel get toLanguageModel => throw _privateConstructorUsedError;
  String get translatedText => throw _privateConstructorUsedError;
  String get recognizedCountryName => throw _privateConstructorUsedError;
  String get recognizedIsoCode => throw _privateConstructorUsedError;
  bool get isTranslating => throw _privateConstructorUsedError;
  TtsModel get fromTtsModel => throw _privateConstructorUsedError;
  TtsModel get toTtsModel => throw _privateConstructorUsedError;
  FT get ftTtsModel => throw _privateConstructorUsedError;
  bool get isMicListening => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            LanguageModel fromLanguageModel,
            LanguageModel toLanguageModel,
            String translatedText,
            String recognizedCountryName,
            String recognizedIsoCode,
            bool isTranslating,
            TtsModel fromTtsModel,
            TtsModel toTtsModel,
            FT ftTtsModel,
            bool isMicListening)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            LanguageModel fromLanguageModel,
            LanguageModel toLanguageModel,
            String translatedText,
            String recognizedCountryName,
            String recognizedIsoCode,
            bool isTranslating,
            TtsModel fromTtsModel,
            TtsModel toTtsModel,
            FT ftTtsModel,
            bool isMicListening)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            LanguageModel fromLanguageModel,
            LanguageModel toLanguageModel,
            String translatedText,
            String recognizedCountryName,
            String recognizedIsoCode,
            bool isTranslating,
            TtsModel fromTtsModel,
            TtsModel toTtsModel,
            FT ftTtsModel,
            bool isMicListening)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TranslatorStateCopyWith<TranslatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslatorStateCopyWith<$Res> {
  factory $TranslatorStateCopyWith(
          TranslatorState value, $Res Function(TranslatorState) then) =
      _$TranslatorStateCopyWithImpl<$Res, TranslatorState>;
  @useResult
  $Res call(
      {LanguageModel fromLanguageModel,
      LanguageModel toLanguageModel,
      String translatedText,
      String recognizedCountryName,
      String recognizedIsoCode,
      bool isTranslating,
      TtsModel fromTtsModel,
      TtsModel toTtsModel,
      FT ftTtsModel,
      bool isMicListening});

  $LanguageModelCopyWith<$Res> get fromLanguageModel;
  $LanguageModelCopyWith<$Res> get toLanguageModel;
  $TtsModelCopyWith<$Res> get fromTtsModel;
  $TtsModelCopyWith<$Res> get toTtsModel;
}

/// @nodoc
class _$TranslatorStateCopyWithImpl<$Res, $Val extends TranslatorState>
    implements $TranslatorStateCopyWith<$Res> {
  _$TranslatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromLanguageModel = null,
    Object? toLanguageModel = null,
    Object? translatedText = null,
    Object? recognizedCountryName = null,
    Object? recognizedIsoCode = null,
    Object? isTranslating = null,
    Object? fromTtsModel = null,
    Object? toTtsModel = null,
    Object? ftTtsModel = null,
    Object? isMicListening = null,
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
      translatedText: null == translatedText
          ? _value.translatedText
          : translatedText // ignore: cast_nullable_to_non_nullable
              as String,
      recognizedCountryName: null == recognizedCountryName
          ? _value.recognizedCountryName
          : recognizedCountryName // ignore: cast_nullable_to_non_nullable
              as String,
      recognizedIsoCode: null == recognizedIsoCode
          ? _value.recognizedIsoCode
          : recognizedIsoCode // ignore: cast_nullable_to_non_nullable
              as String,
      isTranslating: null == isTranslating
          ? _value.isTranslating
          : isTranslating // ignore: cast_nullable_to_non_nullable
              as bool,
      fromTtsModel: null == fromTtsModel
          ? _value.fromTtsModel
          : fromTtsModel // ignore: cast_nullable_to_non_nullable
              as TtsModel,
      toTtsModel: null == toTtsModel
          ? _value.toTtsModel
          : toTtsModel // ignore: cast_nullable_to_non_nullable
              as TtsModel,
      ftTtsModel: null == ftTtsModel
          ? _value.ftTtsModel
          : ftTtsModel // ignore: cast_nullable_to_non_nullable
              as FT,
      isMicListening: null == isMicListening
          ? _value.isMicListening
          : isMicListening // ignore: cast_nullable_to_non_nullable
              as bool,
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

  @override
  @pragma('vm:prefer-inline')
  $TtsModelCopyWith<$Res> get fromTtsModel {
    return $TtsModelCopyWith<$Res>(_value.fromTtsModel, (value) {
      return _then(_value.copyWith(fromTtsModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TtsModelCopyWith<$Res> get toTtsModel {
    return $TtsModelCopyWith<$Res>(_value.toTtsModel, (value) {
      return _then(_value.copyWith(toTtsModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $TranslatorStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LanguageModel fromLanguageModel,
      LanguageModel toLanguageModel,
      String translatedText,
      String recognizedCountryName,
      String recognizedIsoCode,
      bool isTranslating,
      TtsModel fromTtsModel,
      TtsModel toTtsModel,
      FT ftTtsModel,
      bool isMicListening});

  @override
  $LanguageModelCopyWith<$Res> get fromLanguageModel;
  @override
  $LanguageModelCopyWith<$Res> get toLanguageModel;
  @override
  $TtsModelCopyWith<$Res> get fromTtsModel;
  @override
  $TtsModelCopyWith<$Res> get toTtsModel;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TranslatorStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromLanguageModel = null,
    Object? toLanguageModel = null,
    Object? translatedText = null,
    Object? recognizedCountryName = null,
    Object? recognizedIsoCode = null,
    Object? isTranslating = null,
    Object? fromTtsModel = null,
    Object? toTtsModel = null,
    Object? ftTtsModel = null,
    Object? isMicListening = null,
  }) {
    return _then(_$_Initial(
      fromLanguageModel: null == fromLanguageModel
          ? _value.fromLanguageModel
          : fromLanguageModel // ignore: cast_nullable_to_non_nullable
              as LanguageModel,
      toLanguageModel: null == toLanguageModel
          ? _value.toLanguageModel
          : toLanguageModel // ignore: cast_nullable_to_non_nullable
              as LanguageModel,
      translatedText: null == translatedText
          ? _value.translatedText
          : translatedText // ignore: cast_nullable_to_non_nullable
              as String,
      recognizedCountryName: null == recognizedCountryName
          ? _value.recognizedCountryName
          : recognizedCountryName // ignore: cast_nullable_to_non_nullable
              as String,
      recognizedIsoCode: null == recognizedIsoCode
          ? _value.recognizedIsoCode
          : recognizedIsoCode // ignore: cast_nullable_to_non_nullable
              as String,
      isTranslating: null == isTranslating
          ? _value.isTranslating
          : isTranslating // ignore: cast_nullable_to_non_nullable
              as bool,
      fromTtsModel: null == fromTtsModel
          ? _value.fromTtsModel
          : fromTtsModel // ignore: cast_nullable_to_non_nullable
              as TtsModel,
      toTtsModel: null == toTtsModel
          ? _value.toTtsModel
          : toTtsModel // ignore: cast_nullable_to_non_nullable
              as TtsModel,
      ftTtsModel: null == ftTtsModel
          ? _value.ftTtsModel
          : ftTtsModel // ignore: cast_nullable_to_non_nullable
              as FT,
      isMicListening: null == isMicListening
          ? _value.isMicListening
          : isMicListening // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.fromLanguageModel = LanguageModel.defaultFromValue,
      this.toLanguageModel = LanguageModel.defaultToValue,
      this.translatedText = '',
      this.recognizedCountryName = '',
      this.recognizedIsoCode = '',
      this.isTranslating = false,
      this.fromTtsModel = const TtsModel(ft: FT.from),
      this.toTtsModel = const TtsModel(ft: FT.to),
      this.ftTtsModel = FT.from,
      this.isMicListening = false});

  @override
  @JsonKey()
  final LanguageModel fromLanguageModel;
  @override
  @JsonKey()
  final LanguageModel toLanguageModel;
  @override
  @JsonKey()
  final String translatedText;
  @override
  @JsonKey()
  final String recognizedCountryName;
  @override
  @JsonKey()
  final String recognizedIsoCode;
  @override
  @JsonKey()
  final bool isTranslating;
  @override
  @JsonKey()
  final TtsModel fromTtsModel;
  @override
  @JsonKey()
  final TtsModel toTtsModel;
  @override
  @JsonKey()
  final FT ftTtsModel;
  @override
  @JsonKey()
  final bool isMicListening;

  @override
  String toString() {
    return 'TranslatorState.initial(fromLanguageModel: $fromLanguageModel, toLanguageModel: $toLanguageModel, translatedText: $translatedText, recognizedCountryName: $recognizedCountryName, recognizedIsoCode: $recognizedIsoCode, isTranslating: $isTranslating, fromTtsModel: $fromTtsModel, toTtsModel: $toTtsModel, ftTtsModel: $ftTtsModel, isMicListening: $isMicListening)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.fromLanguageModel, fromLanguageModel) ||
                other.fromLanguageModel == fromLanguageModel) &&
            (identical(other.toLanguageModel, toLanguageModel) ||
                other.toLanguageModel == toLanguageModel) &&
            (identical(other.translatedText, translatedText) ||
                other.translatedText == translatedText) &&
            (identical(other.recognizedCountryName, recognizedCountryName) ||
                other.recognizedCountryName == recognizedCountryName) &&
            (identical(other.recognizedIsoCode, recognizedIsoCode) ||
                other.recognizedIsoCode == recognizedIsoCode) &&
            (identical(other.isTranslating, isTranslating) ||
                other.isTranslating == isTranslating) &&
            (identical(other.fromTtsModel, fromTtsModel) ||
                other.fromTtsModel == fromTtsModel) &&
            (identical(other.toTtsModel, toTtsModel) ||
                other.toTtsModel == toTtsModel) &&
            (identical(other.ftTtsModel, ftTtsModel) ||
                other.ftTtsModel == ftTtsModel) &&
            (identical(other.isMicListening, isMicListening) ||
                other.isMicListening == isMicListening));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fromLanguageModel,
      toLanguageModel,
      translatedText,
      recognizedCountryName,
      recognizedIsoCode,
      isTranslating,
      fromTtsModel,
      toTtsModel,
      ftTtsModel,
      isMicListening);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            LanguageModel fromLanguageModel,
            LanguageModel toLanguageModel,
            String translatedText,
            String recognizedCountryName,
            String recognizedIsoCode,
            bool isTranslating,
            TtsModel fromTtsModel,
            TtsModel toTtsModel,
            FT ftTtsModel,
            bool isMicListening)
        initial,
  }) {
    return initial(
        fromLanguageModel,
        toLanguageModel,
        translatedText,
        recognizedCountryName,
        recognizedIsoCode,
        isTranslating,
        fromTtsModel,
        toTtsModel,
        ftTtsModel,
        isMicListening);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            LanguageModel fromLanguageModel,
            LanguageModel toLanguageModel,
            String translatedText,
            String recognizedCountryName,
            String recognizedIsoCode,
            bool isTranslating,
            TtsModel fromTtsModel,
            TtsModel toTtsModel,
            FT ftTtsModel,
            bool isMicListening)?
        initial,
  }) {
    return initial?.call(
        fromLanguageModel,
        toLanguageModel,
        translatedText,
        recognizedCountryName,
        recognizedIsoCode,
        isTranslating,
        fromTtsModel,
        toTtsModel,
        ftTtsModel,
        isMicListening);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            LanguageModel fromLanguageModel,
            LanguageModel toLanguageModel,
            String translatedText,
            String recognizedCountryName,
            String recognizedIsoCode,
            bool isTranslating,
            TtsModel fromTtsModel,
            TtsModel toTtsModel,
            FT ftTtsModel,
            bool isMicListening)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          fromLanguageModel,
          toLanguageModel,
          translatedText,
          recognizedCountryName,
          recognizedIsoCode,
          isTranslating,
          fromTtsModel,
          toTtsModel,
          ftTtsModel,
          isMicListening);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TranslatorState {
  const factory _Initial(
      {final LanguageModel fromLanguageModel,
      final LanguageModel toLanguageModel,
      final String translatedText,
      final String recognizedCountryName,
      final String recognizedIsoCode,
      final bool isTranslating,
      final TtsModel fromTtsModel,
      final TtsModel toTtsModel,
      final FT ftTtsModel,
      final bool isMicListening}) = _$_Initial;

  @override
  LanguageModel get fromLanguageModel;
  @override
  LanguageModel get toLanguageModel;
  @override
  String get translatedText;
  @override
  String get recognizedCountryName;
  @override
  String get recognizedIsoCode;
  @override
  bool get isTranslating;
  @override
  TtsModel get fromTtsModel;
  @override
  TtsModel get toTtsModel;
  @override
  FT get ftTtsModel;
  @override
  bool get isMicListening;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
