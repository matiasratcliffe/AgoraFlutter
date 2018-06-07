import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userField;
  TextEditingController userRepeatField;
  TextEditingController passField;
  TextEditingController passRepeatField;

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Material(
        child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/background.png"),
              fit: BoxFit.cover
            )
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 35.0),
                padding: new EdgeInsets.all(20.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                  color: Color(0xffF0F0F0)
                ),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new TextField(
                      controller: ,
                      decoration: new InputDecoration(
                        hintText: "User",
                        hintStyle: new TextStyle(color: Colors.grey),
                        border: new OutlineInputBorder()
                      )
                    ),
                    new Padding(padding: new EdgeInsets.all(5.0)),
                    new TextField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        hintText: "Password",
                        hintStyle: new TextStyle(color: Colors.grey),
                        border: new OutlineInputBorder(),
                      )
                    ),
                    new Padding(padding: new EdgeInsets.all(5.0)),
                    new RaisedButton(
                      color: Color(0xffCB1D00),
                      child: new Text("SUBMIT", style: new TextStyle(color: Colors.white)),
                      onPressed: this.submit
                    ),
                    new Padding(padding: new EdgeInsets.all(5.0)),
                    new RaisedButton(
                      child: new Text("Register"),
                      onPressed: (){}
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }

  void submit() {

  }


}