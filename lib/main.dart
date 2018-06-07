import 'package:flutter/material.dart';

import 'pages/login.page.dart';
import 'pages/home.page.dart';

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

/*
class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        //set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run" to see the wireframe for each widget
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You have pushed the button this many times:',),
            new Text('$_counter',
            style: Theme.of(context).textTheme.display1)
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
*/