// Flutter requirements
import 'package:flutter/material.dart';

// Services
import '../services/base.service.dart';

class AppConfig {
  static final int minPassLength = 8;
  static final Color mainColor = _appColors.strongCyan;

  static final _AppColors _appColors = _AppColors();

  static dynamic theme([BuildContext context]) {
    // I couldnt find a way to avoid code repetition!
    if (context == null) {
      BaseService.log('Creating new theme');
      return ThemeData(
        iconTheme: IconThemeData(color: mainColor),
        scaffoldBackgroundColor: mainColor,
        indicatorColor: Colors.white
      );
    } else {
      BaseService.log('Extending theme of context');
      return Theme.of(context).copyWith(
        iconTheme: IconThemeData(color: mainColor),
        scaffoldBackgroundColor: mainColor,
        indicatorColor: Colors.white
      );
    }
  }
}

/// Private class
class _AppColors {
  final Color strongCyan = Color(0xff11BBAB);
  final Color grayWhite  = Color(0xffE3E3E3); // Im not using it, but I like to keep it handy
}