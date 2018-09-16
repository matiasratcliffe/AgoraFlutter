// Flutter requirements
import 'package:flutter/material.dart';

/// A wrapper to present the state graph of a [Project]
class ProjectStateComponent extends StatefulWidget {
  @override
  _ProjectStateComponentState createState() => _ProjectStateComponentState();
}

/// The State of a [ProjectStateComponent]
class _ProjectStateComponentState extends State<ProjectStateComponent> {
  
  Widget builder;

  _ProjectStateComponentState() {
    builder = new Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.black)
      ),
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Center(
            child: Text('Grafico',
              style: TextStyle(
                fontSize: 50.0
              ),
            )
          )
        ]
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return builder;
  }
}