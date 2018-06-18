import 'package:flutter/material.dart';

class AskComponent extends StatelessWidget {
  final String title, message;
  final VoidCallback yesFunc, noFunc;
  AskComponent(this.title, this.message, {@required this.yesFunc, @required this.noFunc});
  
 @override
  Widget build(BuildContext context) {
    return new Column( // To center main content
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.symmetric(horizontal: 40.0), //change margins for wrap arround?
          padding: new EdgeInsets.all(22.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
            color: Color(0xffE3E3E3)
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Align(
                alignment: Alignment.topLeft, 
                child: new Text(title,
                  style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Rock Salt', 
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                  )
                )
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new Align(
                alignment: Alignment.topLeft,
                child: new Text(message,
                  style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 17.0,
                    fontFamily: 'Rock Salt',
                    fontWeight: FontWeight.normal,
                    color: Colors.black87
                  )
                )
              ),
              new Padding(padding: new EdgeInsets.all(18.0)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new GestureDetector(
                    onTap: noFunc,
                    child: new Container(
                      margin: new EdgeInsets.only(right:150.0),
                      child: new Text('NO',
                        style: new TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00C0C0)
                        )
                      )
                    )
                  ),
                  new GestureDetector(
                    onTap: yesFunc,
                    child: new Container(
                      margin: new EdgeInsets.only(right: 15.0),
                      child: new Text('YES',
                        style: new TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00C0C0)
                        )
                      )
                    )
                  )
                ]
              )
            ]
          )
        )
      ]
    );
  }
}