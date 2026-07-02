import 'package:alive_app/app/core/sizes/responsive_extension.dart';
import 'package:alive_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  const ComingSoonScreen({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldWhite,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56.dp, color: Colors.grey[700]),
             SizedBox(height: 16.dp),
            Text(
              '$title — Coming Soon',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}