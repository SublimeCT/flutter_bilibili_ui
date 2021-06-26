import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static get light => ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.lightPrimary,
      primaryColorDark: AppColors.lightPrimaryDark,
      accentColor: AppColors.accentColor,
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(primary: AppColors.lightPrimary)),
      focusColor: AppColors.lightPrimary,
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        backgroundColor: AppColors.lightPrimary,
        // color: AppColors.bgColor,
        iconTheme: IconThemeData(),
        elevation: 1,
        actionsIconTheme: IconThemeData(),
        textTheme: TextTheme(
            headline6: TextStyle(color: AppColors.textColor, fontSize: 16)),
      ));
}
