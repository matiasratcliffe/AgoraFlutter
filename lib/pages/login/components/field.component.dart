import 'package:flutter/material.dart';

typedef String _ValidatorFunc(String input);

class TextFieldController extends TextEditingController {
  bool invalidValue = false;
  TextFieldController() : super();

  /// Resets the field's condition
  void clearStat() {
    this.text = '';
    this.invalidValue = false;
  }
}

class FieldComponent extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final FocusNode focusNode;
  final _ValidatorFunc validator;
  final TextFieldController controller;
  FieldComponent({this.focusNode, this.validator, this.controller, this.hintText, this.obscureText=false});

  @override
  _FieldComponentState createState() => new _FieldComponentState();
}

class _FieldComponentState extends State<FieldComponent> with SingleTickerProviderStateMixin {
  AnimationController fieldAnimationController;
  Animation<double> fieldAnimation;

  @override
  void initState() {
    super.initState();
    fieldAnimationController = new AnimationController(duration: new Duration(milliseconds: 250), vsync: this);
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
      height: 61.0 * fieldAnimation.value,
      decoration: new BoxDecoration(
        boxShadow: widget.controller.invalidValue ? [new BoxShadow(color: Colors.yellow[50])] : null,
        border: new Border.all(
          color: widget.focusNode.hasFocus ? Colors.blue : (widget.controller.invalidValue ? Colors.red : Colors.black),
          width: 1.0 
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(5.0))
      ),
      child: new Column(
        children: <Widget>[
          new TextFormField(
            autocorrect: false,
            focusNode: widget.focusNode,
            obscureText: widget.obscureText,
            controller: widget.controller,
            decoration: new InputDecoration(
              hintText: widget.hintText,
              hintStyle: new TextStyle(color: Colors.grey),
              border: new OutlineInputBorder(),
            ),  // InputDecoration
            validator: widget.validator
          ) // TextField
        ] // <Widget>[]
      ) // Column
    ); // Container
  }
}