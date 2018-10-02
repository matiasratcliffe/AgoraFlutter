// Flutter requirements
import 'package:flutter/material.dart';

// Local components to be used
import './components/taglabel.component.dart';
import './components/taglabelplus.component.dart';

/// Manage your tags, and check for new/updated projects containing your different suscribed tags
class TagsPage extends StatefulWidget {

  final Map<String,bool> tags;

  TagsPage(this.tags);

  @override
  _TagsPageState createState() => _TagsPageState();
}

/// The State of a [TagsPage]
class _TagsPageState extends State<TagsPage> {

  @override
  Widget build(BuildContext context) {
    
    List<Widget> children = [];

    widget.tags.forEach((k,v) {
      children.add(Center(child: TagLabelComponent(k,v)));
    });

    children.add(Center(child: TagLabelPlusComponent()));
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
      decoration: BoxDecoration(
        color: Colors.white 
      ), // BoxDecoration
      child: Column(
        children: children
      )
    );
  }
}