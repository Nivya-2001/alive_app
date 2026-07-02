import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/sizes/responsive_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Color backgroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const CustomAppBar({
    super.key,
    this.actions,
    this.backgroundColor = Colors.white,
    this.systemOverlayStyle,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.dp);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          systemOverlayStyle ??
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
      child: Container(
        height: preferredSize.height,
        color: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 16.dp),
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50.dp,
              height: 50.dp,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 40.r,
                    spreadRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Image.asset('assets/app_logo.png', fit: BoxFit.cover),
            ),
            if (actions != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: actions!
                    .map(
                      (action) => Padding(
                        padding: EdgeInsets.only(left: 8.dp),
                        child: action,
                      ),
                    )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
