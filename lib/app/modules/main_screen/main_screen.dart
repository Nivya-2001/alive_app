import 'package:alive_app/app/modules/main_screen/main_screen_controller.dart';
import 'package:alive_app/app/widgets/comming_soon_screen.dart';
import 'package:alive_app/app/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: const [
            HomeScreen(),
            ComingSoonScreen(title: 'Party', icon: Icons.celebration_rounded),
            SizedBox.shrink(),
            ComingSoonScreen(title: 'Chats', icon: Icons.send_rounded),
            ComingSoonScreen(title: 'Profile', icon: Icons.person_rounded),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}