import 'package:flutter/material.dart';
import '../core/sizes/responsive_extension.dart';
import '../core/theme/app_colors.dart';

class BadgeIconWidget extends StatelessWidget {
  final IconData icon;
  final String? badgeCount;
  final VoidCallback? onTap;
  final Color iconColor;

  const BadgeIconWidget({
    super.key,
    required this.icon,
    this.badgeCount,
    this.onTap,
    this.iconColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 40.dp,
        height: 40.dp,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          shape: BoxShape.circle,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20.dp),
            if (badgeCount != null)
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                   width: 16.dp,
                  height: 16.dp,
                  padding: EdgeInsets.symmetric(horizontal: 3.dp),
                  decoration: BoxDecoration(
                    color: AppColors.badgeRed,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    badgeCount!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}