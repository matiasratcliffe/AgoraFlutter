// Flutter requirements
import 'package:flutter/material.dart';

// Packages to be used
//import 'package:roman_numerals/roman_numerals.dart';

// Models
import '../../../models/project.model.dart';

// Pages to navigate to
import '../../project/project.page.dart';

class ChairmanVoteComponent extends StatelessWidget {

  final Project project;
  final bool voto;

  ChairmanVoteComponent(this.project, this.voto);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectPage(this.project))); },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(this.project.id.toString(), //RomanNumerals.toRoman(this.project.id),
              style: TextStyle(
                fontSize: 25.0
              )
            ),
            Text(this.project.nombre,
              style: TextStyle(
                fontSize: 25.0
              )
            ),
            (this.voto == null) ? Icon(Icons.thumbs_up_down, color: Colors.grey, size: 25.0) : ((this.voto) ? Icon(Icons.thumb_up, color: Colors.green, size: 25.0) : Icon(Icons.thumb_down, color: Colors.red, size: 25.0))
          ]
        )
      )
    );
  }
}