// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comments_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) {
  return _CommentsResponse.fromJson(json);
}

/// @nodoc
mixin _$CommentsResponse {
  List<Comment>? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentsResponseCopyWith<CommentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsResponseCopyWith<$Res> {
  factory $CommentsResponseCopyWith(
          CommentsResponse value, $Res Function(CommentsResponse) then) =
      _$CommentsResponseCopyWithImpl<$Res>;
  $Res call({List<Comment>? comments});
}

/// @nodoc
class _$CommentsResponseCopyWithImpl<$Res>
    implements $CommentsResponseCopyWith<$Res> {
  _$CommentsResponseCopyWithImpl(this._value, this._then);

  final CommentsResponse _value;
  // ignore: unused_field
  final $Res Function(CommentsResponse) _then;

  @override
  $Res call({
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentsResponseCopyWith<$Res>
    implements $CommentsResponseCopyWith<$Res> {
  factory _$$_CommentsResponseCopyWith(
          _$_CommentsResponse value, $Res Function(_$_CommentsResponse) then) =
      __$$_CommentsResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<Comment>? comments});
}

/// @nodoc
class __$$_CommentsResponseCopyWithImpl<$Res>
    extends _$CommentsResponseCopyWithImpl<$Res>
    implements _$$_CommentsResponseCopyWith<$Res> {
  __$$_CommentsResponseCopyWithImpl(
      _$_CommentsResponse _value, $Res Function(_$_CommentsResponse) _then)
      : super(_value, (v) => _then(v as _$_CommentsResponse));

  @override
  _$_CommentsResponse get _value => super._value as _$_CommentsResponse;

  @override
  $Res call({
    Object? comments = freezed,
  }) {
    return _then(_$_CommentsResponse(
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentsResponse implements _CommentsResponse {
  _$_CommentsResponse({final List<Comment>? comments = null})
      : _comments = comments;

  factory _$_CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CommentsResponseFromJson(json);

  final List<Comment>? _comments;
  @override
  @JsonKey()
  List<Comment>? get comments {
    final value = _comments;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommentsResponse(comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentsResponse &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  _$$_CommentsResponseCopyWith<_$_CommentsResponse> get copyWith =>
      __$$_CommentsResponseCopyWithImpl<_$_CommentsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentsResponseToJson(this);
  }
}

abstract class _CommentsResponse implements CommentsResponse {
  factory _CommentsResponse({final List<Comment>? comments}) =
      _$_CommentsResponse;

  factory _CommentsResponse.fromJson(Map<String, dynamic> json) =
      _$_CommentsResponse.fromJson;

  @override
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CommentsResponseCopyWith<_$_CommentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
