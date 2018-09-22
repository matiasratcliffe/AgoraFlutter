// Dart requirements
import 'dart:io';
import 'dart:convert';

// Flutter requirements
import 'package:flutter/material.dart';

// Pages that can be directly instantiated by [MyApp]
import './pages/login/login.page.dart';
import './pages/home/home.page.dart';

// Service wrapping static classes
import './services/base.service.dart';
import './services/http.service.dart';

/// Flag that determines the presense/absense of a valid persistent token
bool _rememberUser = false;

/// Buffer for the token, if any, to be passed to the [HomePage] constructor
String _token = '';


/// Main function
void main() async {  
  try {
    String filePath = (await BaseService.appDir).uri.path + 'remembertoken'; // Gets the full path of where the remembertoken file should be
    
    // Checking if the file exists in the given path, synchronously
    if (FileSystemEntity.isFileSync(filePath)) { // FILE EXISTS!
      File remembertoken = new File(filePath); // A handle to the file
      String fileContents = remembertoken.readAsStringSync(); // A string saving the contents (JSON) read from the file
      String email = jsonDecode(fileContents).email; // The email-account saved in the file
      _token = jsonDecode(fileContents).token; // Save the token in its corresponding buffer
      BaseService.log('Token Found: ' + _token); // Log the token onto the developers console

      // Checking if the token is valid
      if ((await HttpService.post({'email': email, 'token': _token}, url: '')).statusCode == 200) { // The token is valid!
        BaseService.log('Token seems valid!');
        _rememberUser = true; // Sets the flag to redirect the main constructor from the [LoginPage] to the [HomePage]
      }
    } else { // FILE INEXISTENT!
      BaseService.log('No token found!');
    }
  } on FormatException {
    BaseService.log('Token file\'s format is invalid');
  } catch (e) { // In case the file had invalid contents - (ex: not json)
    BaseService.log('Error retrieving token: ${e.toString()}');
  }
  runApp(new MyApp()); // Bootstraps the main Widget (Starts the graphical mode)
}

/// Main widget for the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget startPage; // Depending on the flags set by the main function, this will be LoginPage or HomePage

    if (!_rememberUser) // If there is no valid saved token
      startPage = new LoginPage();
    else // If there is one
      startPage = new HomePage(_token);
    
    // DEBUG!!!!!!!!!!!!!!!!!
    startPage = new HomePage(_token);
    // DEBUG!!!!!!!!!!!!!!!!!

    return MaterialApp( // MaterialApp wrapper
      title: 'Agora', // The title presented to the phones app navigator
      home: startPage // The main Widget to redirect to (default)
    );
  }
}