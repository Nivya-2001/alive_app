import 'package:get/get.dart';

class MainController extends GetxController {
  final selectedIndex = 0.obs;

  void changeTab(int index) {
    if (index == 2) {
      Get.snackbar('Go Live', 'Coming soon!',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    selectedIndex.value = index;
  }
}