// Flutter requirements
import 'package:flutter/material.dart';

class DipsenBancaComponent extends StatelessWidget {

  final Color color;

  final int cantidad;

  DipsenBancaComponent([this.color=Colors.black, this.cantidad=0]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onLongPress: show party name,
      //onTap: navigate to party page,
      child: Container(
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
      )
    );
  }
}