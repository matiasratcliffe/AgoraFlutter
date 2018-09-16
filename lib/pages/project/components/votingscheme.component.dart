// Flutter requirements
import 'package:flutter/material.dart';

// Services
import '../../../services/base.service.dart';

/// A wrapper for the voting machanism
class VotingSchemeComponent extends StatefulWidget {
  @override
  _VotingSchemeComponentState createState() => _VotingSchemeComponentState();
}

/// The State of a [VotingSchemeComponent]
class _VotingSchemeComponentState extends State<VotingSchemeComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Column( // Separate data from buttons vertically
        children: <Widget>[
          // Data
          new Text('Votos: 12.678 Subs:14.215',
            style: TextStyle(
              fontSize: 15.0
            ), // TextStyle
          ), // Text
          new Padding(padding: EdgeInsets.all(10.0)), // Separating padding
          
          // Voting Buttons
          new Row( // Arrange them horizontally
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Favor
              new IconButton(
                icon: Icon(Icons.thumb_up),
                color: Color(0xff11BBAB),
                iconSize: 40.0,
                onPressed: () => BaseService.alert(context, 'Titulo','El Mensaje para el usuario'),
              ), // IconButton

              // Against
              new IconButton(
                icon: Icon(Icons.thumb_down),
                color: Color(0xff11BBAB),
                iconSize: 40.0,
                onPressed: (){},
              ) // IconButton
            ], // <Widget>[]
          ) // Row
        ] // <Widget>[]
      ) // Column
    ); // Container
  }
}