import 'package:flutter/material.dart';

class AppTheme {
  static const primaryGreen = Color(0xFF1FA855);
  static const lightGreen = Color(0xFFA8E063);

  static ThemeData get lightTheme => ThemeData(
        primaryColor: primaryGreen,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: primaryGreen),
      );
}