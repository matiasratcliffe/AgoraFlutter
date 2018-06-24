// Flutter requirements
import 'package:flutter/material.dart';

// Services
import '../../../services/base.service.dart';

/// Check your data and adjust settings
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

/// The State of a [ProfilePage]
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 15.0, bottom: 10.0, top: 40.0),
      decoration: BoxDecoration(
        color: Colors.white 
      ), // BoxDecoration
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Center(
            child: Icon(
              Icons.account_circle,
              color: Color(0xff11BBAB),
              size: 200.0
            ) // Icon
          ), // Center
          new Center(
            child: Text('JUAN PEREZ\n   40 299343', 
              style: TextStyle(
                color: Color(0xff11BBAB),
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),
            ),
          ),
         
          new Container(
            margin: EdgeInsets.symmetric(vertical: 50.0),
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: new Column(
              children: <Widget>[
                new Align(alignment: Alignment.centerLeft, child: Text('Proyectos votados: 17', style: TextStyle(fontSize: 20.0, ))),
                new Padding(padding: EdgeInsets.all(4.0)),
                new Align(alignment: Alignment.centerLeft, child: Text('A favor: 10', style: TextStyle(fontSize: 20.0))),
                new Padding(padding: EdgeInsets.all(4.0)),
                new Align(alignment: Alignment.centerLeft, child: Text('En contra: 7', style: TextStyle(fontSize: 20.0))),
                new Padding(padding: EdgeInsets.all(4.0)),
                new Align(alignment: Alignment.centerLeft, child: Text('Finalizados: 13', style: TextStyle(fontSize: 20.0))),
              ]
            )
          ),
          new Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              child: IconButton(
                iconSize: 35.0,
                color: Color(0xff11BBAB),
                icon: Icon(Icons.settings),
                onPressed: () {
                  BaseService.dialogAsk(context, 'Que opinas?', 'A Magui le gusta la pija?');
                },
              ) // IconButton
            ) // InkWell
          ) // Align
        ] // <Widget>[]
      ) // Column
    ); // Container
  }
}