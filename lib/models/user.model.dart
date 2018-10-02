import './project.model.dart';

class User {
  int dni;
  bool validado; // que se valide con un celular
  String email;
  List<String> myTags;
  Map<Project,DateTime> subscribedProjects; // datetime para ver la ultima vez que el usuario hizo click en el proyecto, y comparando eso con la datetime de la ultima actualizacion, decido si hay novedad o no
  Map<Project,bool> votedProjects;


}