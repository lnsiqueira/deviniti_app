import 'package:deviniti_app/src/features/home/bloc/bloc/plant_event.dart';
import 'package:deviniti_app/src/features/home/bloc/bloc/plant_state.dart';
import 'package:deviniti_app/src/features/home/repository/plants_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlantBloc extends Bloc<PlantEvent, PlantState> {
  final _repository = PlantsRepository();

  PlantBloc() : super(PlantInitialState()) {
    on<LoadPlantEvent>(
      (event, emit) async => emit(PlantSuccessState(plants: planta)),
    );

    on<AddPlantEvent>(
      (event, emit) async {
        emit(PlantSuccessState(
            plants: await _repository.addPlant(event.plants)));
      },
    );

    on<RemovePlantEvent>(
      (event, emit) async => emit(PlantSuccessState(
          plants: await _repository.removePlant(event.plants))),
    );

    on<UpdatePlantEvent>(
      (event, emit) async => emit(PlantSuccessState(
          plants: await _repository.updatePlant(event.plants))),
    );
  }
}
