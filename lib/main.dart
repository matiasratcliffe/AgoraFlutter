import 'dart:io';
import 'package:flutter/material.dart';

import './pages/login/login.page.dart';
import './pages/home/home.page.dart';

import './services/base.service.dart';

void main() => runApp(new MyApp());

String _token = '';

class MyApp extends StatelessWidget {

  _rememberPass() {
    try {
      if (FileSystemEntity.isFileSync('remembertoken')) {
        File file = new File('remembertoken');
        
      }
      File file = new File('remembertoken');
      file.writeAsStringSync('contents');
    } catch(e) {
      BaseService.log(e);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Widget homePage;

    if (_rememberPass())
      homePage = new LoginPage();
    else
      homePage = new HomePage(_token);
    
    return new MaterialApp(
      title: 'Agora',
      home: homePage
    );
  }
}