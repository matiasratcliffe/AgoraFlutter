// Flutter requierements
import 'package:flutter/material.dart';

/// A simple dismissable dialog widget consisting of a [title] and a [message]
class AlertComponent extends StatelessWidget {

  /// To be displayed in the dialog box
  final String title, message;

  AlertComponent(this.title, this.message);

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
          ), // BoxDecoration
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
              ), // Align (Message)
              new Padding(padding: new EdgeInsets.all(18.0)), // In between padding
              
              // OK Button
              new Align(  // To specify child's alignment within the enclosing column row
                alignment: Alignment.bottomRight,
                child: new GestureDetector( // The GestureDetector widget listens for gestures upon its child
                  onTap: () => Navigator.pop(context), // Pop the navigator to dismiss the message
                  child: new Container(
                    margin: new EdgeInsets.only(right: 15.0),
                    child: new Text('OK',
                      style: new TextStyle(
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00C0C0)
                      ) // TextStyle
                    ) // Text
                  ) // Container
                ) // GestureDetector (OK Button)
              ) // Align (OK Button)
            ] // <Widget>[]
          ) // Column
        ) // Container
      ] // <Widget>[]
    ); // Coumn
  }
}
