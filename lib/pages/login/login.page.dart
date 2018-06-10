import 'package:flutter/material.dart';
import 'dart:async';

import '../../services/http.service.dart';
import '../../services/base.service.dart';

import '../home/home.page.dart';
import 'background.component.dart';
import 'button.component.dart';
import 'field.component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  TextEditingController userFieldController = new TextEditingController();
  TextEditingController userRepeatFieldController = new TextEditingController();
  TextEditingController passFieldController = new TextEditingController();
  TextEditingController passRepeatFieldController = new TextEditingController();
  bool isLoggingIn = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.isLoggingIn = true;
    HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users/login";
    HttpService.timeout = 3000; // Redundant, but reads better
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
    return new BackgroundComponent(
      background: "assets/images/background.png",
      children: <Widget>[
        isLoading ? new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(10.0)),
            new CircularProgressIndicator(strokeWidth: 5.0),
            new Padding(padding: new EdgeInsets.all(10.0))
          ]): new Column(
          children: BaseService.addPadding(5.0, <Widget>[
            new FieldComponent(controller: userFieldController, hintText: "User"),
            isLoggingIn ? new Container() : new FieldComponent(controller: userRepeatFieldController, hintText: "Repeat User"),
            new FieldComponent(obscureText: true, controller: passFieldController, hintText: "Password"),
            isLoggingIn ? new Container() : new FieldComponent(obscureText: true, controller: passRepeatFieldController, hintText: "Repeat Password")
          ]) // <Widget>[]
        ), // Column
        new ButtonComponent(
          disabled: isLoading,
          color: Color(0xffCB1D00),
          child: new Text("SUBMIT", style: new TextStyle(color: isLoading ? null : Colors.white)),
          onPressed: this.submit
        ), // ButtonComponent
        new ButtonComponent(
          disabled: isLoading,
          child: new Text(isLoggingIn ? "Register" : "Log In"),
          onPressed: this.toggle
        ) // ButtonComponent
      ] // <Widget>[]
    ); // BackgroundComponent
  }

  void submit() async {
    dynamic res;
    isLoading = true;
    this.setState((){});
    if (!isLoggingIn) {
      //do the checking?
    }
    try {
      res = await HttpService.post({'email': userFieldController.text, 'password': passFieldController.text});
      if (res.statusCode != 200)
        throw "Recieved status code: ${res.statusCode.toString()}";
      res.headers['x-auth'];
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
    } on TimeoutException {
      BaseService.dAlert(context, 'Timeout', 'Submit timed out!');
    } catch(e) {
      BaseService.dAlert(context, "Error", e.toString());
      if (res.body.toString().length > 0) BaseService.log("Body: " + res.body);
    } finally {
      isLoading = false;
      this.setState((){});
      BaseService.log('This will get printed no matter what, even if I navigate!');
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