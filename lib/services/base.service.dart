import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../components/alert.component.dart';
import '../components/ask.component.dart';


 /// Static Class with a collection of handy methods
class BaseService {
  // Attributes
  static bool _dialogAnswer= false;
  static bool _dev = true;

  // Getters
  /// Indicates wether developer mode is ON or OFF
  static bool get dev => _dev;
  /// Get the answer (YES / NO) from the last [dialogAsk]
  static bool get dialogAnswer => _dialogAnswer;

  // Private methods
  static bool _empty (Widget element) {
    // Only applies to containers, columns and rows
    if (element is Container && element.child == null)
      return true;
    if (element is Row && element.children == null)
      return true;
    if (element is Column && element.children == null)
      return true;
    return false;
  }

  // Debug methods
  /// Logs a message to the selected standard output (default is terminal)
  static void log(Object obj) {
    if (BaseService._dev)
      print("[DEV] " + obj.toString());
  }

  /// Logs a message to the selected standard error (default is terminal)
  static void error(Object obj) {
    if (BaseService._dev)
      print("[ERROR] " + obj.toString());
  }
  
  /// Pops up a dialog only if developer mode is active
  static void dAlert(BuildContext context, String title, String message) { // Only display if dev
    if (_dev) BaseService.alert(context, title, "[DEV] " + message);
  }

  // Builduing methods
  /// Adds a [padding] widget in between [children], and ignores empty containers
  static List<Widget> addPadding(double padding, List<Widget> children) {
    List<Widget> aux = new List<Widget>();
    List<Widget> ret = new List<Widget>();
    for (var i=0; i < children.length; i++)
      if (!BaseService._empty(children[i]))
        aux.add(children[i]);

    for (var i=0; i < aux.length; i++) {
      if (!BaseService._empty(aux[i])) {
        ret.add(aux[i]);
        if (i < aux.length - 1)
          ret.add(new Padding(padding: new EdgeInsets.all(padding)));
      }
    }
    return ret;
  }

  // Utility methods
  /// Pops up a dialog with [title] and [message]
  static void alert(BuildContext context, String title, String message) {
    showDialog(context: context, builder: (BuildContext context) {
      return new AlertComponent(title, message);
    });
  }

  /// Pops up a dialog with [title] and [message] and saves the answer (YES / NO) in [dialogAnswer]
  static Future<void> dialogAsk(BuildContext context, String title, String message) async {
    _dialogAnswer = null;
    await showDialog(context: context, builder: (BuildContext context) {
      return new AskComponent(title, message,
        yesFunc: () {
          log('The user pressed YES');
          _dialogAnswer = true;
          Navigator.pop(context);
        },
        noFunc: () {
          log('The user pressed NO');
          _dialogAnswer = false;
          Navigator.pop(context);
        },
      );
    });
  }

  /// Gets the app's directory
  static Future<Directory> get appDir {
    return getApplicationDocumentsDirectory();
  }

  /// Checks if [fileName] (relative to the app's directory) is an existing file
  static Future<bool> isFile(String fileName) async {
    Directory dir = await appDir;
    return FileSystemEntity.isFile(dir.path + '/' + fileName);
  }

  /// Checks if [dirName] (relative to the app's directory) is an existing directory
  static Future<bool> isDir(String dirName) async {
    Directory dir = await appDir;
    return FileSystemEntity.isDirectory(dir.path + '/' + dirName);
  }

  /// List all the entries inside the provided [path] (relative to the app's directory, which is the default if path is omitted)
  static Future<List<FileSystemEntity>> listEntries([path='']) async {
    Directory dir = new Directory((await appDir).path + '/' + path);
    return dir.list().toList();
  }

  /// List all the directories inside the provided [path] (relative to the app's directory, which is the default if path is omitted)
  static Future<List<Directory>> listDirs([path='']) async {
    List<Directory> ret = new List<Directory>();
    Directory dir = new Directory((await appDir).path + '/' + path);
    await dir.list().forEach((e) {
      if (e.toString().startsWith('Directory')) {
        ret.add(new Directory(e.absolute.path));
      }
    });
    return ret;
  }

  /// List all the files inside the provided [path] (relative to the app's directory, which is the default if path is omitted)
  static Future<List<File>> listFiles([path='']) async {
    List<File> ret = new List<File>();
    Directory dir = new Directory((await appDir).path + '/' + path);
    await dir.list().forEach((e) {
      if (e.toString().startsWith('File')) {
        ret.add(new File(e.absolute.path));
      }
    });
    return ret;
  }

  // General Functions
  /// Checks if [string] is an integer, and (if [min] / [max] are provided), tests for that range
  static bool isNumber(String string, {int min, int max}) {
    try {int.parse(string);} catch(e) {return false;}
    return ((min==null) || int.parse(string) >= min) && ((max==null) || int.parse(string) <= max);
  }

}