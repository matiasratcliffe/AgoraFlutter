// Dart requirements
import 'dart:io';
import 'dart:async';

// Flutter requirements
import 'package:flutter/material.dart';

// Models
import '../../models/appconfig.model.dart';

// Services
import '../../services/http.service.dart';
import '../../services/base.service.dart';

// Pages to Navigate to
import '../home/home.page.dart';

// Local (app-specific) components
import './components/button.component.dart';
import './components/field.component.dart';

// Global (multi-use) components
import '../../components/background.component.dart';

/// Defined a type for a boolCallBack
typedef bool FocusListenerClause();

/// Main LoginPage
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

// LoginPage's State class
class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  
  // FocusNodes (to check if a text field is focused at a given moment)
  FocusNode dniFocusNode = new FocusNode();
  FocusNode userFocusNode = new FocusNode();
  FocusNode userRepeatFocusNode = new FocusNode();
  FocusNode passFocusNode = new FocusNode();
  FocusNode passRepeatFocusNode = new FocusNode();

  // TextFieldControllers (to get the input value of a text field at a given moment)
  TextFieldController dniFieldController = new TextFieldController();
  TextFieldController userFieldController = new TextFieldController();
  TextFieldController userRepeatFieldController = new TextFieldController();
  TextFieldController passFieldController = new TextFieldController();
  TextFieldController passRepeatFieldController = new TextFieldController();
  
  /// A flag to disable the submit button (needs state reset)
  bool disableSubmit = true;

  /// A flag to change between the login/register forms (needs state reset)
  bool isLoggingIn = true;
  
  /// A flag to set the 'Loading' animation (needs state reset)
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.isLoggingIn = true;
    HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users/login";
    // Adding focus listeners to set appropiate styling when selected/wrong input
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
    return BackgroundComponent(
      background: "assets/images/background.png",
      children: <Widget>[

        // If the isLoading flag is true, only build the CircularProgressIndicator
        isLoading ? new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(10.0)),
            new CircularProgressIndicator(strokeWidth: 5.0),
            new Padding(padding: EdgeInsets.all(10.0))
          ]
        ): 
        // If not, build the whole form
        new Column(
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
        ), // Column - isLoading ?

        // SUBMIT Button
        new ButtonComponent(
          disabled: isLoading || (disableSubmit && !isLoggingIn), // Disabled if Loading, or if its in register mode and disasbleSubmit is on (which means there is an invalid/incomplete field)
          color: Color(0xffCB1D00), // Redish
          child: Text("SUBMIT", style: TextStyle(color: isLoading ? null : Colors.white)),
          onPressed: this.submit
        ), // ButtonComponent

        // Switch form Button
        new ButtonComponent(
          disabled: isLoading, // Only disable if Loading
          child: Text(isLoggingIn ? "Register" : "Log In"),
          onPressed: this.toggle
        ) // ButtonComponent

      ] // <Widget>[]
    ); // BackgroundComponent
  }

  /// Attempts to submit the currently active form
  void submit() async {
    dynamic res; // Scope Declaration for the 'res' variable
    isLoading = true; // Sets the flag
    this.setState((){}); // Resets state so as to rebuild, under the effect of isLoading: true
    try {
      var data = {'email': userFieldController.text, 'password': passFieldController.text}; // JSON object to send in the post request
      if (!isLoggingIn) data['id'] = dniFieldController.text; // Only get the DNI field if its a registration submit
      res = await HttpService.post(data); // Wait for the response
      
      if (res.statusCode != 200) // If the status code is not 200 (OK), something went wrong
        throw "Recieved status code: ${res.statusCode.toString()}"; // Throw text-exception to be handled below
      
      // If no exception was raised, prompt the user for 'remember me' option
      await BaseService.dialogAsk(context, 'Remember User', 'Do you wish for your credentials to be remembered?');
      if (BaseService.dialogAnswer == true) { // Check for the users answer [yes:true, no:false, dismiss:null]
        await registerToken(); // Waits for the token to be saved into memory for future app loading readings
      }
      
      // Navigate to the HomePage with the recieved x-auth token and deletes the LoginPage from the route stack (prevening accidental logouts)
      Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => new HomePage(res.headers['x-auth'])), (Route route) => route == null);
    } on TimeoutException { // If the request timed out
      BaseService.dAlert(context, 'Timeout', 'Submit timed out!');
    } catch(e) {
      BaseService.dAlert(context, "Error", e.toString()); // Handles any other exception
      if (res.body.toString().length > 0) BaseService.log("Body: " + res.body); // If the request didn't timeout, but not returned 200, log the body for extra debugging info
    } finally {
      isLoading = false; // Finish loading
      this.setState((){}); // Reset state
      BaseService.log('This will get printed no matter what, even if I navigate!'); // Ignore, this is just to check the try-catch functionality
    }
  }

  /// Switches between register/login forms
  void toggle() {
    isLoggingIn = !isLoggingIn; // Toggle isLoggingIn flag
    
    // Setting the appropiate target url
    if (isLoggingIn)
      HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users/login";
    else
      HttpService.defaultUrl = "https://glacial-refuge-10252.herokuapp.com/users";
    // Reset all fields styling, values and condition
    dniFieldController.clearStat();
    userFieldController.clearStat();
    userRepeatFieldController.clearStat();
    passFieldController.clearStat();
    passRepeatFieldController.clearStat();
    this.setState((){}); // Reset state to reflect widget changes
  }

  /// Register the 'remember me' data to local memory
  Future<bool> registerToken() async {
    try {
      // Opening pertinent file
      File remembertoken = new File((await BaseService.appDir).uri.path + 'remembertoken');
      remembertoken.writeAsStringSync('contents'); // Write JSON email, token WIP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      BaseService.log('Token Registered');
    } catch(e) {
      BaseService.log(e);
      return false;
    }
    return true;
  }
  
  
  /// Generates the [callback] that goes inside the [focusNode]'s listener
  /// * [controller] is a reference to the field's controller
  /// * [focus] is a reference to the field's focus node
  /// * [clause] callback should return [true] if the field's value is invalid
  VoidCallback focusListener(TextFieldController controller, FocusNode focus, FocusListenerClause clause) {
    // This callback will be executed every time the given field's focus state changes [focused/unfocused]
    return () {
      try {
        if (!isLoggingIn && !focus.hasFocus) { // Only execute if im registering (if I'm logging in, I don't care about validating input in the FrontEnd)
          if (controller.text.isNotEmpty && clause()) { // If its not valid, it checks for the provided clause to be true. If so, then the input value is deemed invalid
            BaseService.log('Disabled InputField');
            controller.invalidValue = true; // This flag indicates the presence of a red borderline
            disableSubmit = true;
          } else { // If valid or empty, remove the red borderline that indicates invalid format
            BaseService.log('Enabled Inputfield');
            controller.invalidValue = false; // This flag indicates the presence of a red borderline
            generalValidator(); // If it is empty, this will handle the SUBMIT button's disabled property
          }
        }
        this.setState((){}); // Resets the state to reflect field/button aspect according to valid/invalid/empty input values
      } catch(e) {BaseService.log(e);} // Should anything go wrong, LOG THAT SHIT BOIIII
    };
  }

  /// Actiates register button if all is good (No empty/invalid fields)
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