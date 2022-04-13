import 'package:deviniti_app/src/database/db.dart';
import 'package:deviniti_app/src/features/home/model/plant_model.dart';
import 'package:deviniti_app/src/features/home/model/type_model.dart';

final List<PlantModel> _plant = [];
List<PlantModel> planta = [];

class PlantsRepository {
  PlantsRepository() {
    initRepository();
  }

  initRepository() async {
    var db = await DB.get();
    List plants = await db.query('plants');

    for (var plant in plants) {
      _plant.add(
        PlantModel(
          id: plant['id'],
          name: plant['name'],
          typeId: plant['typeId'],
          plantingDate: plant['plantingDate'],
        ),
      );
    }
  }

  Future<List<TypeModel>> getTypePlant() async {
    var db = await DB.get();

    List sql = await db.query('typePlant');

    List<TypeModel> list = sql.map((item) {
      return TypeModel.fromMap(item);
    }).toList();

    return list;
  }

  loadPlants() async {
    planta = [];
    var db = await DB.get();
    List plantas = await db.query('plants');

    for (var plant in plantas) {
      planta.add(
        PlantModel(
            id: plant['id'],
            name: plant['name'],
            typeId: plant['typeId'],
            plantingDate: plant['plantingDate']),
      );
    }
  }

  Future<List<PlantModel>> addPlant(PlantModel plantModel) async {
    var db = await DB.get();

    String name = plantModel.name;
    String typeId = plantModel.typeId;
    String plantingDate = plantModel.plantingDate;

    try {
      db.insert('plants', {
        'name': name,
        'typeId': typeId,
        'plantingDate': plantingDate.toString(),
      });
    } catch (e) {
      throw (e.toString());
    }

    await loadPlants();
    return planta;
  }

  Future<List<PlantModel>> updatePlant(PlantModel plantModel) async {
    var db = await DB.get();

    String name = plantModel.name;
    String typeId = plantModel.typeId;
    String plantingDate = plantModel.plantingDate;
    int id = plantModel.id;

    try {
      await db.update('plants',
          {'name': name, 'typeId': typeId, 'plantingDate': plantingDate},
          where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      throw (e.toString());
    }

    await loadPlants();
    return planta;
  }

  Future<List<PlantModel>> removePlant(PlantModel plantModel) async {
    var db = await DB.get();
    int id = plantModel.id;

    try {
      await db.delete('plants', where: 'id = ?', whereArgs: [id]);
      await loadPlants();
    } catch (e) {
      throw (e.toString());
    }
    return planta;
  }
}
