class TypeModel {
  int id = 0;
  String type = '';

  TypeModel(
    this.id,
    this.type,
  );

  TypeModel.fromMap(dynamic obj) {
    this.id = obj["id"];
    this.type = obj["type"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["id"] = id;
    map["type"] = type;

    return map;
  }

  int get getId => id;
  String get getType => type;
}
