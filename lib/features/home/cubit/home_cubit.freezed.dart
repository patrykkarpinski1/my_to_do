// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  List<NoteModel> get notes => throw _privateConstructorUsedError;
  NoteModel? get noteModel => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get saved => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<NoteModel> notes,
      NoteModel? noteModel,
      Status status,
      String? errorMessage,
      bool saved});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? noteModel = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? saved = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
      noteModel: freezed == noteModel
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NoteModel> notes,
      NoteModel? noteModel,
      Status status,
      String? errorMessage,
      bool saved});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? noteModel = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? saved = null,
  }) {
    return _then(_$_HomeState(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
      noteModel: freezed == noteModel
          ? _value.noteModel
          : noteModel // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {final List<NoteModel> notes = const [],
      this.noteModel,
      this.status = Status.initial,
      this.errorMessage,
      this.saved = false})
      : _notes = notes;

  final List<NoteModel> _notes;
  @override
  @JsonKey()
  List<NoteModel> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final NoteModel? noteModel;
  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool saved;

  @override
  String toString() {
    return 'HomeState(notes: $notes, noteModel: $noteModel, status: $status, errorMessage: $errorMessage, saved: $saved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.noteModel, noteModel) ||
                other.noteModel == noteModel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.saved, saved) || other.saved == saved));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notes),
      noteModel,
      status,
      errorMessage,
      saved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final List<NoteModel> notes,
      final NoteModel? noteModel,
      final Status status,
      final String? errorMessage,
      final bool saved}) = _$_HomeState;

  @override
  List<NoteModel> get notes;
  @override
  NoteModel? get noteModel;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  bool get saved;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
