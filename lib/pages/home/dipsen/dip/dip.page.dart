// Flutter requirements
import 'package:flutter/material.dart';

// Services
import '../../../../services/base.service.dart';

// Local components to be used
import '../components/graphic.component.dart';
import '../components/banca.component.dart';

/// The Page of Diputados
class DipPage extends StatefulWidget {
  @override
  _DipPageState createState() => _DipPageState();
}

/// The state of DipPage
class _DipPageState extends State<DipPage> {

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
      Text('Diputados',style: TextStyle(fontSize: 30.0)),
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