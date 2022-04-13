import 'package:deviniti_app/src/features/home/model/plant_model.dart';
import 'package:deviniti_app/src/features/home/model/type_plant_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    return _database ?? await initDatabase();
  }

  static get() async {
    return await DB.instance.database;
  }

  initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'plant.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(plant);
        await db.execute(typePlant);
        await setupType(db);
      },
    );
  }

  String get plant => ''' 
CREATE TABLE plants(
  id INTEGER PRIMARY KEY AUTOINCREMENT ,
  name TEXT,
  typeId TEXT,
  plantingDate DATETIME 
);
''';

  String get typePlant => ''' 
CREATE TABLE typePlant(
  id INTEGER PRIMARY KEY AUTOINCREMENT ,
  type TEXT
);
''';

  setupType(db) {
    for (TypePlantModel type in setup()) {
      db.insert('typePlant', {'id': type.id, 'type': type.type});
    }

    // for (PlantModel plant in setupPlant()) {
    //   db.insert('plants', {
    //     'id': plant.id,
    //     'name': plant.name,
    //     'typeId': plant.typeId,
    //     'plantingDate': plant.plantingDate,
    //   });
    // }
  }

  static setupPlant() {
    return [
      PlantModel(
          id: 1,
          name: "Azaleia",
          typeId: 'Alpines',
          plantingDate: DateTime.now().toString()),
      PlantModel(
          id: 2,
          name: "Rosa",
          typeId: 'Ferns',
          plantingDate: DateTime.now().toString()),
    ];
  }

  static setup() {
    return [
      TypePlantModel(id: 1, type: 'Alpines'),
      TypePlantModel(id: 2, type: 'Aquatic'),
      TypePlantModel(id: 3, type: 'Bulbs'),
      TypePlantModel(id: 4, type: 'Succulents'),
      TypePlantModel(id: 5, type: 'Carnivorous'),
      TypePlantModel(id: 6, type: 'Climbers'),
      TypePlantModel(id: 7, type: 'Ferns'),
      TypePlantModel(id: 8, type: 'Grasses'),
      TypePlantModel(id: 9, type: 'Trees'),
    ];
  }
}
