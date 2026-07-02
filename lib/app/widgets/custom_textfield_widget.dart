import 'package:alive_app/app/core/sizes/responsive_extension.dart';
import 'package:alive_app/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  const CustomTextfieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    this.suffixIcon,
    this.labelText,
    this.errorText,
    this.validator,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? labelText;
  final String? errorText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null && labelText!.isNotEmpty)
          Padding(
            padding: EdgeInsetsGeometry.only(bottom: 8.dp),
            child: CustomTextWidget(
              text: labelText ?? '',
              textStyle: TextStyle(fontSize: 13.sp, color: Colors.black87),
            ),
          ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
            filled: true,
            fillColor: const Color(0xFFF2F2F2),
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.dp,
              vertical: 12.dp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: EdgeInsetsGeometry.only(bottom: 4.dp),
            child: CustomTextWidget(
              text: errorText ?? '',
              maxLines: 2,
              textStyle: TextStyle(fontSize: 12.sp, color: Colors.redAccent),
            ),
          ),
      ],
    );
  }
}
