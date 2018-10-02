// Flutter requirements
import 'package:flutter/material.dart';

// App Configuration standards
import '../../../models/appconfig.model.dart';

// Models
import '../../../models/project.model.dart';

// Local components to be used
import '../components/projecttag.component.dart';

/// Updates on suscribed projects
class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

/// The State of a [FeedPage]
class _FeedPageState extends State<FeedPage> {

  /// A flag indicating in which of the two sections of the feed page we currently are
  bool onFinished = false;

  /// A [Widget] buffer containing all the projects to be displayed depending on the current feed-section
  List<Widget> projectList=[];

  @override
  void initState() {
    super.initState();
    this.showProjects();
  }

  @override
  Widget build(BuildContext context) {    
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 15.0, bottom: 10.0, top: 40.0),
      decoration: BoxDecoration(
        color: Colors.white
      ), // BoxDecoration
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new GestureDetector(
                onTap: this.showProjects,
                child: Text('En Proceso',
                  style: TextStyle(
                    color: AppConfig.mainColor,
                    decoration: !onFinished ? TextDecoration.underline : TextDecoration.none,
                    fontSize: 25.0
                  )
                )
              ),
              new GestureDetector(
                onTap: this.showFinished,
                child: Text('Finalizados',
                  style: TextStyle(
                    color: AppConfig.mainColor,
                    decoration: onFinished ? TextDecoration.underline : TextDecoration.none,
                    fontSize: 25.0
                  )
                )
              )
            ]
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: projectList      
            )
          )
        ],
      ),
    );
  }

  void showProjects() async {
    this.onFinished = false;
    Project project = Project({'id':'1','favor':'17','against':'8','subscribers':'30','nombre':'Das Projekt','description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquid commodi consequat. Quis voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'});
    this.projectList = [
      new ProjectTagComponent(project),
      new ProjectTagComponent(project),
      new ProjectTagComponent(project),
      new ProjectTagComponent(project),
      new ProjectTagComponent(project),
    ];
    this.setState((){});
  }

  void showFinished() async {
    this.onFinished = true;
    Project project = Project({'id':'1','favor':'17','against':'8','subscribers':'30','nombre':'Das Projekt','description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquid commodi consequat. Quis voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'});
    this.projectList = [
      new ProjectTagComponent(project),
      new ProjectTagComponent(project),
      new ProjectTagComponent(project),
      new ProjectTagComponent(project),
      new ProjectTagComponent(project),
    ];
    this.setState((){});
  }

}