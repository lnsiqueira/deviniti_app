import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_plant_model.freezed.dart';
part 'type_plant_model.g.dart';

@freezed
class TypePlantModel with _$TypePlantModel {
  factory TypePlantModel({
    required int id,
    required String type,
  }) = _TypePlantModel;

  factory TypePlantModel.fromJson(Map<String, dynamic> json) =>
      _$TypePlantModelFromJson(json);
}
