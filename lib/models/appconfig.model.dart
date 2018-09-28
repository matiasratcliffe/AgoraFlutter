import 'package:flutter/material.dart';

class AppConfig {
  static final int minPassLength = 8;
  static final _AppColors appColors = _AppColors();
  static final ThemeData theme = ThemeData(
    iconTheme: IconThemeData(color: appColors.strongCyan),
    canvasColor: appColors.strongCyan,
    accentColor: appColors.strongCyan,
    indicatorColor: Colors.white,
  );
}

/// Private class
class _AppColors {
  final Color strongCyan = Color(0xff11BBAB);
}