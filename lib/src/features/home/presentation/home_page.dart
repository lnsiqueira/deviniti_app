import 'package:deviniti_app/src/features/home/bloc/bloc/plant_bloc.dart';
import 'package:deviniti_app/src/features/home/bloc/bloc/plant_event.dart';
import 'package:deviniti_app/src/features/home/bloc/bloc/plant_state.dart';
import 'package:deviniti_app/src/features/home/model/plant_model.dart';
import 'package:deviniti_app/src/features/home/model/type_model.dart';
import 'package:deviniti_app/src/features/home/repository/plants_repository.dart';
import 'package:deviniti_app/src/shared/constants.dart';
import 'package:deviniti_app/src/shared/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PlantBloc bloc;
  final _repository = PlantsRepository();
  List<PlantModel> plantTmp = [];
  List<PlantModel> plantList = [];
  List<PlantModel> duplicateItems = <PlantModel>[];
  bool _updateList = false;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    bloc = PlantBloc();
    bloc.add(LoadPlantEvent());
    WidgetsBinding.instance!.addPostFrameCallback((_) => _initBloc());
  }

  Future<void> _initBloc() async {
    await _repository.loadPlants();
    setState(() {});
    duplicateItems.addAll(plantList);
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  void _delete(int index) {
    _updateList = true;
    bloc.add(RemovePlantEvent(plants: plantList[index]));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Remove success!')));
  }

  void _add(BuildContext ctx) {
    final _name = TextEditingController();
    final _formatKey = GlobalKey<FormState>();
    final TextEditingController _dateinput = TextEditingController();
    final _repository = PlantsRepository();
    String _status = '';

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 650,
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Add data',
                        style: TextStyle(fontSize: 18, color: Colors.orange)),
                  ),
                  Form(
                    key: _formatKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: TextFormField(
                              controller: _name,
                              decoration: const InputDecoration(
                                labelText: 'Plant Name',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter the name';
                                }
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              FutureBuilder<List<TypeModel>>(
                                  future: _repository.getTypePlant(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<TypeModel>> snapshot) {
                                    if (!snapshot.hasData) {
                                      return const CircularProgressIndicator();
                                    }
                                    return DropdownButton<TypeModel>(
                                      items: snapshot.data!
                                          .map((user) =>
                                              DropdownMenuItem<TypeModel>(
                                                child: Text(user.type),
                                                value: user,
                                              ))
                                          .toList(),
                                      onChanged: (TypeModel? newValue) {
                                        setState(() {
                                          _status = newValue!.type;
                                          Text(
                                            _status,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: kThemeColor),
                                          );
                                        });
                                      },
                                      isExpanded: false,
                                      hint: const Text('Plant Type'),
                                    );
                                  }),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  _status,
                                  style: const TextStyle(
                                      fontSize: 18, color: kThemeColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Center(
                            child: TextFormField(
                              controller: _dateinput,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.calendar_today),
                                  labelText: "Planting date"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter the planting datet';
                                }
                                return null;
                              },
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);

                                  setState(() {
                                    _dateinput.text = formattedDate;
                                  });
                                } else {}
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formatKey.currentState!.validate()) {
                            bloc.add(
                              AddPlantEvent(
                                  plants: PlantModel(
                                      id: 1,
                                      name: _name.text,
                                      typeId: _status,
                                      plantingDate:
                                          _dateinput.text.toString())),
                            );
                            _updateList = true;
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Save success!')));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.check),
                            Text(
                              'Save',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            );
          });
        });
  }

  void _edit(BuildContext ctx, PlantModel plant) {
    final _name = TextEditingController(text: plant.name);
    final _formatKey = GlobalKey<FormState>();
    final TextEditingController _dateinput =
        TextEditingController(text: plant.plantingDate);
    final _repository = PlantsRepository();
    String _status = plant.typeId.toString();

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 650,
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Update data',
                        style: TextStyle(fontSize: 18, color: Colors.orange)),
                  ),
                  Form(
                    key: _formatKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: TextFormField(
                              controller: _name,
                              decoration: const InputDecoration(
                                labelText: 'Plant Name',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter the name';
                                }
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              FutureBuilder<List<TypeModel>>(
                                  future: _repository.getTypePlant(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<TypeModel>> snapshot) {
                                    if (!snapshot.hasData) {
                                      return const CircularProgressIndicator();
                                    }
                                    return DropdownButton<TypeModel>(
                                      items: snapshot.data!
                                          .map((user) =>
                                              DropdownMenuItem<TypeModel>(
                                                child: Text(user.type),
                                                value: user,
                                              ))
                                          .toList(),
                                      onChanged: (TypeModel? newValue) {
                                        setState(() {
                                          _status = newValue!.type;
                                          Text(
                                            _status,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: kThemeColor),
                                          );
                                        });
                                      },
                                      isExpanded: false,
                                      hint: const Text('Plant Type'),
                                    );
                                  }),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  _status,
                                  style: const TextStyle(
                                      fontSize: 18, color: kThemeColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Center(
                            child: TextFormField(
                              controller: _dateinput,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.calendar_today),
                                  labelText: "Planting date"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter the planting datet';
                                }
                                return null;
                              },
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);

                                  setState(() {
                                    _dateinput.text = formattedDate;
                                  });
                                } else {}
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formatKey.currentState!.validate()) {
                            bloc.add(
                              UpdatePlantEvent(
                                  plants: PlantModel(
                                      id: plant.id,
                                      name: _name.text,
                                      typeId: _status,
                                      plantingDate:
                                          _dateinput.text.toString())),
                            );
                            _updateList = true;
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Save success!')));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.check),
                            Text(
                              'Save',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            );
          });
        });
  }

  void filterSearchResults(String query) {
    List<PlantModel> dummySearchList = <PlantModel>[];
    dummySearchList.addAll(plantList);
    if (query.isNotEmpty) {
      List<PlantModel> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        plantList.clear();
        plantList.addAll(dummyListData);
        if (plantList.isEmpty) {
          _isVisible = true;
        } else {
          _isVisible = false;
        }
      });

      return;
    } else {
      setState(() {
        _isVisible = false;
        plantList.clear();
        plantList.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Garden'),
        actions: [
          IconButton(
              onPressed: () {
                _add(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isVisible,
            child: Column(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Record not found...",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: BlocBuilder<PlantBloc, PlantState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is PlantInitialState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is PlantSuccessState) {
                      plantList = state.plants;

                      if (_updateList) {
                        duplicateItems.clear();
                        duplicateItems.addAll(plantList);
                        _updateList = false;
                      }

                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) => ListTile(
                                leading: CircleAvatar(
                                  child: Text(plantList[index]
                                          .name
                                          .substring(0, 1)
                                          .toUpperCase() +
                                      plantList[index]
                                          .name[
                                              plantList[index].name.length - 1]
                                          .toUpperCase()),
                                ),
                                title: Text(plantList[index].name),
                                onTap: () {
                                  _edit(
                                    context,
                                    plantList[index],
                                  );
                                },
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Plant Type: ' +
                                            plantList[index].typeId,
                                        style: const TextStyle(
                                            color: Colors.green)),
                                    Text(
                                        'Planting Date: ' +
                                            plantList[index].plantingDate,
                                        style: const TextStyle(
                                            color: Colors.orange))
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove_circle),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialog(
                                        message:
                                            'Are you sure you want to delete?"',
                                        firstButton: 'No',
                                        firstOnTap: () {
                                          Navigator.pop(context);
                                        },
                                        secondOnTap: () {
                                          _delete(index);
                                          Navigator.pop(context);
                                        },
                                        secondButton: 'Yes',
                                      ),
                                    );
                                  },
                                ),
                              ),
                          separatorBuilder: (_, __) => const Divider(),
                          itemCount: plantList.length);
                    }
                    return const Text('not found');
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
