// Flutter requirements
import 'package:flutter/material.dart';

/// A page to look for projects or tags
class BuscadorPage extends StatefulWidget {
  @override
  _BuscadorPageState createState() => _BuscadorPageState();
}

/// The State of a [BuscadorPage]
class _BuscadorPageState extends State<BuscadorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Flexible(
                child: TextField(
                  autofocus: true,
                  autocorrect: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(5.0))
                    )
                  ),
                )
              ),
              new Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(5.0))
                ),
                child: IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 39.0,
                  onPressed: (){},
                )
              )
            ]
          )
        ],
      ),
    );
  }
}