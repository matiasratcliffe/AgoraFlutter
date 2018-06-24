// Flutter requierements
import 'package:flutter/material.dart';

// Services
import '../../../../services/base.service.dart';

/// A wrapping component for the labels displaying your tags
class TagLabelComponent extends StatefulWidget {

  /// Flag indicating if there are updates on that tag
  final bool updates;

  /// Text to be displayed in the label
  final String text;

  TagLabelComponent(this.text, {this.updates=false});

  @override
  _TagLabelComponentState createState() => _TagLabelComponentState();
}

/// The State of a [TagLabelComponent] 
class _TagLabelComponentState extends State<TagLabelComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BaseService.alert(context, 'Selected Tag', widget.text.toUpperCase()),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Color(0xff11BBAB), width: 2.0),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Color(0xff11BBAB),
            fontSize: 20.0
          )
        ),
      )
    );
  }
}





