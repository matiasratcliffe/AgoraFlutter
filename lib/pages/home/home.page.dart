// Flutter requirements
import 'package:flutter/material.dart';

// General components to be used
import '../../components/tabapp.component.dart';

// Sub pages to be used
import './buscador/buscador.page.dart';
import './trending/trending.page.dart';
import './profile/profile.page.dart';
import './feed/feed.page.dart';
import './tags/tags.page.dart';

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
    double iconSize = 40.0;
    
    return new TabAppComponent(
      bottomBar: true,
      content: {
        // [Profile] Manage profiledata, tags, logout
        new Icon(Icons.person, size: iconSize): new ProfilePage(),

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
  }
}
