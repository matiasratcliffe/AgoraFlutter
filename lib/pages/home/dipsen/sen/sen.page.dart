// Flutter requirements
import 'package:flutter/material.dart';

// Models
import '../../../../models/party.model.dart';

// Services
import '../../../../services/base.service.dart';

// Local components to be used
import '../components/graphic.component.dart';
import '../components/banca.component.dart';

/// Senators Page
class SenPage extends StatefulWidget {
  @override
  _SenPageState createState() => _SenPageState();
}

/// The state of SenPage 
class _SenPageState extends State<SenPage> {

  Widget generateBancasGrid() {
    var name = 'Partido Obrero';
    var mapa = [
      {'id':'1', 'nombre':'Sergio'},
      {'id':'1', 'nombre':'Sergio'},
      {'id':'1', 'nombre':'Sergio'},
      {'id':'1', 'nombre':'Sergio'},
      {'id':'1', 'nombre':'Sergio'},
      {'id':'1', 'nombre':'Sergio'},
    ];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 5,
        children: [
          DipsenBancaComponent(Party(name, 'yellow', mapa)), DipsenBancaComponent(Party(name, 'green', mapa)), DipsenBancaComponent(Party(name, 'cyan', mapa)), DipsenBancaComponent(Party(name, 'blue', mapa))
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Text('Senadores',style: TextStyle(fontSize: 30.0)),
      DipsenGraphComponent(),
      generateBancasGrid()
    ];
    
    return BaseService.materialWrap(
      child: Container(
        padding: EdgeInsets.only(left: 35.0, right: 35.0, bottom: 80.0, top: 80.0),
        decoration: BoxDecoration(
          color: Colors.white 
        ), // BoxDecoration
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children
        )
      )
    );
  }
}