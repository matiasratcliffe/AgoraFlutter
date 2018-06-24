// Flutter requirements
import 'package:flutter/material.dart';

// Local components to be used
import './components/taglabel.component.dart';

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
      padding: EdgeInsets.only(left: 12.0, right: 15.0, bottom: 10.0, top: 40.0),
      decoration: BoxDecoration(
        color: Colors.white 
      ), // BoxDecoration
      child: Column(
        children: <Widget>[
          new TagLabelComponent('Medioambiente'),
          new TagLabelComponent('Educacion'),
          new TagLabelComponent('Salud'),
          new TagLabelComponent('Tecnologia'),
          new TagLabelComponent('Economia')
        ],
      ),
    );
  }
}