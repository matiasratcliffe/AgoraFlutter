// Flutter requirements
import 'package:flutter/material.dart';

// App Configuration standards
import '../../../models/appconfig.model.dart';

// Models
import '../../../models/project.model.dart';

// Services
import '../../../services/base.service.dart';

/// A wrapper for the voting machanism
class VotingSchemeComponent extends StatefulWidget {

  final Project project;

  VotingSchemeComponent(this.project);

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
          new Text('Votos: ${widget.project.favor + widget.project.against} Subs:${widget.project.subscribers}',
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
                color: AppConfig.mainColor,
                iconSize: 40.0,
                onPressed: () => BaseService.alert(context, 'Titulo','El Mensaje para el usuario'),
              ), // IconButton

              // Against
              new IconButton(
                icon: Icon(Icons.thumb_down),
                color: AppConfig.mainColor,
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