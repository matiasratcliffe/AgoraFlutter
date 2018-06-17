import 'package:flutter/material.dart';

import '../services/base.service.dart';

class TabAppComponent extends StatefulWidget {
  final Drawer drawer;
  final Map<String, List<Widget>> content;
  TabAppComponent(this.content, {this.drawer});

  @override
  _TabAppComponentState createState() => _TabAppComponentState();
}

class _TabAppComponentState extends State<TabAppComponent> {
  List<Widget> _selected;

  @override
  void initState() {
    super.initState();
    if (widget.content != null && widget.content.keys.length > 0) {
      _selected = widget.content[widget.content.keys.elementAt(0)];
      return;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: new AppBar(
          title: new Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _generateTabs(widget.content)
          )
        ),
        drawer: widget.drawer,
        body: new Container(
          color: Colors.white,
          padding: new EdgeInsets.all(20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _selected,
          ),
        )
      )
    );
  }

  List<Widget> _generateTabs(Map<String,List<Widget>>content) {
    List<Widget> buttons = new List<Widget>();
    content.forEach((key, val) {
      buttons.add(new FlatButton(
        child: new Text(key),
        onPressed: () => this.setState(() {
          BaseService.log(key);
          _selected = val != null ? val : [new Text('Null Value')];
        })
      ));
    });
    return buttons;
  }

}