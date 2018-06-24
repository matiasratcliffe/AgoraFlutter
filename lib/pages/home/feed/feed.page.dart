// Flutter requirements
import 'package:flutter/material.dart';

/// Updates on suscribed projects
class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

/// The State of a [FeedPage]
class _FeedPageState extends State<FeedPage> {
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