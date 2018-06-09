import 'package:flutter/material.dart';

import '../services/http.service.dart';
import '../services/base.service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  TextEditingController userFieldController = new TextEditingController();
  TextEditingController userRepeatFieldController = new TextEditingController();
  TextEditingController passFieldController = new TextEditingController();
  TextEditingController passRepeatFieldController = new TextEditingController();
  AnimationController repeatAnimationController;
  Animation<double> repeatAnimation;
  bool isLoggingIn = true;
  bool animations = false;

  @override
  void initState() {
    super.initState();
    this.isLoggingIn = true;
    repeatAnimationController = new AnimationController(duration: new Duration(milliseconds: 200), vsync: this);
    repeatAnimation = new CurvedAnimation(parent: repeatAnimationController, curve: Curves.easeIn);
    repeatAnimation.addListener(() => this.setState((){}));
    repeatAnimationController.forward();
  }

  @override
  void dispose() {
    userFieldController.dispose();
    userRepeatFieldController.dispose();
    passFieldController.dispose();
    passRepeatFieldController.dispose();
    repeatAnimationController.dispose();
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
                    new Column(
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
                        isLoggingIn ? new Container() : 
                        new Container(
                          height: 60.0 * repeatAnimation.value,
                          width: 60.0 * repeatAnimation.value,
                          child: new Column(
                            children: <Widget>[
                              new TextField(
                                controller: userRepeatFieldController,
                                decoration: new InputDecoration(
                                  hintText: "Repeat User",
                                  hintStyle: new TextStyle(color: Colors.grey),
                                  border: new OutlineInputBorder(),
                                )  // InputDecoration
                              ) // TextField
                            ] // <Widget>[]
                          ) // Column
                        ), // Container
                        isLoggingIn ? new Container() : new Padding(padding: new EdgeInsets.all(5.0)),
                        new TextField(
                          obscureText: true,
                          controller: passFieldController,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            hintStyle: new TextStyle(color: Colors.grey),
                            border: new OutlineInputBorder(),
                          ) // InputDecoration
                        ), // TextField
                        isLoggingIn ? new Container() : new Padding(padding: new EdgeInsets.all(5.0)),
                        isLoggingIn ? new Container() :
                        new Container(
                          height: 60.0 * repeatAnimation.value,
                          width: 60.0 * repeatAnimation.value,
                          child: new Column(
                            children: <Widget>[
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
                          ) // Colum
                        ) // Container
                      ] // <Widget>[]
                    ), // Column
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
    try {
      var res = await HttpService.post({'email': userFieldController.text, 'password': passFieldController.text});
      if (res.statusCode != 200)
        throw "error";
      res.headers['x-auth'];
    } catch(e) {
      BaseService.dAlert(context, "Error", e.toString());
    }
  }

  void toggle() {
    isLoggingIn = !isLoggingIn;
    repeatAnimationController.reset();
    repeatAnimationController.forward();
    if (isLoggingIn)
      HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users/login";
    else
      HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users";
    this.setState((){});
  }
}