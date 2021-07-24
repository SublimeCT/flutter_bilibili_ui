import 'package:flutter/material.dart';

import 'colors.dart';

/// 应用主题配置
/// `@diff` 教程中直接在使用的地方加入以下配置, 并未分离
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
