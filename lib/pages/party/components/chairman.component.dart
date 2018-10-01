// Flutter requirements
import 'package:flutter/material.dart';

// Pages to navigate to
import '../../chairman/chairman.page.dart';

class ChairmanComponent extends StatelessWidget {
  
  final String nombre;

  ChairmanComponent(this.nombre);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChairmanPage(nombre)));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.account_circle, size: 70.0),
          Text(nombre,
            style: TextStyle(
              fontSize: 15.0
            ),
          )
        ],
      ),
    );
  }
}