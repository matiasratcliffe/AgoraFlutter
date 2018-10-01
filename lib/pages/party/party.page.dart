// Flutter requirements
import 'package:flutter/material.dart';

// Components to be used
import './components/chairman.component.dart';

// Services
import '../../services/base.service.dart';

/// Displays the members of the specified party
class PartyPage extends StatelessWidget {
  
  PartyPage();

  Widget generatePartyMembers() {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: <Widget>[
          ChairmanComponent('Adolf'), ChairmanComponent('Rudolf'), ChairmanComponent('Martin'),
          ChairmanComponent('Heinrich'), ChairmanComponent('Hermann'), ChairmanComponent('Joseph'),
          ChairmanComponent('Erich'), ChairmanComponent('Erwin')
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
            Text('Partido Nacional Socialista Obrero Argentino',
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