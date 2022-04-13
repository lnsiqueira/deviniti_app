import 'package:deviniti_app/src/features/home/model/plant_model.dart';

abstract class PlantEvent {}

class LoadPlantEvent extends PlantEvent {}

class AddPlantEvent extends PlantEvent {
  late PlantModel plants;

  AddPlantEvent({
    required this.plants,
  });
}

class UpdatePlantEvent extends PlantEvent {
  late PlantModel plants;

  UpdatePlantEvent({
    required this.plants,
  });
}

class RemovePlantEvent extends PlantEvent {
  late PlantModel plants;

  RemovePlantEvent({
    required this.plants,
  });
}
