import 'package:flutter/material.dart';
import './chairman.model.dart';

class Party {
  Color color;
  String nombre;
  List<Chairman> members;

  Party(this.nombre, String color, List<Map<String,String>> _members) {
    switch (color) {
      case 'yellow': this.color = Colors.yellow; break;
      case 'blue': this.color = Colors.blue; break;
      case 'red': this.color = Colors.red; break;
      case 'green': this.color = Colors.green; break;
      case 'cyan': this.color = Colors.cyan; break;
      case 'purple': this.color = Colors.purple; break;
      default: this.color = Colors.black; break;
    }
    this.members = [];
    _members.forEach((member) {
      this.members.add(Chairman(member,this));
    });
  }
}