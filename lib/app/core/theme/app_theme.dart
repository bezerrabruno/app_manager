import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      primaryColor: const Color(0xFF038C8C),
      scaffoldBackgroundColor: const Color(0xFF0D0D0D),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF038C8C),
        onPrimary: Color(0xFFFFF2EB),
        secondary: Color(0xFF04D9D9),
        onSecondary: Color(0xFF262626),
        error: Color(0xFFFF0601),
        onError: Color(0xFF262626),
        surface: Color(0xFF262626),
        onSurface: Color(0xFFFFF2EB),
      ),
    );
  }
}
