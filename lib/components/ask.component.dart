// Flutter requirements
import 'package:flutter/material.dart';

/// A simple dismissable dialog widget consisting of a [title], a [message], and the [yesFunc] / [noFunc] callbacks
class AskComponent extends StatelessWidget {

  /// To be displayed in the dialog box
  final String title, message;

  /// To be ran should the user selects the corresponding option
  final VoidCallback yesFunc, noFunc;

  AskComponent(this.title, this.message, {@required this.yesFunc, @required this.noFunc});
  
  @override
  Widget build(BuildContext context) {
    return new Column( // To center main content
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container( // To set background color / border radius properties + margins + padding
          margin: new EdgeInsets.symmetric(horizontal: 40.0), // Side space
          padding: new EdgeInsets.all(22.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
            color: Color(0xffE3E3E3) // Gray White
          ), // BoxDecoraion
          child: new Column( // To arrange the elements vertically
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Title
              new Align( // To specify child's alignment within the enclosing column row
                alignment: Alignment.topLeft,
                child: new Text(title,
                  style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Rock Salt', 
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                  ) // TextStyle
                ) // Text
              ), // Align (Title)
              new Padding(padding: new EdgeInsets.all(10.0)), // In between padding
              
              // Message
              new Align( // To specify child's alignment within the enclosing column row
                alignment: Alignment.topLeft,
                child: new Text(message,
                  style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 17.0,
                    fontFamily: 'Rock Salt',
                    fontWeight: FontWeight.normal,
                    color: Colors.black87
                  ) // TextStyle
                ) // Text
              ), // Allign (Message)
              new Padding(padding: new EdgeInsets.all(18.0)), // In between padding

              new Row( // To arange the available options horizontally
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Option: NO
                  new GestureDetector( // The GestureDetector widget listens for gestures upon its child
                    onTap: noFunc, // The callback to be called if NO is selected
                    child: new Container(
                      margin: new EdgeInsets.only(right:150.0),
                      child: new Text('NO',
                        style: new TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00C0C0)
                        ) // TextStyle
                      ) // Text
                    ) // Container
                  ), // GestureDetector (NO)
                  
                  // Option: YES
                  new GestureDetector( // The GestureDetector widget listens for gestures upon its child
                    onTap: yesFunc, // The callback to be called if YES is selected
                    child: new Container(
                      margin: new EdgeInsets.only(right: 15.0),
                      child: new Text('YES',
                        style: new TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00C0C0)
                        ) // TextStyle
                      ) // Text
                    ) // Container
                  ) // GestureDetector (YES)
                ] // <Widget>[]
              ) // Row
            ] // <Widget>[]
          ) // Column
        ) // Container
      ] // <Widget>[]
    ); // Column
  }
}
