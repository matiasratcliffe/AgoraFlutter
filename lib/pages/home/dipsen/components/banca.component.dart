// Flutter requirements
import 'package:flutter/material.dart';

// Models to be used
import '../../../../models/party.model.dart';

// Pages to navigate to
import '../../../party/party.page.dart';

class DipsenBancaComponent extends StatelessWidget {

  final Party party;

  DipsenBancaComponent(this.party);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onLongPress: show party name, TODO:
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PartyPage(this.party)));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person,
            size: 30.0,
            color: this.party.color,
          ),
          Text(this.party.members.length.toString())
        ]
      )
    );
  }
}