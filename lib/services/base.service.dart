import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' as dartio;

class BaseService {
  static bool _dev = true;
  static get dev => _dev;

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
      BaseService.alert(context, title, "[DEV] " + message);
  }

  static bool empty (Widget element) {
    // Only applies to containers, columns and rows
    if (element is Container && element.child == null)
      return true;
    if (element is Row && element.children == null)
      return true;
    if (element is Column && element.children == null)
      return true;
    return false;
  }

  static List<Widget> addPadding(double padding, List<Widget> children) {
    List<Widget> aux = new List<Widget>();
    List<Widget> ret = new List<Widget>();
    for (var i=0; i < children.length; i++)
      if (!BaseService.empty(children[i]))
        aux.add(children[i]);

    for (var i=0; i < aux.length; i++) {
      if (!BaseService.empty(aux[i])) {
        ret.add(aux[i]);
        if (i < aux.length - 1)
          ret.add(new Padding(padding: new EdgeInsets.all(padding)));
      }
    }
    return ret;
  }

}