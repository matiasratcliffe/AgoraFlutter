// Flutter requierements
import 'package:flutter/material.dart';

// Services
import '../services/base.service.dart';

/// Creates a simple TabComponent app, associating each element in the [content] Map, with a Tab-Page pair, mapping the Widget keys of the map as buttons in the [AppBar], and the elements of the corresponding Widget List to the children of a preformatted [Column]
class TabAppComponent extends StatefulWidget {

  /// The Scaffold's [Drawer] widget, if any
  final Drawer drawer;

  /// A Map connecting a Tab with its Widget array
  final Map<Widget, Widget> content;

  /// Flag indicating the position of the [AppBar] - Default is Top => [false]
  final bool bottomBar;

  /// A title to show on the top bar
  final Widget title;

  /// Unique Identifier
  final GlobalKey<_TabAppComponentState> key;

  /// A secret stack to accumulate al the callback listeners that are set before the state is ready
  final List<VoidCallback> _callbackStack = List<VoidCallback>();

  /// TabAppComponent constructor
  TabAppComponent({@required this.content, this.drawer, this.bottomBar=false, this.title, this.key}) {
    BaseService.log('TabAppComponent constructor called');
  }

  /// An auxiliary function to generate a global key while keeping the state class private
  static GlobalKey<_TabAppComponentState> generateGlobalKey() => new GlobalKey<_TabAppComponentState>();

  @override
  _TabAppComponentState createState() => _TabAppComponentState(this.content, this.title, this.bottomBar);

  /// Adds callback to execute everytime the user slides between tabs
  void addListener(VoidCallback listener) { // If the state is not ready, it pushes the listener to a stack, and it is going to get added once the state is ready. If the state is ready, it just gets added. This behaviour is unknown for the outside of the class.
    if (key.currentState == null) {
      _callbackStack.add(listener);
      BaseService.log('Added a listener to the callbackStack');
    } else {
      key.currentState.controller.addListener(listener);
      BaseService.log('Added a listener to the TabAppController');
    }
  }

}

/// The State of a [TabAppComponent]
class _TabAppComponentState extends State<TabAppComponent> with SingleTickerProviderStateMixin {

  /// The controller for the [TabBar]
  TabController controller;

  /// The [TabBar] to be used if [bottomBar] is enabled
  Widget tabBar; // Auto-initializes to null

  /// The [AppBar] to be used if [bottomBar] is disabled
  AppBar appBar; // Auto-initializes to null
    
  _TabAppComponentState(Map<Widget,Widget> content, Widget titleWidget, bool bottomBar) : super() {
    BaseService.log('TabAppComponentState constructor called');
    
    controller = new TabController(length: content.length, vsync: this); // To control the tab view [never used directly, but rather passed as a binding reference to the tabs' constructors]

    tabBar = new Container( // This is the definitive bar, no matter where I choose to put it later
      padding: EdgeInsets.symmetric(vertical: 5.0), // Distance between icons and bottom of phone
      child: TabBar( 
        indicatorPadding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: -1.0), // Reduce the indicator underline's horizontal length
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
    BaseService.log('Building TabAppComponent'); // Debug message

    // Empty the callbackStack into the controller
    while(widget._callbackStack.length > 0) {
      controller.addListener(widget._callbackStack[0]);
      widget._callbackStack.removeAt(0);
    }

    return SafeArea( // Space below the phone's status bar
      child: Scaffold(          
        appBar: appBar, // If its null, it ignores it

        bottomNavigationBar: widget.bottomBar ? tabBar : null, // If not bottomBar, it ignores it (evaluates to null)
                  
        drawer: widget.drawer, // The Scaffold's [Drawer] widget, if any

        body: TabBarView( // Regardles of the position of the tabBar, the contents wont change
          controller: controller,
          children: widget.content.values.toList() // Gets the values of the Map passed to the constructor of TabAppComponent, and casts them into a list
        ) // TabBarView
      ) // Scaffold
    ); // SafeArea
  }

}