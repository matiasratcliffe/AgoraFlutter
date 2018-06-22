import './project.model.dart';

class User {
  int dni;
  bool validado;
  String email;
  List<String> myTags;
  List<Map<Project,DateTime>> subscribedProjects;
  List<Map<Project,bool>> votedProjects;


}