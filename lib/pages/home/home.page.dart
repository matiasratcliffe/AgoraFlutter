// Flutter requirements
import 'package:flutter/material.dart';

// Services
import '../../services/base.service.dart';

// General components to be used
import '../../components/tabapp.component.dart';

// Sub pages to be used
import './buscador/buscador.page.dart';
import './trending/trending.page.dart';
import './profile/profile.page.dart';
import './dipsen/dipsen.page.dart';
import './feed/feed.page.dart';
import './tags/tags.page.dart';

/// General tab-like page to be displayed after successful login
class HomePage extends StatefulWidget {
  
  /// The session token to authenthicate further http requests
  final String token;
  
  HomePage(this.token) {
    BaseService.log('HomePage constructor called');
  }

  @override
  _HomePageState createState() => new _HomePageState();
}

/// The State of a [HomePage]
class _HomePageState extends State<HomePage> {

  /// The size of the icons in the navbar
  static double iconSize = 40.0;
  
  /// Unique Identifier for later Widget handling
  static var tabAppKey = TabAppComponent.generateGlobalKey();

  /// The TabBar to be used as HomePage
  TabAppComponent appComponent;

  _HomePageState() {
    appComponent = TabAppComponent(
      // Unique Identifier for later Widget handling
      key: tabAppKey,
      // Sets the flag to move the navbar to the bottom
      bottomBar: true,
      // [Profile] Manage profiledata, tags, logout
      drawer: Drawer(
        child: new ProfilePage()
      ), // Drawer
      // The different tabs
      content: {
        // [Dipsen] Shows the setup of the parliament
        new Icon(Icons.account_balance, size: iconSize): new DipsenPage(), 
        // [Tags] New projects that have one of your suscribed tags  
        new Icon(Icons.tags, size: iconSize): new TagsPage(),
        // [Feed] New projects, suscribed projects updates, filter by...
        new Icon(Icons.cabinet, size: iconSize): new FeedPage(),
        // [Trending] Approved/rejected history, and popular projects
        new Icon(Icons.star, size: iconSize): new TrendingPage(),
        // [Buscador] Buscar proyectos por tag/titulo/numero
        new Icon(Icons.search, size: iconSize): new BuscadorPage(),
      }
    ); // TabAppComponent
   
    appComponent.addListener(() { // Will execute everytime the user slides between tabs
      BaseService.log('Switched to tab: [' + tabAppKey.currentState.controller.index.toString() + ']');
      if (tabAppKey.currentState.controller.index != 4) {
        //TODO:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    BaseService.log('Building HomePage');

    return appComponent;
  }
}
