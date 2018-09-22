// Flutter requierements
import 'package:flutter/material.dart';

// App Configuration standards
import '../models/appconfig.model.dart';

/// A simple dismissable dialog widget consisting of a [title] and a [message]
class AlertComponent extends StatelessWidget {

  /// To be displayed in the dialog box
  final String title, message;

  AlertComponent(this.title, this.message);

  @override
  Widget build(BuildContext context) {
    return Column( // To center main content
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container( // To set background color / border radius properties + margins + padding
          margin: EdgeInsets.symmetric(horizontal: 40.0), // Side space
          padding: EdgeInsets.all(22.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            color: AppConfig.appColors.grayWhite
          ), // BoxDecoration
          child: Material( // To set the standard theme and font
            color: AppConfig.appColors.grayWhite, // I was missing this, thats why the color of the center was lighter than that of the margin (defined a couple of lines above); Material asumes Pure white, instead of the prefered gray white
            child: Column( // To arrange the elements vertically
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Title
                new Align( // To specify child's alignment within the enclosing column row
                  alignment: Alignment.topLeft, 
                  child: Text(title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ) // TextStyle
                  ) // Text
                ), // Align (Title)
                new Padding(padding: EdgeInsets.all(10.0)), // In between padding
                
                // Message
                new Align( // To specify child's alignment within the enclosing column row
                  alignment: Alignment.topLeft,
                  child: Text(message,
                    style: TextStyle(fontSize: 17.0)
                  ) // Text
                ), // Align (Message)
                new Padding(padding: EdgeInsets.all(18.0)), // In between padding
                
                // OK Button
                new Align(  // To specify child's alignment within the enclosing column row
                  alignment: Alignment.bottomRight,
                  child: GestureDetector( // The GestureDetector widget listens for gestures upon its child
                    onTap: () => Navigator.pop(context), // Pop the navigator to dismiss the message
                    child: Container(
                      margin: EdgeInsets.only(right: 15.0),
                      child: Text('OK',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: AppConfig.appColors.azulMarino
                        ) // TextStyle
                      ) // Text
                    ) // Container
                  ) // GestureDetector (OK Button)
                ) // Align (OK Button)
              ] // <Widget>[]
            ) // Column
          ) // Material
        ) // Container
      ] // <Widget>[]
    ); // Coumn
  }
}