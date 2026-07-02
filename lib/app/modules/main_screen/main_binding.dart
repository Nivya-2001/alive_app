import 'package:alive_app/app/modules/main_screen/main_screen_controller.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import '../../data/repositories/stream_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<StreamRepository>(() => StreamRepository());
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}