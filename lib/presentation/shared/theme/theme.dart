import 'package:flutter/material.dart';

import 'colors.dart';

abstract class CatPediaThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Montserrat',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.light(
        primary: CatPediaColors.primaryColor,
        primaryContainer: CatPediaColors.primaryVariant,
        secondary: CatPediaColors.secondaryColor,
        secondaryContainer: CatPediaColors.accentColor,
        surface: CatPediaColors.surfaceColor,
        error: CatPediaColors.errorColor,
        onPrimary: Colors.white,
        onSecondary: CatPediaColors.darkColor,
        onSurface: CatPediaColors.darkColor,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        headlineMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        titleMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
        labelLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
