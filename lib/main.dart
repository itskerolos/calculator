import 'package:calculator/ui/calculator_board.dart';
import 'package:calculator/core/theme/app_theme_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  CalculatorBoard(),
      theme: AppThemeManager.appTheme(),
    );
  }
}


