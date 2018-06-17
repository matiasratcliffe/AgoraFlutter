import 'package:flutter/material.dart';

class BackgroundComponent extends StatefulWidget {
  final String background;
  final List<Widget> _children = new List<Widget>();
  BackgroundComponent({this.background, List<Widget> children}) {
    children.forEach((element) {
      this._children.add(new Padding(padding: new EdgeInsets.all(5.0)));
      this._children.add(element);
    });
  }

  @override
  _BackgroundComponentState createState() => new _BackgroundComponentState();
}

class _BackgroundComponentState extends State<BackgroundComponent> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Material(
        child: new Container( // For the background
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(widget.background),
              fit: BoxFit.cover
            ) // DecorationImage
          ), // BoxDecoration
          child: new Column( // To center content (Container expands to maximum size)
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container( // For content border and background
                margin: new EdgeInsets.symmetric(horizontal: 35.0),
                padding: new EdgeInsets.all(20.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                  color: Color(0xffF0F0F0)
                ), // BoxDecoration
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: widget._children
                ) // Column
              ) // Container
            ] // <Widget>[]
          ) // Column
        ) // Container
      ) // Material
    ); // SafeArea
  }
}