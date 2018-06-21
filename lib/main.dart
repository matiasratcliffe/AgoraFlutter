import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

import './pages/login/login.page.dart';
import './pages/home/home.page.dart';

import './services/base.service.dart';
import './services/http.service.dart';

bool _rememberUser = false;
String _token = '';

void main() async {
  try {
    String filePath = (await BaseService.appDir).uri.path + 'remembertoken';
    if (FileSystemEntity.isFileSync(filePath)) {
      File remembertoken = new File(filePath);
      String fileContents = remembertoken.readAsStringSync();
      String email = jsonDecode(fileContents);
      _token = jsonDecode(fileContents);
      BaseService.log('Token Found: ' + _token);
      if ((await HttpService.post({'email': email, 'token': _token}, url: '')).statusCode == 200) {
        BaseService.log('Token seems valid!');
        _rememberUser = true;
      }
    } else {
      BaseService.log('No token found!');
    }
  } catch (e) {
    BaseService.log('Error retrieving token: ${e.toString()}');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget homePage;

    if (!_rememberUser)
      homePage = new LoginPage();
    else
      homePage = new HomePage(_token);
    
    return new MaterialApp(
      title: 'Agora',
      home: homePage
    );
  }
}