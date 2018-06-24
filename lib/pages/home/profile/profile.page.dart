// Flutter requirements
import 'package:flutter/material.dart';

/// Check your data and adjust settings
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

/// The State of a [ProfilePage]
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Text('data')
        ],
      ),
    );
  }
}