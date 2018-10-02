// Flutter requierements
import 'package:flutter/material.dart';

// App Configuration standards
import '../../../../models/appconfig.model.dart';

// Services
import '../../../../services/base.service.dart';

/// A wrapping component for the labels displaying your tags
class TagLabelComponent extends StatelessWidget {

  /// Flag indicating if there are updates on that tag
  final bool updates;

  /// Tag name
  final String name;

  TagLabelComponent(this.name, [this.updates=false]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BaseService.alert(context, 'Selected Tag', this.name.toUpperCase()),
      //onLongPress: ask for delete TODO:,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),//(left: 15.0, right: 15.0, bottom: 5.0, top: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: AppConfig.mainColor,
            width: 2.0
          ), // Border.all
        ), // BoxDecoration
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(this.name,
              style: TextStyle(
                color: AppConfig.mainColor,
                fontSize: 25.0
              ) // TextStyle
            ), // Text
            createDot() ?? Container()
          ] // <Widget>[]
        ) // Row
      ) // Container
    ); // GestureDetector
  }

  Container createDot() {
    return !this.updates ? null : Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2.0
        ) // Border.all
      ), // BoxDecoration
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppConfig.mainColor,
            width: 6.0
          ), // Border.all
          color: AppConfig.mainColor,
        ), // BoxDecoration
        child: Text('-',
          style: TextStyle(
            color: AppConfig.mainColor,            
          ) // TextStyle
        ) // Text
      ) // Container
    ); // Container
  }
}
