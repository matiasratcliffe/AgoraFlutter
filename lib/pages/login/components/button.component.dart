// Flutter requirements
import 'package:flutter/material.dart';

/// A slightly personalised version of the [RaisedButton]
class ButtonComponent extends StatefulWidget {
  final bool disabled; // Flag to indicate if the button should be operating or disabled
  final Widget child; // Whatever you want to put inside the button (Usually a Text Widget)
  final Color color; // Buttons color, duh!
  final VoidCallback onPressed; // Our beloved callback

  ButtonComponent({this.disabled=false, this.child, this.color, this.onPressed});
  
  @override
  _ButtonComponentState createState() => new _ButtonComponentState();
}

/// The State for a [ButtonComponent]
class _ButtonComponentState extends State<ButtonComponent> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: widget.disabled ? null : widget.onPressed,
      child: widget.child,
      color: widget.disabled ? Color(0): widget.color,
    ); //RaisedButton
  }
}