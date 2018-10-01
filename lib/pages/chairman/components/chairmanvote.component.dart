// Flutter requirements
import 'package:flutter/material.dart';

class ChairmanVoteComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('IX.',
            style: TextStyle(
              fontSize: 25.0
            )
          ),
          Text('Die Endlosung',
            style: TextStyle(
              fontSize: 25.0
            )
          ),
          Icon(Icons.thumb_up, color: Colors.green, size: 25.0)
        ],
      ),
    );
  }
}