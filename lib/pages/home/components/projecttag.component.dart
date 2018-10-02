// Flutter requirements
import 'package:flutter/material.dart';

// Models
import '../../../models/project.model.dart';

// Pages to navigate to
import '../../project/project.page.dart';

class ProjectTagComponent extends StatelessWidget {

  final Project project;

  ProjectTagComponent(this.project);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectPage(this.project))); },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: Text('Proyecto Nro. ${this.project.id}'),
      ) // Container
    ); // GestureDetector
  }
}