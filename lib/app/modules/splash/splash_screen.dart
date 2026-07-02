import 'package:alive_app/app/core/sizes/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (context, child) {
            return Opacity(
              opacity: controller.fadeAnimation.value,
              child: Transform.scale(
                scale: controller.scaleAnimation.value,
                child: child,
              ),
            );
          },
          child: Container(
            width: 100.dp,
            height: 100.dp,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 40,
                  spreadRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Image.asset('assets/app_logo.png', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
