import 'package:flutter/material.dart';

class FieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  FieldComponent({this.controller, this.hintText, this.obscureText=false});

  @override
  _FieldComponentState createState() => new _FieldComponentState();
}

class _FieldComponentState extends State<FieldComponent> with SingleTickerProviderStateMixin {
  AnimationController fieldAnimationController;
  Animation<double> fieldAnimation;

  @override
  void initState() {
    super.initState();
    fieldAnimationController = new AnimationController(duration: new Duration(milliseconds: 200), vsync: this);
    fieldAnimation = new CurvedAnimation(parent: fieldAnimationController, curve: Curves.easeIn);
    fieldAnimation.addListener(() => this.setState((){}));
    fieldAnimationController.forward();
  }

  @override
  void dispose() {
    fieldAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 60.0, // * fieldAnimation.value,
      child: new Column(
        children: <Widget>[
          new TextField(
            obscureText: widget.obscureText,
            controller: widget.controller,
            decoration: new InputDecoration(
              hintText: widget.hintText,
              hintStyle: new TextStyle(color: Colors.grey),
              border: new OutlineInputBorder(),
            )  // InputDecoration
          ) // TextField
        ] // <Widget>[]
      ) // Column
    );
  }
}