// Flutter requierements
import 'package:flutter/material.dart';

// App Configuration standards
import '../../../../models/appconfig.model.dart';

// Services
import '../../../../services/base.service.dart';

/// A label displaying a plus symbol to add more labels displaying your tags
class TagLabelPlusComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BaseService.alert(context, 'Add Tag', 'Add'),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppConfig.mainColor,
            width: 2.0
          ), // Border.all
        ), // BoxDecoration
        child: Text('+',
          style: TextStyle(
            color: AppConfig.mainColor,
            fontSize: 25.0
          )
        )
      )
    );
  }

}
