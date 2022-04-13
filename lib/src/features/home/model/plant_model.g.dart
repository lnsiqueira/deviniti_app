// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlantModel _$$_PlantModelFromJson(Map<String, dynamic> json) =>
    _$_PlantModel(
      id: json['id'] as int,
      name: json['name'] as String,
      typeId: json['typeId'] as String,
      plantingDate: json['plantingDate'] as String,
    );

Map<String, dynamic> _$$_PlantModelToJson(_$_PlantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'typeId': instance.typeId,
      'plantingDate': instance.plantingDate,
    };
