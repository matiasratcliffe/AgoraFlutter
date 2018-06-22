// Flutter requierements
import 'package:flutter/material.dart';

// Services
import '../services/base.service.dart';

/// Creates a simple TabComponent app, associating each element in the [content] Map, with a Tab-Page pair, mapping the String keys of the map as buttons in the [AppBar], and the elements of the corresponding Widget List to the children of a preformatted [Column]
class TabAppComponent extends StatefulWidget {
  
  /// The Scaffold's [Drawer] widget, if any
  final Drawer drawer;

  /// A Map connecting a Tab's name with its Widget array
  final Map<String, List<Widget>> content;

  TabAppComponent(this.content, {this.drawer});

  @override
  _TabAppComponentState createState() => _TabAppComponentState();
}

/// The State of a [TabAppComponent]
class _TabAppComponentState extends State<TabAppComponent> {

  /// The currently selected tab's [Widget] array
  List<Widget> _selected;

  @override
  void initState() {
    super.initState();
    // Setting a default tab to show
    if (widget.content != null && widget.content.keys.length > 0) {
      _selected = widget.content[widget.content.keys.elementAt(0)];
      return;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return new SafeArea( // Space below the phone's status bar
      child: new Scaffold(
        backgroundColor: Colors.blueAccent,
        
        appBar: new AppBar(
          title: new Row( // Display tab titles horizontally
            mainAxisSize: MainAxisSize.max, // Expand to ocupy all tab-bar
            crossAxisAlignment: CrossAxisAlignment.stretch, // Expand vertically
            children: _generateTabs(widget.content) // Generate the tabs from the [content] map
          ) // Row
        ), // AppBar
        
        drawer: widget.drawer, // The Scaffold's [Drawer] widget, if any

        body: new Container(
          color: Colors.white, // Background color
          padding: new EdgeInsets.all(20.0), // Padding for the content of each tab
          child: new Column( // Arange the Widget list of of each tab of the content map, vertically
            crossAxisAlignment: CrossAxisAlignment.stretch, // Expand 
            children: _selected, // Show only the contents of the selected tab at a given state
          ) // Column
        ) // Container
      ) // Scaffold
    ); // SafeArea
  }

  /// Takes a String-WidgetList Map and generates the necesary tabs, binding the [_selected] attribute to the List of the selected tab
  List<Widget> _generateTabs(Map<String,List<Widget>> content) {
    // List of buttons (these are the tabs)
    List<Widget> buttons = new List<Widget>();
    content.forEach((key, val) {
      buttons.add(new FlatButton(
        child: new Text(key), // Set the name of the tab as the buttons text
        onPressed: () => this.setState(() { // Runs every time a tab is selected
          BaseService.log(key); // Log the name of the selected tab
          _selected = val != null ? val : [new Text('Null Value')]; // Sets the _selected attribut accordingly (if not null, to avoid errors)
        }) // onPressed
      )); // FlatButton
    }); // forEach

    return buttons;
  }

}