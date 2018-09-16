// Flutter requirements
import 'package:flutter/material.dart';

// Defined a String callback type to set as the 'validate' attribute of the textfield
typedef String _ValidatorFunc(String input);

/// Briefly extending [TextEditingController] 
class TextFieldController extends TextEditingController {
  
  /// Flag to determine the styling that should be applied to the subordinated [TextField]
  bool invalidValue = false;

  TextFieldController() : super();

  /// Resets the field's condition
  void clearStat() {
    this.text = '';
    this.invalidValue = false;
  }
}

/// Wrapping class for the [TextFormField]
/// * Adding animation support
/// * Adding [invalidValue] state
class FieldComponent extends StatefulWidget {
  final String hintText; // Grayed out text to be shown when field is empty
  final bool obscureText; // For passwords *****
  final FocusNode focusNode; // The FocusNode object to control the fields focus state
  final _ValidatorFunc validator; // Validator function to be executed during form validation
  final TextFieldController controller; // The Controller object to control the fields value

  FieldComponent({this.focusNode, this.validator, this.controller, this.hintText, this.obscureText=false});

  @override
  _FieldComponentState createState() => new _FieldComponentState();
}

/// The State of a [FieldComponent]
class _FieldComponentState extends State<FieldComponent> with SingleTickerProviderStateMixin {
  AnimationController fieldAnimationController; // AnimationController [sets anmation time, and fires it up]
  Animation<double> fieldAnimation; // Animation value [sets animation style]

  @override
  void initState() {
    super.initState();
    fieldAnimationController = new AnimationController(duration: new Duration(milliseconds: 250), vsync: this); // Set animation time
    fieldAnimation = new CurvedAnimation(parent: fieldAnimationController, curve: Curves.easeIn); // Set animation style
    fieldAnimation.addListener(() => this.setState((){})); // MUST DO for all animations, adds a Listener (executed everytime the animations value changes), which resets the state for rebuilding the enclosing widget (FieldComponent) with the apropiate values
    fieldAnimationController.forward(); // Initial animation fire up
  }

  @override
  void dispose() { // To be executed once the component is destroyed (Free resources, avoid crash)
    fieldAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.0 * fieldAnimation.value, // Height to be changed during animation
   
      decoration: BoxDecoration( // BorderDecoration that will change according to the validity of the fields value 
        boxShadow: widget.controller.invalidValue ? [BoxShadow(color: Colors.yellow[50])] : null,
        border: Border.all(
          color: widget.focusNode.hasFocus ? Colors.blue : (widget.controller.invalidValue ? Colors.red : Color(0xff11BBAB)),
          width: 1.0 
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
   
      child: Column(
        children: <Widget>[
          new TextFormField(
            autocorrect: false,
            focusNode: widget.focusNode,
            obscureText: widget.obscureText,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(), // Change the default's horrendous underline styling for a more tolerable OutlineBorder
            ),  // InputDecoration
            validator: widget.validator
          ) // TextField
        ] // <Widget>[]
      ) // Column
    ); // Container
  }
}