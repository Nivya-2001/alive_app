import 'package:alive_app/app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';

class SplashController extends GetxController
    with GetTickerProviderStateMixin {
  final AuthRepository _authRepository;
  SplashController(this._authRepository);

  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    animationController.forward();
    _navigateNext();
  }

 Future<void> _navigateNext() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    final user = _authRepository.currentUser;
    if (user != null) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
