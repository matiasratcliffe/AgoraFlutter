// Flutter requirements
import 'package:flutter/material.dart';

// Pages to navigate to
import '../../../party/party.page.dart';

class DipsenBancaComponent extends StatelessWidget {

  final Color color;

  final int cantidad;

  DipsenBancaComponent([this.color=Colors.black, this.cantidad=0]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onLongPress: show party name, TODO:
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PartyPage()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person,
            size: 30.0,
            color: this.color,
          ),
          Text(this.cantidad.toString())
        ]
      )
    );
  }
}