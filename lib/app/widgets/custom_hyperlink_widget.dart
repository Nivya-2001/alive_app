import 'package:alive_app/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import '../core/sizes/responsive_extension.dart';
import '../core/theme/app_colors.dart';

class CustomHyperlinkButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final double? fontSize;
  final FontWeight fontWeight;
  final bool showUnderline;

  const CustomHyperlinkButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = AppColors.primaryGreen,
    this.fontSize,
    this.fontWeight = FontWeight.w700,
    this.showUnderline = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.dp,
          vertical: 2.dp,
        ),
        child: CustomTextWidget(
          text: text,
          textStyle: TextStyle(
            color: color,
            fontSize: fontSize ?? 14.sp,
            fontWeight: fontWeight,
            decoration: showUnderline
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationColor: color,
            decorationThickness: 1.5,
          ),
        ),
      ),
    );
  }
}