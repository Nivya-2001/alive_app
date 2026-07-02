import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth = 375; 
  static double screenHeight = 812;
  static double blockSizeHorizontal = 1.0;
  static double blockSizeVertical = 1.0;
  static double textScaleFactor = 1.0;

  static const double designWidth = 375;
  static const double designHeight = 812;

  static bool _initialized = false;

  static void init(BuildContext context) {
    if (_initialized) return; 
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    blockSizeHorizontal = screenWidth / designWidth;
    blockSizeVertical = screenHeight / designHeight;
    textScaleFactor = blockSizeHorizontal.clamp(0.85, 1.25);
    _initialized = true;
  }
}