import 'dart:io';
import 'package:flutter/material.dart';

import './pages/login/login.page.dart';
import './pages/home/home.page.dart';

import './services/base.service.dart';

bool _rememberUser = false;
String _token = '';

void main() async {
  String filePath = (await BaseService.appDir).uri.path + 'remembertoken';
  if (FileSystemEntity.isFileSync(filePath)) {
    File remembertoken = new File(filePath);
    _token = remembertoken.readAsStringSync();
    BaseService.log('Token Found: ' + _token);
    //check mit server if token is valid
    {
      BaseService.log('Token seems valid!');
      //_rememberUser = true;
    }
  } else {
    BaseService.log('No token found!');
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