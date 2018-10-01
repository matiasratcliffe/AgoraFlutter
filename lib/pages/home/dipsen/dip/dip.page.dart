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
    return DipsenBancaComponent();
  }

  @override
  Widget build(BuildContext context) {
    return BaseService.materialWrap(
      child: Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0, top: 40.0),
        decoration: BoxDecoration(
          color: Colors.white 
        ), // BoxDecoration
        child: Column(
          children: <Widget>[
            Text('Diputados'),
            DipsenGraphComponent(),
            generateBancasGrid()
          ],
        )
      )
    );
  }
}