// Flutter requirements
import 'package:flutter/material.dart';

// Services
import '../../../services/base.service.dart';

// Sub pages to be used
import './dip/dip.page.dart';
import './sen/sen.page.dart';

/// Shows the setup of the parliament
class DipsenPage extends StatefulWidget {
  @override
  _DipsenPageState createState() => _DipsenPageState();
}

/// The State of a [DipsenPage]
class _DipsenPageState extends State<DipsenPage> {

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {    
    return Container(
      padding: EdgeInsets.only(left: 60.0, right: 60.0, bottom: 95.0, top: 90.0),
      decoration: BoxDecoration(
        color: Colors.white 
      ), // BoxDecoration
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              onPressed:() {
                BaseService.log('Going to Diputados');
                Navigator.push(context, MaterialPageRoute(builder: (context) => DipPage()));
              },
              child: Text('Diputados',
                style: TextStyle(
                  fontSize: 30.0
                ),
              )
            )
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
          Expanded(
            child: RaisedButton(
              onPressed:() {
                BaseService.log('Going to Senadores');
                Navigator.push(context, MaterialPageRoute(builder: (context) => SenPage()));
              },
              child: Text('Senadores',
                style: TextStyle(
                  fontSize: 30.0
                ),
              )
            )
          )
        ] // <Widget>[]
      ) // Column
    ); // Container
  }

}