// Flutter requirements
import 'package:flutter/material.dart';

// Models
import '../../models/project.model.dart';

// Local components to be used
import './components/votingscheme.component.dart';
import './components/projectstate.component.dart';

/// A Page to present a full project
class ProjectPage extends StatefulWidget {

  final Project project;

  ProjectPage(this.project);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

/// The State of a [ProjectPage]
class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea( // Avoids the status bar area
      child: Material( // Material default theme
        child: Container( // General padding, and background
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
          child: Column( // Vertical element disposicion
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spread elements vertically
            children: <Widget>[
              // Title
              new Text(widget.project.nombre,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff11BBAB), // Ocean Blue
                ), // TextStyle
              ), // Text

              // Summary of project
              new Container( // Border, padding, margin
                margin: EdgeInsets.only(top: 25.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2.0)),
                child: Text(widget.project.description,
                  textAlign: TextAlign.justify,
                ) // Text
              ), // Container

              // A wrapper for the voting machanism
              new VotingSchemeComponent(widget.project),
              
              // A wrapper to present the state graph of a [Project]
              new ProjectStateComponent(widget.project)
            ], // <Widget>[]
          ), // Column
        ) // Container
      ) // Material
    ); // SafeArea
  }
}