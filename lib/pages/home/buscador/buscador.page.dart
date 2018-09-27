// Flutter requirements
import 'package:flutter/material.dart';

// Services
import '../../../services/base.service.dart';

/// A page to look for projects or tags
class BuscadorPage extends StatefulWidget {

  /// Unique Identifier
  final Key key;

  /// BuscadorPage constructor
  BuscadorPage({this.key});

  /// An auxiliary function to generate a global key while keeping the state class private
  static GlobalKey<_BuscadorPageState> generateGlobalKey() => new GlobalKey<_BuscadorPageState>();

  @override
  _BuscadorPageState createState() => _BuscadorPageState();
}

/// The State of a [BuscadorPage]
class _BuscadorPageState extends State<BuscadorPage> {

  // A Node to controll the focus of the TextField
  FocusNode node = FocusNode();  

  @override
  Widget build(BuildContext context) {
    BaseService.log('Building Buscador');

    return Container(
      padding: EdgeInsets.all(40.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Flexible(
                child: TextField(
                  focusNode: node,
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