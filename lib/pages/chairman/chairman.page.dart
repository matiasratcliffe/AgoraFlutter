// Flutter requirements
import 'package:flutter/material.dart';

// Models
import '../../models/chairman.model.dart';
import '../../models/project.model.dart';

// Components to be used
import './components/chairmanvote.component.dart';

// Services
import '../../services/base.service.dart';

class ChairmanPage extends StatefulWidget {
  
  final Chairman chairman;

  ChairmanPage(this.chairman);
  
  @override
  _ChairmanPageState createState() => _ChairmanPageState();
}

class _ChairmanPageState extends State<ChairmanPage> {

  List<Widget> list;

  _ChairmanPageState() {
    print('Here go fetch the projects????!!');
  }
  
  Widget getCharimanVotes() {
    Project project = Project({'id':'1','favor':'17','against':'8','subscribers':'30','nombre':'Das Projekt','description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquid commodi consequat. Quis voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'});
    list = [
      ChairmanVoteComponent(project, true), ChairmanVoteComponent(project, true),
      ChairmanVoteComponent(project, null), ChairmanVoteComponent(project, false)
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
                Text(widget.chairman.nombre,
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