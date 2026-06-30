import 'package:alive_app/app/core/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository;
  LoginController(this._authRepository);

  final isLoading = false.obs;

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      final result = await _authRepository.signInWithGoogle();
      isLoading.value = false;

      if (result != null) {
        Get.offAllNamed(Routes.home);
      }
      // result == null means user cancelled the picker — no error needed
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Sign-in failed',
        'Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}