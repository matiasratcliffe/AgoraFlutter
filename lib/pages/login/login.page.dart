import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';

import '../../models/app.config.dart';
import '../../services/http.service.dart';
import '../../services/base.service.dart';

import '../home/home.page.dart';
import './components/button.component.dart';
import './components/field.component.dart';
import '../../components/background.component.dart';

typedef bool FocusListenerClause();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  FocusNode dniFocusNode = new FocusNode();
  FocusNode userFocusNode = new FocusNode();
  FocusNode userRepeatFocusNode = new FocusNode();
  FocusNode passFocusNode = new FocusNode();
  FocusNode passRepeatFocusNode = new FocusNode();
  TextFieldController dniFieldController = new TextFieldController();
  TextFieldController userFieldController = new TextFieldController();
  TextFieldController userRepeatFieldController = new TextFieldController();
  TextFieldController passFieldController = new TextFieldController();
  TextFieldController passRepeatFieldController = new TextFieldController();
  bool disableSubmit = true;
  bool isLoggingIn = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.isLoggingIn = true;
    HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users/login";
    dniFocusNode.addListener(focusListener(dniFieldController, dniFocusNode, () => !BaseService.isNumber(dniFieldController.text,min:5000000,max:70000000)));
    userFocusNode.addListener(focusListener(userFieldController, userFocusNode, () => false));
    userRepeatFocusNode.addListener(focusListener(userRepeatFieldController, userRepeatFocusNode, () => !(userFieldController.text == userRepeatFieldController.text)));
    passFocusNode.addListener(focusListener(passFieldController, passFocusNode, () => passFieldController.text.length < AppConfig.minPassLength));
    passRepeatFocusNode.addListener(focusListener(passRepeatFieldController, passRepeatFocusNode, () => !(passFieldController.text == passRepeatFieldController.text)));
  }

  @override
  void dispose() {
    dniFocusNode.dispose();
    userFocusNode.dispose();
    userRepeatFocusNode.dispose();
    passFocusNode.dispose();
    passRepeatFocusNode.dispose();
    dniFieldController.dispose();
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
            isLoggingIn ? new Container() : new FieldComponent(
              hintText: "DNI",
              focusNode: dniFocusNode,
              controller: dniFieldController,
            ), // FieldComponent
            new FieldComponent(
              hintText: isLoggingIn ? "Email or DNI" : "Email",
              focusNode: userFocusNode,
              controller: userFieldController,
            ), // FieldComponent
            isLoggingIn ? new Container() : new FieldComponent(
              hintText: "Repeat Email",
              focusNode: userRepeatFocusNode,
              controller: userRepeatFieldController,
            ), // FieldComponent
            new FieldComponent(
              obscureText: true,
              hintText: "Password",
              focusNode: passFocusNode,
              controller: passFieldController,
            ), // FieldComponent
            isLoggingIn ? new Container() : new FieldComponent(
              obscureText: true,
              hintText: "Repeat Password",
              focusNode: passRepeatFocusNode,
              controller: passRepeatFieldController,
            ) // FieldComponent
          ]) // <Widget>[]
        ), // Column
        new ButtonComponent(
          disabled: isLoading || (disableSubmit && !isLoggingIn),
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
    dynamic res; // scope declaration
    isLoading = true;
    this.setState((){});
    try {
      var data = {'email': userFieldController.text, 'password': passFieldController.text};
      if (!isLoggingIn) data['id'] = dniFieldController.text;
      res = await HttpService.post(data);
      if (res.statusCode != 200)
        throw "Recieved status code: ${res.statusCode.toString()}";
      await BaseService.dialogAsk(context, 'Remember User', 'Do you wish for your credentials to be remembered?');
      if (BaseService.dialogAnswer == true) {
        await registerToken();
      }
      Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => new HomePage(res.headers['x-auth'])), (Route route) => route == null);
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
    dniFieldController.clearStat();
    userFieldController.clearStat();
    userRepeatFieldController.clearStat();
    passFieldController.clearStat();
    passRepeatFieldController.clearStat();
    this.setState((){});
  }

  Future<bool> registerToken() async {
    try {
      File remembertoken = new File((await BaseService.appDir).uri.path + 'remembertoken');
      remembertoken.writeAsStringSync('contents');
      BaseService.log('token registererd');
    } catch(e) {
      BaseService.log(e);
      return false;
    }
    return true;
  }
  
  
  /// Generates the [callback] that goes inside the [focusNode]'s listener
  ///
  /// * [controller] is a reference to the field's controller
  /// * [focus] is a reference to the field's focus node
  /// * [clause] callback should return [true] if the field's value is invalid
  VoidCallback focusListener(TextFieldController controller, FocusNode focus, FocusListenerClause clause) {
    return () {
      try {
        if (!isLoggingIn && !focus.hasFocus)
          if (controller.text.isNotEmpty && clause()) {
            BaseService.log('Disabled InputField');
            controller.invalidValue = true;
            disableSubmit = true;
          } else {
            BaseService.log('Enabled Inputfield');
            controller.invalidValue = false;
            generalValidator();
          }
        this.setState((){});
      } catch(e) {BaseService.log(e);}
    };
  }

  /// Actiates register button if all is good
  void generalValidator() {
    if (!isLoggingIn) {
      disableSubmit = !(dniFieldController.text.isNotEmpty &&
        userFieldController.text.isNotEmpty &&
        userRepeatFieldController.text.isNotEmpty &&
        passFieldController.text.isNotEmpty &&
        passRepeatFieldController.text.isNotEmpty &&
        !dniFieldController.invalidValue &&
        !userFieldController.invalidValue &&
        !userRepeatFieldController.invalidValue &&
        !passFieldController.invalidValue &&
        !passRepeatFieldController.invalidValue);
    }
  }

}