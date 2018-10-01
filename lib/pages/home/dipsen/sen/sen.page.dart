// Flutter requirements
import 'package:flutter/material.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 5,
        children: [
          DipsenBancaComponent(Colors.yellow,4), DipsenBancaComponent(Colors.purple,3), DipsenBancaComponent(Colors.blue,2),
          DipsenBancaComponent(Colors.red,4), DipsenBancaComponent(Colors.green,7), DipsenBancaComponent(Colors.cyan,5)
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