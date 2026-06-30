import 'package:get/get.dart';
import '../../data/repositories/stream_repository.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreamRepository>(() => StreamRepository());
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}