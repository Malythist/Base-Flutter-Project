// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExampleItem {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExampleItemCopyWith<ExampleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleItemCopyWith<$Res> {
  factory $ExampleItemCopyWith(
          ExampleItem value, $Res Function(ExampleItem) then) =
      _$ExampleItemCopyWithImpl<$Res, ExampleItem>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$ExampleItemCopyWithImpl<$Res, $Val extends ExampleItem>
    implements $ExampleItemCopyWith<$Res> {
  _$ExampleItemCopyWithImpl(this._value, this._then);

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
abstract class _$$ExampleItemImplCopyWith<$Res>
    implements $ExampleItemCopyWith<$Res> {
  factory _$$ExampleItemImplCopyWith(
          _$ExampleItemImpl value, $Res Function(_$ExampleItemImpl) then) =
      __$$ExampleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$ExampleItemImplCopyWithImpl<$Res>
    extends _$ExampleItemCopyWithImpl<$Res, _$ExampleItemImpl>
    implements _$$ExampleItemImplCopyWith<$Res> {
  __$$ExampleItemImplCopyWithImpl(
      _$ExampleItemImpl _value, $Res Function(_$ExampleItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$ExampleItemImpl(
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

class _$ExampleItemImpl implements _ExampleItem {
  const _$ExampleItemImpl({required this.id, required this.title});

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'ExampleItem(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExampleItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExampleItemImplCopyWith<_$ExampleItemImpl> get copyWith =>
      __$$ExampleItemImplCopyWithImpl<_$ExampleItemImpl>(this, _$identity);
}

abstract class _ExampleItem implements ExampleItem {
  const factory _ExampleItem(
      {required final int id, required final String title}) = _$ExampleItemImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$ExampleItemImplCopyWith<_$ExampleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
