// Flutter requirements
import 'package:flutter/material.dart';

// App Configuration standards
import '../models/appconfig.model.dart';

/// A simple dismissable dialog widget consisting of a [title], a [message], and the [yesFunc] / [noFunc] callbacks
class AskComponent extends StatelessWidget {

  /// To be displayed in the dialog box
  final String title, message;

  /// To be ran should the user selects the corresponding option
  final VoidCallback yesFunc, noFunc;

  AskComponent(this.title, this.message, {@required this.yesFunc, @required this.noFunc});
  
  @override
  Widget build(BuildContext context) {
    // Material me blanquea el fondo
    return Column( // To center main content
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container( // To set background color / border radius properties + margins + padding
          margin: EdgeInsets.symmetric(horizontal: 40.0), // Side space
          padding: EdgeInsets.all(22.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            color: AppConfig.appColors.grayWhite
          ), // BoxDecoraion
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
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Rock Salt', 
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                    ) // TextStyle
                  ) // Text
                ), // Align (Title)
                new Padding(padding: EdgeInsets.all(10.0)), // In between padding
                
                // Message
                new Align( // To specify child's alignment within the enclosing column row
                  alignment: Alignment.topLeft,
                  child: Text(message,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 17.0,
                      fontFamily: 'Rock Salt',
                      fontWeight: FontWeight.normal,
                      color: Colors.black87
                    ) // TextStyle
                  ) // Text
                ), // Allign (Message)
                new Padding(padding: EdgeInsets.all(18.0)), // In between padding

                new Row( // To arange the available options horizontally
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // Option: NO
                    new GestureDetector( // The GestureDetector widget listens for gestures upon its child
                      onTap: noFunc, // The callback to be called if NO is selected
                      child: Container(
                        margin: EdgeInsets.only(right:150.0),
                        child: Text('NO',
                          style: TextStyle(
                            fontSize: 18.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            color: AppConfig.appColors.azulMarino
                          ) // TextStyle
                        ) // Text
                      ) // Container
                    ), // GestureDetector (NO)
                    
                    // Option: YES
                    new GestureDetector( // The GestureDetector widget listens for gestures upon its child
                      onTap: yesFunc, // The callback to be called if YES is selected
                      child: Container(
                        margin: EdgeInsets.only(right: 15.0),
                        child: Text('YES',
                          style: TextStyle(
                            fontSize: 18.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            color: AppConfig.appColors.azulMarino
                          ) // TextStyle
                        ) // Text
                      ) // Container
                    ) // GestureDetector (YES)
                  ] // <Widget>[]
                ) // Row
              ] // <Widget>[]
            ) // Column
          ) // Material
        ) // Container
      ] // <Widget>[]
    ); // Column
  }
}