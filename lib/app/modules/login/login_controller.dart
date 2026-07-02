import 'package:alive_app/app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository;
  LoginController(this._authRepository);

    final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final obscurePassword = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

    void onLoginTapped() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (formKey.currentState?.validate() ?? false) {
      Get.snackbar(
        'Google Sign-In only',
        'Please use "Continue with Google" below.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      final result = await _authRepository.signInWithGoogle();
      isLoading.value = false;

      if (result != null) {
        Get.offAllNamed(Routes.home);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Sign-in failed',
        'Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}