// Flutter requirements
import 'package:flutter/material.dart';

// Local components to be used
import './components/votingscheme.component.dart';
import './components/projectstate.component.dart';

// Services
//import '../../services/base.service.dart';

/// A Page to present a full project
class ProjectPage extends StatefulWidget {
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
              new Text('Ley para la prevencion...',
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
                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquid commodi consequat. Quis voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  textAlign: TextAlign.justify,
                ) // Text
              ), // Container

              // A wrapper for the voting machanism
              new VotingSchemeComponent(),
              
              // A wrapper to present the state graph of a [Project]
              new ProjectStateComponent()
            ], // <Widget>[]
          ), // Column
        ) // Container
      ) // Material
    ); // SafeArea
  }
}