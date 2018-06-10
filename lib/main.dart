import 'package:flutter/material.dart';

import 'pages/login/login.page.dart';
import 'pages/home/home.page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget homePage;

    if (true == true)
      homePage = new LoginPage();
    else
      homePage = new HomePage();
    
    return new MaterialApp(
      title: 'Agora',
      home: homePage
    );
  }
}