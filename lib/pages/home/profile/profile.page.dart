// Flutter requirements
import 'package:flutter/material.dart';

// App Configuration standards
import '../../../models/appconfig.model.dart';

// Services
import '../../../services/base.service.dart';

// Models to be used
import '../../../models/user.model.dart';

/// Check your data and adjust settings
class ProfilePage extends StatefulWidget {

  final User user;

  ProfilePage(this.user);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

/// The State of a [ProfilePage]
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        
      ),
      child: Container(
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
                size: 200.0
              ) // Icon
            ), // Center
            new Center(
              child: Text(widget.user.nombre, 
                style: TextStyle(
                  color: AppConfig.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                )
              )
            ),
            new Center(
              child: Text(widget.user.dni.toString(), 
                style: TextStyle(
                  color: AppConfig.mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                )
              )
            ),
          
            new Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: new Column(
                children: <Widget>[
                  new Align(alignment: Alignment.centerLeft, child: Text('Proyectos votados: ${widget.user.count.favor + widget.user.count.contra}', style: TextStyle(fontSize: 20.0))),
                  new Padding(padding: EdgeInsets.all(4.0)),
                  new Align(alignment: Alignment.centerLeft, child: Text('A favor: ${widget.user.count.favor}', style: TextStyle(fontSize: 20.0))),
                  new Padding(padding: EdgeInsets.all(4.0)),
                  new Align(alignment: Alignment.centerLeft, child: Text('En contra: ${widget.user.count.contra}', style: TextStyle(fontSize: 20.0))),
                  new Padding(padding: EdgeInsets.all(4.0)),
                  new Align(alignment: Alignment.centerLeft, child: Text('Subscriptos: ${widget.user.count.subscriptos}', style: TextStyle(fontSize: 20.0))),
                  new Padding(padding: EdgeInsets.all(4.0)),
                  new Align(alignment: Alignment.centerLeft, child: Text('Finalizados: ${widget.user.count.terminados}', style: TextStyle(fontSize: 20.0))),
                ]
              )
            ),
            new Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: IconButton(
                  iconSize: 35.0,
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    BaseService.dialogAsk(context, 'Que opinas?', 'Sos gay?');
                  },
                ) // IconButton
              ) // InkWell
            ) // Align
          ] // <Widget>[]
        ) // Column
      ) // Container
    ); // Theme
  }
}