// Flutter requirements
import 'package:flutter/material.dart';

// Components to be used
import './components/chairmanvote.component.dart';

// Services
import '../../services/base.service.dart';

class ChairmanPage extends StatefulWidget {
  
  final String nombre;

  ChairmanPage(this.nombre);
  
  @override
  _ChairmanPageState createState() => _ChairmanPageState();
}

class _ChairmanPageState extends State<ChairmanPage> {

  List<Widget> list;
  
  Widget getCharimanVotes() {
    list = [
      ChairmanVoteComponent(), ChairmanVoteComponent(),
      ChairmanVoteComponent(), ChairmanVoteComponent()
    ];
    return Expanded(
      child:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: list,
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseService.materialWrap(
      child: Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_circle, size: 130.0),
                Padding(padding: EdgeInsets.symmetric(horizontal: 7.0)),
                Text(widget.nombre,
                  style: TextStyle(
                    fontSize: 34.0
                  ),
                )
              ],
            ),
            getCharimanVotes()
          ],
        ),
      )
    );
  }
}