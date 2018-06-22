// Flutter requirements
import 'package:flutter/material.dart';

// General components to be used
import '../../components/tabapp.component.dart';

/// General tab-like page to be displayed after successful login
class HomePage extends StatefulWidget {
  
  /// The session token to authenthicate further http requests
  final String token;
  
  HomePage(this.token);

  @override
  _HomePageState createState() => new _HomePageState();
}

/// The State of a [HomePage]
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
          onPressed: () {}
        )
      ],

      'Hot': [],

      'Buscar': []
    },
    // Drawer mit tags
    drawer: null
    ); // TabAppComponent
  }
}
