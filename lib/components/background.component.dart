// Flutter requeriments
import 'package:flutter/material.dart';

/// Takes a list of elements, arranges them in a centered colum, and sets the selected asset as background
class BackgroundComponent extends StatefulWidget {
  
  /// String indicating the name of the asset to be set as background (as written in the pubspec.yaml file)
  final String background;

  /// The list of [Widget]s to be placed in the center of the BackgroundComponent
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

/// The State of a [BackgroundComponent]
class _BackgroundComponentState extends State<BackgroundComponent> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Material(
        child: new Container( // For the background image
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(widget.background),
              fit: BoxFit.cover
            ) // DecorationImage
          ), // BoxDecoration

          child: new Column( // To center the content (The Container below will expand to maximum size, so a Restrictive enclosing object, like this Column, prevents that)
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container( // For content border and background color
                margin: new EdgeInsets.symmetric(horizontal: 35.0), // Side space
                padding: new EdgeInsets.all(20.0), // Inwards space
                decoration: new BoxDecoration( // For content border and background color
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                  color: Color(0xffF0F0F0)
                ), // BoxDecoration
                child: new Form(
                  child: new Column( // Arrange the elements of the List passed to the constructor, vertically
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: widget._children
                  ) // Column
                ) // Form
              ) // Container
            ] // <Widget>[]
          ) // Column
        ) // Container
      ) // Material
    ); // SafeArea
  }
}