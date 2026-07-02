import 'package:alive_app/app/core/sizes/responsive_extension.dart';
import 'package:alive_app/app/core/theme/app_colors.dart';
import 'package:alive_app/app/modules/main_screen/main_screen_controller.dart';
import 'package:alive_app/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return Obx(() {
      final selected = controller.selectedIndex.value;
      return Container(
        height: 90.dp,
        color: Colors.transparent,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            ClipPath(
              clipper: SmoothUpperNotchClipper(),
              child: Container(
                height: 78.dp,
                margin: EdgeInsets.only(top: 12.dp),
                decoration: const BoxDecoration(
                  gradient: AppColors.bottomNavGradient,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.dp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _navItem(
                        Icons.home_rounded,
                        'Home',
                        0,
                        selected,
                        controller,
                      ),
                      _navItem(
                        Icons.celebration_rounded,
                        'Party',
                        1,
                        selected,
                        controller,
                      ),
                      SizedBox(width: 56.dp), 
                      _navItem(
                        Icons.send_rounded,
                        'Chats',
                        3,
                        selected,
                        controller,
                      ),
                      _navItem(
                        Icons.person_rounded,
                        'Profile',
                        4,
                        selected,
                        controller,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 12.dp,
              child: GestureDetector(
                onTap: () => controller.changeTab(2),
                child: Column(
                  children: [
                    Container(
                      width: 44.dp,
                      height: 44.dp,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.podcasts_rounded,
                        color: AppColors.primaryGreen,
                        size: 26.dp,
                      ),
                    ),
                    SizedBox(height: 4.dp),
                    CustomTextWidget(
                      text: 'Go Live',
                      textStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _navItem(
    IconData icon,
    String label,
    int index,
    int selected,
    MainController controller,
  ) {
    final isActive = selected == index;
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.white : Colors.white70,
            size: 24.dp,
          ),
          SizedBox(height: 4.dp),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
              color: isActive ? Colors.white : Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class SmoothUpperNotchClipper extends CustomClipper<Path> {
  final double notchRadius;
  final double shoulderWidth;
  final double shoulderHeight;
  final double cornerRadius;

  const SmoothUpperNotchClipper({
    this.notchRadius = 30,
    this.shoulderWidth = 10,
    this.shoulderHeight = 18,
    this.cornerRadius = 15,
  });
  @override
  Path getClip(Size size) {
    final path = Path();
    final centerX = size.width / 2;

    final leftShoulderStart = centerX - notchRadius - shoulderWidth;
    final leftArcStart = centerX - notchRadius;
    final rightArcEnd = centerX + notchRadius;
    final rightShoulderEnd = centerX + notchRadius + shoulderWidth;

    path.moveTo(0, 0);
    path.lineTo(leftShoulderStart, 0);
    path.cubicTo(
      leftShoulderStart + shoulderWidth * 0.25,
      0,
      leftArcStart - shoulderWidth * 0.35,
      shoulderHeight,
      leftArcStart,
      shoulderHeight,
    );
    path.arcToPoint(
      Offset(rightArcEnd, shoulderHeight),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.cubicTo(
      rightArcEnd + shoulderWidth * 0.35,
      shoulderHeight,
      rightShoulderEnd - shoulderWidth * 0.25,
      0,
      rightShoulderEnd,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - cornerRadius,
      size.height,
    );
    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant SmoothUpperNotchClipper oldClipper) {
    return notchRadius != oldClipper.notchRadius ||
        shoulderWidth != oldClipper.shoulderWidth ||
        shoulderHeight != oldClipper.shoulderHeight ||
        cornerRadius != oldClipper.cornerRadius;
  }
}
