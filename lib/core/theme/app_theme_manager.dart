import 'package:calculator/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData appTheme() => ThemeData(
    scaffoldBackgroundColor: AppColors.black,
  );
}