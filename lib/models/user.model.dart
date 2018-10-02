import './project.model.dart';

class User {
  int dni;
  bool validado; // que se valide con un celular
  String email;
  String nombre;
  Map<String,bool> tags; // Tagname, updates?
  Map<Project,DateTime> subscribed; // datetime para ver la ultima vez que el usuario hizo click en el proyecto, y comparando eso con la datetime de la ultima actualizacion, decido si hay novedad o no
  Map<Project,bool> voted;
  ProjectCount count;

  User(this.dni, this.validado, this.nombre, this.tags, this.count);

}

class ProjectCount {
  int favor;
  int contra;
  int subscriptos;
  int terminados;

  ProjectCount(this.favor, this.contra, this.subscriptos, this.terminados);
}