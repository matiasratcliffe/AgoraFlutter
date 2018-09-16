// Flutter requirements
import 'package:flutter/material.dart';

// Local components to be used
import '../components/projecttag.component.dart';

/// Updates on suscribed projects
class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

/// The State of a [TrendingPage]
class _TrendingPageState extends State<TrendingPage> {

  /// A flag indicating in which of the two sections of the feed page we currently are
  bool onHistory = false;

  /// A [Widget] buffer containing all the projects to be displayed depending on the current feed-section
  List<Widget> projectList=[];

  @override
  void initState() {
    super.initState();
    this.showTrending();
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
                onTap: this.showTrending,
                child: Text('Tendencia',
                  style: TextStyle(
                    color: Color(0xff11BBAB),
                    decoration: !onHistory ? TextDecoration.underline : TextDecoration.none,
                    fontSize: 25.0
                  )
                )
              ),
              new GestureDetector(
                onTap: this.showHistory,
                child: Text('Historico',
                  style: TextStyle(
                    color: Color(0xff11BBAB),
                    decoration: onHistory? TextDecoration.underline : TextDecoration.none,
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

  void showTrending() async {
    this.onHistory = false;
    this.projectList = [
      new ProjectTagComponent(),
      new ProjectTagComponent(),
      new ProjectTagComponent(),
      new ProjectTagComponent(),
      new ProjectTagComponent(),
    ];
    this.setState((){});
  }

  void showHistory() async {
    this.onHistory = true;
    this.projectList = [
      new ProjectTagComponent(),
      new ProjectTagComponent(),
      new ProjectTagComponent(),
      new ProjectTagComponent(),
      new ProjectTagComponent(),
    ];
    this.setState((){});
  }

}