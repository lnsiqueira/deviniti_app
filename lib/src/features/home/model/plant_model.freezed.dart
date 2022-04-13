// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlantModel _$PlantModelFromJson(Map<String, dynamic> json) {
  return _PlantModel.fromJson(json);
}

/// @nodoc
class _$PlantModelTearOff {
  const _$PlantModelTearOff();

  _PlantModel call(
      {required int id,
      required String name,
      required String typeId,
      required String plantingDate}) {
    return _PlantModel(
      id: id,
      name: name,
      typeId: typeId,
      plantingDate: plantingDate,
    );
  }

  PlantModel fromJson(Map<String, Object?> json) {
    return PlantModel.fromJson(json);
  }
}

/// @nodoc
const $PlantModel = _$PlantModelTearOff();

/// @nodoc
mixin _$PlantModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get typeId => throw _privateConstructorUsedError;
  String get plantingDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantModelCopyWith<PlantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantModelCopyWith<$Res> {
  factory $PlantModelCopyWith(
          PlantModel value, $Res Function(PlantModel) then) =
      _$PlantModelCopyWithImpl<$Res>;
  $Res call({int id, String name, String typeId, String plantingDate});
}

/// @nodoc
class _$PlantModelCopyWithImpl<$Res> implements $PlantModelCopyWith<$Res> {
  _$PlantModelCopyWithImpl(this._value, this._then);

  final PlantModel _value;
  // ignore: unused_field
  final $Res Function(PlantModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? typeId = freezed,
    Object? plantingDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeId: typeId == freezed
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String,
      plantingDate: plantingDate == freezed
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PlantModelCopyWith<$Res> implements $PlantModelCopyWith<$Res> {
  factory _$PlantModelCopyWith(
          _PlantModel value, $Res Function(_PlantModel) then) =
      __$PlantModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String typeId, String plantingDate});
}

/// @nodoc
class __$PlantModelCopyWithImpl<$Res> extends _$PlantModelCopyWithImpl<$Res>
    implements _$PlantModelCopyWith<$Res> {
  __$PlantModelCopyWithImpl(
      _PlantModel _value, $Res Function(_PlantModel) _then)
      : super(_value, (v) => _then(v as _PlantModel));

  @override
  _PlantModel get _value => super._value as _PlantModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? typeId = freezed,
    Object? plantingDate = freezed,
  }) {
    return _then(_PlantModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeId: typeId == freezed
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String,
      plantingDate: plantingDate == freezed
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlantModel implements _PlantModel {
  _$_PlantModel(
      {required this.id,
      required this.name,
      required this.typeId,
      required this.plantingDate});

  factory _$_PlantModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlantModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String typeId;
  @override
  final String plantingDate;

  @override
  String toString() {
    return 'PlantModel(id: $id, name: $name, typeId: $typeId, plantingDate: $plantingDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlantModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.typeId, typeId) &&
            const DeepCollectionEquality()
                .equals(other.plantingDate, plantingDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(typeId),
      const DeepCollectionEquality().hash(plantingDate));

  @JsonKey(ignore: true)
  @override
  _$PlantModelCopyWith<_PlantModel> get copyWith =>
      __$PlantModelCopyWithImpl<_PlantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlantModelToJson(this);
  }
}

abstract class _PlantModel implements PlantModel {
  factory _PlantModel(
      {required int id,
      required String name,
      required String typeId,
      required String plantingDate}) = _$_PlantModel;

  factory _PlantModel.fromJson(Map<String, dynamic> json) =
      _$_PlantModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get typeId;
  @override
  String get plantingDate;
  @override
  @JsonKey(ignore: true)
  _$PlantModelCopyWith<_PlantModel> get copyWith =>
      throw _privateConstructorUsedError;
}
