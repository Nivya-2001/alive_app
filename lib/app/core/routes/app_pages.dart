import 'package:alive_app/app/modules/main_screen/main_binding.dart';
import 'package:alive_app/app/modules/main_screen/main_screen.dart';
import 'package:get/get.dart';
import '../../modules/splash/splash_screen.dart';
import '../../modules/splash/splash_binding.dart';
import '../../modules/login/login_screen.dart';
import '../../modules/login/login_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.home,
      page: () => const MainScreen(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
