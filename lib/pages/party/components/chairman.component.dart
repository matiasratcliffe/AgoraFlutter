// Flutter requirements
import 'package:flutter/material.dart';

// Models
import '../../../models/chairman.model.dart';

// Services
//import '../../../services/base.service.dart';

// Pages to navigate to
import '../../chairman/chairman.page.dart';

class ChairmanComponent extends StatelessWidget {
  
  final Chairman chairman;

  ChairmanComponent(this.chairman);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChairmanPage(this.chairman)));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.account_circle, size: 70.0),
          Text(this.chairman.nombre,
            style: TextStyle(
              fontSize: 15.0
            ),
          )
        ],
      ),
    );
  }
}