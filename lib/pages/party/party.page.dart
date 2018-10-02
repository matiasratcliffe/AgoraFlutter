// Flutter requirements
import 'package:flutter/material.dart';

// Components to be used
import './components/chairman.component.dart';

// Models
import '../../models/party.model.dart';
import '../../models/chairman.model.dart';

// Services
import '../../services/base.service.dart';

/// Displays the members of the specified party
class PartyPage extends StatelessWidget {

  final Party party;
  
  PartyPage(this.party) {
    BaseService.log('PartyPage constructor called');
  }

  Widget generatePartyMembers() {
    Chairman chairman = Chairman({'id':'1','nombre':'Sergio'}, this.party);
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: <Widget>[
          ChairmanComponent(chairman), ChairmanComponent(chairman), ChairmanComponent(chairman),
          ChairmanComponent(chairman), ChairmanComponent(chairman)
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseService.materialWrap(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(this.party.nombre,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              )
            ),
            generatePartyMembers()
          ],
        ),
      )
    );
  }
}