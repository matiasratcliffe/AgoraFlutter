import 'package:flutter/material.dart';

class BaseService {
  static bool _dev = true;

  static void log(Object obj) {
    if (BaseService._dev)
      print("[DEV] " + obj.toString());
  }

  static void error(Object obj) {
    if (BaseService._dev)
      print("[ERROR] " + obj.toString());
  }

  static void alert(BuildContext context, String title, String message) {
    showDialog(context: context, builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(title),
        content: new Text(message),
      );
    });
  }

  static void dAlert(BuildContext context, String title, String message) { // Only display if dev
    if (_dev)
      BaseService.alert(context, title, message);
  }
}