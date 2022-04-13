import 'package:deviniti_app/src/features/home/model/plant_model.dart';

abstract class PlantState {
  late List<PlantModel> plants;

  PlantState({
    required this.plants,
  });
}

class PlantInitialState extends PlantState {
  PlantInitialState() : super(plants: []);
}

class PlantSuccessState extends PlantState {
  PlantSuccessState({required List<PlantModel> plants}) : super(plants: plants);
}
