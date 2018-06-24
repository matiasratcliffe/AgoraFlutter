// Flutter requierements
import 'package:flutter/material.dart';

/// Creates a simple TabComponent app, associating each element in the [content] Map, with a Tab-Page pair, mapping the String keys of the map as buttons in the [AppBar], and the elements of the corresponding Widget List to the children of a preformatted [Column]
class TabAppComponent extends StatefulWidget {
  
  /// The Scaffold's [Drawer] widget, if any
  final Drawer drawer;

  /// A Map connecting a Tab with its Widget array
  final Map<Widget, Widget> content;

  /// Flag indicating the position of the [AppBar] - Default is Top => [false]
  final bool bottomBar;

  /// A title to show on the top bar
  final Widget title;

  TabAppComponent({@required this.content, this.drawer, this.bottomBar=false, this.title});

  @override
  _TabAppComponentState createState() => _TabAppComponentState(this.content, this.title, this.bottomBar);
}

/// The State of a [TabAppComponent]
class _TabAppComponentState extends State<TabAppComponent> with SingleTickerProviderStateMixin {

  /// The controller for the [TabBar] in case [bottomBar] is enabled
  TabController controller;

  /// The [TabBar] to be used if [bottomBar] is enabled
  Widget tabBar; // Auto-initializes to null

  /// The [AppBar] to be used if [bottomBar] is disabled
  AppBar appBar; // Auto-initializes to null

  _TabAppComponentState(Map<Widget,Widget> content, Widget titleWidget, bool bottomBar) : super() {
    controller = new TabController(length: content.length, vsync: this); // To control the tab view [never used directly, but rather passed as a binding reference to the tabs' constructors]
    tabBar = new Container( // This is the definitive bar, no matter where I choose to put it later
      padding: new EdgeInsets.symmetric(vertical: 5.0), // Distance between icons and bottom of phone
      child: TabBar( 
        indicatorPadding: new EdgeInsets.only(left: 20.0, right: 20.0, bottom: -1.0), // Reduce the indicator underline's horizontal length
        indicatorColor: Color(0xff11BBAB), // no estoy seguro de esto WIP
        controller: controller,
        tabs: content.keys.toList()
      ) // TabBar
    ); // Container

    if (!bottomBar) { // If NavBar is on top
      appBar = new AppBar(
        title: titleWidget ?? tabBar,
        bottom: titleWidget == null ? null : tabBar
      ); // AppBar
    } else { // If NavBar is on the bottom
      // If the implementer provided a widget to serve as a title, create an AppBar consisting exclusivelly of it, if not, no appbar
      if (titleWidget != null)
        appBar = new AppBar(title: titleWidget);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return new SafeArea( // Space below the phone's status bar
      child: new Scaffold(
        backgroundColor: Color(0xff11BBAB), // Theme color
        
        appBar: appBar, // If its null, it ignores it

        bottomNavigationBar: widget.bottomBar ? tabBar : null, // If not bottomBar, it ignores it (evaluates to null)
                  
        drawer: widget.drawer, // The Scaffold's [Drawer] widget, if any

        body: new TabBarView( // Regardles of the position of the tabBar, the contents wont change
          controller: controller,
          children: widget.content.values.toList()
        ) // TabBarView

      ) // Scaffold
    ); // SafeArea
  }

}