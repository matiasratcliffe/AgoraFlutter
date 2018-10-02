import './projectState.model.dart';

class Project { // unicos
  int id; // unique id?
  int favor;
  int against;
  int subscribers;
  String nombre;
  String description;
  DateTime lastUpdate;
  List<ProjectState> state; // state[0] es el actual

  Project(Map<String, String> jsonData) {
    assert(jsonData.containsKey('id') && jsonData.containsKey('favor') && jsonData.containsKey('against') &&
           jsonData.containsKey('subscribers') && jsonData.containsKey('nombre') && jsonData.containsKey('description'));
    
    this.id = int.parse(jsonData['id']);
    this.favor = int.parse(jsonData['favor']);
    this.against = int.parse(jsonData['against']);
    this.subscribers = int.parse(jsonData['subscribers']);
    this.nombre = jsonData['nombre'];
    this.description = jsonData['description'];
  }

}

//TODO: serialize DateTime!!!!!