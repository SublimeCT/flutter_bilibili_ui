import 'package:flutter/material.dart';

/// 应用颜色配置
/// `@diff` 教程中放到了 `lib/util/color.dart` 中, 并且直接声明的常量, 在此处增加了 `AppColors`
@immutable
class AppColors {
  static const int PRIMARY = 0xFFFB7299;

  static const MaterialColor primary = MaterialColor(
      AppColors.PRIMARY, const <int, Color>{50: const Color(0xFFFF9db5)});

  /// `light theme` 主色
  static const Color lightPrimary = Color(AppColors.PRIMARY);

  /// `light theme` `dark` 主色
  static const Color lightPrimaryDark = Color(0xFFEA6188);

  /// `accent` color
  static const Color accentColor = Colors.pink;

  static const Color bgColor = Color(0xffF4F7FA);
  static const Color textColor = Color(0xffF4F7FA);
}
