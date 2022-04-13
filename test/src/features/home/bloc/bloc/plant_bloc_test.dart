import 'package:deviniti_app/src/features/home/bloc/bloc/plant_bloc.dart';
import 'package:deviniti_app/src/features/home/bloc/bloc/plant_event.dart';
import 'package:deviniti_app/src/features/home/bloc/bloc/plant_state.dart';
import 'package:deviniti_app/src/features/home/model/plant_model.dart';
import 'package:deviniti_app/src/features/home/repository/plants_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPlantRepository extends Mock implements PlantsRepository {}

void main() {
  late MockPlantRepository mockPlantRepository;

  setUp(() {
    mockPlantRepository = MockPlantRepository();
  });

  group('Plants', () {
    final plant = PlantModel(
        id: 1, name: 'Test', typeId: 'type teste', plantingDate: '2022-04-13');
    when(mockPlantRepository.loadPlants()).thenAnswer((_) async => plant);
    List<PlantModel> plants = [];

    test('Add plant', () {
      final bloc = PlantBloc();
      bloc.add(AddPlantEvent(plants: plant));

      expectLater(
          bloc,
          emitsInOrder(
              [PlantInitialState(), PlantSuccessState(plants: plants)]));
    });

    test('Remove plant', () {
      final bloc = PlantBloc();
      bloc.add(RemovePlantEvent(plants: plant));

      expectLater(
          bloc,
          emitsInOrder(
              [PlantInitialState(), PlantSuccessState(plants: plants)]));
    });

    test('Update plant', () {
      final bloc = PlantBloc();
      bloc.add(UpdatePlantEvent(plants: plant));

      expectLater(
          bloc,
          emitsInOrder(
              [PlantInitialState(), PlantSuccessState(plants: plants)]));
    });
  });
}
