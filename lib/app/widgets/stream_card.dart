import 'package:alive_app/app/core/sizes/responsive_extension.dart';
import 'package:alive_app/app/core/theme/app_colors.dart';
import 'package:alive_app/app/data/models/stream_model.dart';
import 'package:alive_app/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class StreamCard extends StatelessWidget {
  final StreamModel stream;
  const StreamCard({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.dp),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(stream.imageUrl, fit: BoxFit.cover),
          Positioned(
            top: 8.dp,
            left: 8.dp,
            child: _pill('👁 ${stream.viewerCount}'),
          ),
          Positioned(
            bottom: 8.dp,
            left: 8.dp,
            right: 8.dp,
            child: Row(
              children: [
                CircleAvatar(radius: 12.dp, backgroundColor: Colors.white),
                SizedBox(width: 6.dp),
                Expanded(
                  child: CustomTextWidget(
                    text: stream.username,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.dp,
                    vertical: 4.dp,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accentGreen,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: CustomTextWidget(
                    text: '+ Follow',
                    textStyle: TextStyle(fontSize: 10.sp, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pill(String text) => Container(
    padding: EdgeInsets.symmetric(horizontal: 6.dp, vertical: 2.dp),
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(20),
    ),
    child: CustomTextWidget(
      text: text,
      textStyle: TextStyle(color: Colors.white, fontSize: 10.sp),
    ),
  );
}
