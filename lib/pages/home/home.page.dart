import 'package:flutter/material.dart';

import '../../services/base.service.dart';
import '../../components/tabapp.component.dart';

class HomePage extends StatefulWidget {
  final String token;
  HomePage(this.token);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {  
  @override
  Widget build(BuildContext context) {
    return new TabAppComponent({
      // Manage profiledata, tags, logout
      'Profile': [
        Text('khkhk')
      ],

      // New projects, suscribed projects updates, filter by...
      'Feed': [
        RaisedButton(
          child: Text('Button'),
          onPressed: () {},
        )
      ]
    },
    // Drawer mit tags
    drawer: null
    );
  }
}
