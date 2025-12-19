// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExampleItemDto _$ExampleItemDtoFromJson(Map<String, dynamic> json) {
  return _ExampleItemDto.fromJson(json);
}

/// @nodoc
mixin _$ExampleItemDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExampleItemDtoCopyWith<ExampleItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleItemDtoCopyWith<$Res> {
  factory $ExampleItemDtoCopyWith(
          ExampleItemDto value, $Res Function(ExampleItemDto) then) =
      _$ExampleItemDtoCopyWithImpl<$Res, ExampleItemDto>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$ExampleItemDtoCopyWithImpl<$Res, $Val extends ExampleItemDto>
    implements $ExampleItemDtoCopyWith<$Res> {
  _$ExampleItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExampleItemDtoImplCopyWith<$Res>
    implements $ExampleItemDtoCopyWith<$Res> {
  factory _$$ExampleItemDtoImplCopyWith(_$ExampleItemDtoImpl value,
          $Res Function(_$ExampleItemDtoImpl) then) =
      __$$ExampleItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$ExampleItemDtoImplCopyWithImpl<$Res>
    extends _$ExampleItemDtoCopyWithImpl<$Res, _$ExampleItemDtoImpl>
    implements _$$ExampleItemDtoImplCopyWith<$Res> {
  __$$ExampleItemDtoImplCopyWithImpl(
      _$ExampleItemDtoImpl _value, $Res Function(_$ExampleItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$ExampleItemDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExampleItemDtoImpl implements _ExampleItemDto {
  const _$ExampleItemDtoImpl({required this.id, required this.title});

  factory _$ExampleItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExampleItemDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'ExampleItemDto(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExampleItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExampleItemDtoImplCopyWith<_$ExampleItemDtoImpl> get copyWith =>
      __$$ExampleItemDtoImplCopyWithImpl<_$ExampleItemDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExampleItemDtoImplToJson(
      this,
    );
  }
}

abstract class _ExampleItemDto implements ExampleItemDto {
  const factory _ExampleItemDto(
      {required final int id,
      required final String title}) = _$ExampleItemDtoImpl;

  factory _ExampleItemDto.fromJson(Map<String, dynamic> json) =
      _$ExampleItemDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$ExampleItemDtoImplCopyWith<_$ExampleItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
