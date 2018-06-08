import 'package:flutter/material.dart';

import '../services/http.service.dart';
import '../services/base.service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userFieldController = new TextEditingController();
  TextEditingController userRepeatFieldController = new TextEditingController();
  TextEditingController passFieldController = new TextEditingController();
  TextEditingController passRepeatFieldController = new TextEditingController();
  Widget passRepeatField;
  Widget userRepeatField;
  bool isLoggingIn = true;

  @override
  void initState() {
    super.initState();
    this.isLoggingIn = true;
    this.userRepeatField = new Column(
      children: <Widget>[
        new TextField(
          controller: userRepeatFieldController,
          decoration: new InputDecoration(
            hintText: "Repeat User",
            hintStyle: new TextStyle(color: Colors.grey),
            border: new OutlineInputBorder(),
          )  // InputDecoration
        ), // TextField
        new Padding(padding: new EdgeInsets.all(5.0))
      ], // <Widget>[]
    ); // Column
    this.passRepeatField = new Column(
      children: <Widget>[
        new Padding(padding: new EdgeInsets.all(5.0)),
        new TextField(
          obscureText: true,
          controller: passRepeatFieldController,
          decoration: new InputDecoration(
            hintText: "Repeat Password",
            hintStyle: new TextStyle(color: Colors.grey),
            border: new OutlineInputBorder(),
          ) // InputDecoration
        ) // TextField
      ] // <Widget>[]
    ); // Column
  }

  @override
  void dispose() {
    userFieldController.dispose();
    userRepeatFieldController.dispose();
    passFieldController.dispose();
    passRepeatFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Material(
        child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/background.png"),
              fit: BoxFit.cover
            ) // DecorationImage
          ), // BoxDecoration
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 35.0),
                padding: new EdgeInsets.all(20.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                  color: Color(0xffF0F0F0)
                ), // BoxDecoration
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new TextField(
                      controller: userFieldController,
                      decoration: new InputDecoration(
                        hintText: "User",
                        hintStyle: new TextStyle(color: Colors.grey),
                        border: new OutlineInputBorder()
                      ) // InputDecoration
                    ), // TextField
                    new Padding(padding: new EdgeInsets.all(5.0)),
                    isLoggingIn ? new Container() : userRepeatField,
                    new TextField(
                      obscureText: true,
                      controller: passFieldController,
                      decoration: new InputDecoration(
                        hintText: "Password",
                        hintStyle: new TextStyle(color: Colors.grey),
                        border: new OutlineInputBorder(),
                      ) // InputDecoration
                    ), // TextField
                    isLoggingIn ? new Container() : passRepeatField,
                    new Padding(padding: new EdgeInsets.all(5.0)),
                    new RaisedButton(
                      color: Color(0xffCB1D00),
                      child: new Text("SUBMIT", style: new TextStyle(color: Colors.white)),
                      onPressed: this.submit
                    ), // RaisedButton
                    new Padding(padding: new EdgeInsets.all(5.0)),
                    new RaisedButton(
                      child: new Text(isLoggingIn ? "Register" : "Log In"),
                      onPressed: this.toggle
                    ) // RaisedButton
                  ] // <Widget>[]
                ) // Column
              ) // Container
            ] // <Widget>[]
          ) // Column
        ) // Container
      ) // Material
    ); // SafeArea
  }

  void submit() async {
    if (!isLoggingIn) {
      //do the checking?
    }
    var res = await HttpService.post({'email': userFieldController.text, 'password': passFieldController.text});
    try {
      print(res.statusCode);
      print(res);
      print('----------------------------------------');
      print(res.headers);
      print('----------------------------------------');
      print(res.body);
    } catch(e){
      BaseService.dAlert(context, "Error", e.toString());
    }
  }

  void toggle() {
    isLoggingIn = !isLoggingIn;
    if (isLoggingIn)
      HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users/login";
    else
      HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users";
    this.setState((){});
  }


}