import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {
  final bool disabled;
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  ButtonComponent({this.disabled=false, this.child, this.color, this.onPressed});
  
  @override
  _ButtonComponentState createState() => new _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: widget.disabled ? null : widget.onPressed,
      child: widget.child,
      color: widget.disabled ? Color(0): widget.color,
    ); //RaisedButton
  }
}