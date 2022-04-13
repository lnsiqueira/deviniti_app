// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'type_plant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TypePlantModel _$TypePlantModelFromJson(Map<String, dynamic> json) {
  return _TypePlantModel.fromJson(json);
}

/// @nodoc
class _$TypePlantModelTearOff {
  const _$TypePlantModelTearOff();

  _TypePlantModel call({required int id, required String type}) {
    return _TypePlantModel(
      id: id,
      type: type,
    );
  }

  TypePlantModel fromJson(Map<String, Object?> json) {
    return TypePlantModel.fromJson(json);
  }
}

/// @nodoc
const $TypePlantModel = _$TypePlantModelTearOff();

/// @nodoc
mixin _$TypePlantModel {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypePlantModelCopyWith<TypePlantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypePlantModelCopyWith<$Res> {
  factory $TypePlantModelCopyWith(
          TypePlantModel value, $Res Function(TypePlantModel) then) =
      _$TypePlantModelCopyWithImpl<$Res>;
  $Res call({int id, String type});
}

/// @nodoc
class _$TypePlantModelCopyWithImpl<$Res>
    implements $TypePlantModelCopyWith<$Res> {
  _$TypePlantModelCopyWithImpl(this._value, this._then);

  final TypePlantModel _value;
  // ignore: unused_field
  final $Res Function(TypePlantModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TypePlantModelCopyWith<$Res>
    implements $TypePlantModelCopyWith<$Res> {
  factory _$TypePlantModelCopyWith(
          _TypePlantModel value, $Res Function(_TypePlantModel) then) =
      __$TypePlantModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String type});
}

/// @nodoc
class __$TypePlantModelCopyWithImpl<$Res>
    extends _$TypePlantModelCopyWithImpl<$Res>
    implements _$TypePlantModelCopyWith<$Res> {
  __$TypePlantModelCopyWithImpl(
      _TypePlantModel _value, $Res Function(_TypePlantModel) _then)
      : super(_value, (v) => _then(v as _TypePlantModel));

  @override
  _TypePlantModel get _value => super._value as _TypePlantModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
  }) {
    return _then(_TypePlantModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TypePlantModel implements _TypePlantModel {
  _$_TypePlantModel({required this.id, required this.type});

  factory _$_TypePlantModel.fromJson(Map<String, dynamic> json) =>
      _$$_TypePlantModelFromJson(json);

  @override
  final int id;
  @override
  final String type;

  @override
  String toString() {
    return 'TypePlantModel(id: $id, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TypePlantModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$TypePlantModelCopyWith<_TypePlantModel> get copyWith =>
      __$TypePlantModelCopyWithImpl<_TypePlantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TypePlantModelToJson(this);
  }
}

abstract class _TypePlantModel implements TypePlantModel {
  factory _TypePlantModel({required int id, required String type}) =
      _$_TypePlantModel;

  factory _TypePlantModel.fromJson(Map<String, dynamic> json) =
      _$_TypePlantModel.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$TypePlantModelCopyWith<_TypePlantModel> get copyWith =>
      throw _privateConstructorUsedError;
}
