import './party.model.dart';
import './project.model.dart';

class Chairman {
  int id;
  String nombre;
  Party partido;
  Map<Project,bool> votos;

  Chairman(Map<String,String> jsonData, this.partido) {
    assert(jsonData.containsKey('id') && jsonData.containsKey('nombre'));
    this.id = int.parse(jsonData['id']);
    this.nombre = jsonData['nombre'];
  }
}