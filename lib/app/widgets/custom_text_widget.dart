import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.maxLines,
    this.textAlign,
  });
  final String text;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      maxLines: maxLines,
      softWrap: true,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
