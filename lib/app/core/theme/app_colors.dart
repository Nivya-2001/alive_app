import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); 

  static const Color primaryGreen = Color(0xFF1FA855);
  static const Color lightGreen = Color(0xFFA8E063);
  static const Color darkGreen = Color(0xFF157A3C);
  static const Color accentGreen = Color(
    0xFFC6E84C,
  ); 
  static const Color gradientStart = Color(0xFFA8E063); 
  static const Color gradientEnd = Color(0xFF1FA855); 

  static const Color scaffoldWhite = Color(0xFFFFFFFF);
  static const Color scaffoldDark = Color(0xFF0D0D0D); 
  static const Color cardDark = Color(0xFF1A1A1A); 
  static const Color inputFill = Color(0xFFF2F2F2); 

  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF6B6B6B);
  static const Color textHint = Color(0xFFAAAAAA);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textWhite70 = Color(0xB3FFFFFF); 

  static const Color googleWhite = Color(0xFFFFFFFF);
  static const Color facebookBlue = Color(0xFF1877F2);

  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color success = Color(0xFF1FA855);
  static const Color warning = Color(0xFFFFA000);

  static const Color divider = Color(0xFFE0E0E0);
  static const Color badgeRed = Color(0xFFE53935);
  static const Color overlay = Color(0x80000000); 
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient primaryGradientVertical = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient loginButtonGradient = LinearGradient(
    colors: [lightGreen, primaryGreen],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient bottomNavGradient = LinearGradient(
    colors: [lightGreen, primaryGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
