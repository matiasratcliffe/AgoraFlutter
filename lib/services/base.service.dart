// Dart requirements
import 'dart:io';
import 'dart:async';

// Flutter requirements
import 'package:flutter/material.dart';

// Plugin requirements
import 'package:path_provider/path_provider.dart';

// Components to be used
import '../components/alert.component.dart';
import '../components/ask.component.dart';


/// Static Class with a collection of handy methods
class BaseService {

  /// Retains the value of the last [dialogAsk] answer
  static bool _dialogAnswer = false;

  /// Indicates if the app is being ran in developer mode (independent with flutters debug mode)
  static bool _dev = true;

  /// Indicates wether developer mode is ON or OFF
  static bool get dev => _dev;

  /// Get the answer (YES / NO) from the last [dialogAsk]
  static bool get dialogAnswer => _dialogAnswer;

  // Private methods
  /// Checks wether the [element] widget is an empty [Column], [Row] or [Container] 
  static bool _empty (Widget element) {
    // Only applies to containers, columns and rows
    if (element is Container && element.child == null) // Empty container
      return true;
    if (element is Row && element.children == null) // Empty Row
      return true;
    if (element is Column && element.children == null) // Empty Column
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
  static void dAlert(BuildContext context, String title, String message) { // Only display if [dev] is true
    if (_dev) BaseService.alert(context, title, "[DEV] " + message);
  }

  // Builduing methods
  /// Adds a [padding] widget in between [children], and ignores empty containers
  static List<Widget> addPadding(double padding, List<Widget> children) {
    List<Widget> aux = new List<Widget>(); // An auxiliary widget list to save all NON EMPTY children
    List<Widget> ret = new List<Widget>(); // The list with the padding, to be returned
    
    // Appending non empty childern to [aux]
    for (var i=0; i < children.length; i++)
      if (!BaseService._empty(children[i]))
        aux.add(children[i]);

    // Adding padding to aux children
    for (var i=0; i < aux.length; i++) {
      if (!BaseService._empty(aux[i])) {
        ret.add(aux[i]);
        if (i < aux.length - 1)
          ret.add(Padding(padding: EdgeInsets.all(padding)));
      }
    }
    return ret;
  }

  // Utility methods
  /// Pops up a dialog with [title] and [message]
  static void alert(BuildContext context, String title, String message) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertComponent(title, message); // Uses the component imported above
    });
  }

  /// Pops up a dialog with [title] and [message] and saves the answer (YES / NO) in [dialogAnswer]
  static Future<void> dialogAsk(BuildContext context, String title, String message) async {
    _dialogAnswer = null; // Sets the dialog answer to null (also undefined)
    await showDialog(context: context, builder: (BuildContext context) {
      return AskComponent(title, message,
        // Function to be executed if the user selects YES
        yesFunc: () {
          BaseService.log('The user pressed YES');
          _dialogAnswer = true; // Set the appropiate answer
          Navigator.pop(context); // Pop the navigator to dismiss the message
        },
        // Function to be executed if the user selects NO
        noFunc: () {
          BaseService.log('The user pressed NO');
          _dialogAnswer = false; // Set the appropiate answer
          Navigator.pop(context); // Pop the navigator to dismiss the message
        },
      );
    });
  }

  /// Gets the app's directory
  static Future<Directory> get appDir {
    return getApplicationDocumentsDirectory(); // Uses the plugin API imported above
  }

  /// Checks if [fileName] (relative to the app's directory) is an existing file
  static Future<bool> isFile(String fileName) async {
    Directory dir = await appDir; // Dir buffer that awaits appDir
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
      // Only adds the entry if it is a Directory
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
      // Only adds the entry if it is a File
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