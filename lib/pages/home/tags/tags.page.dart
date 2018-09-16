// Flutter requirements
import 'package:flutter/material.dart';

// Local components to be used
import './components/taglabel.component.dart';
import './components/taglabelplus.component.dart';

/// Manage your tags, and check for new/updated projects containing your different suscribed tags
class TagsPage extends StatefulWidget {
  @override
  _TagsPageState createState() => _TagsPageState();
}

/// The State of a [TagsPage]
class _TagsPageState extends State<TagsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
      decoration: BoxDecoration(
        color: Colors.white 
      ), // BoxDecoration
      child: Column(
        children: <Widget>[
          new Center(child: TagLabelComponent('Medioambiente', updates: true)),
          new Center(child: TagLabelComponent('Educacion')),
          new Center(child: TagLabelComponent('Salud')),
          new Center(child: TagLabelComponent('Tecnologia')),
          new Center(child: TagLabelComponent('Economia')),
          new Center(child: TagLabelPlusComponent()),
        ],
      ),
    );
  }
}