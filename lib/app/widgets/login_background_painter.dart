import 'package:alive_app/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _drawBackWave(canvas, size);
    _drawMiddleWave(canvas, size);
    _drawFrontWave(canvas, size);
  }

  /// Back Wave
  void _drawBackWave(Canvas canvas, Size size) {
    final path = Path();

    path.moveTo(-size.width * .01, size.height * .15);

    path.cubicTo(
      size.width * .40,
      size.height * .001,
      size.width * .95,
      size.height * .42,
      size.width * .55,
      size.height * .20,
    );

    path.cubicTo(
      size.width * .78,
      size.height * .02,
      size.width * .95,
      size.height * .008,
      size.width * 1.15,
      size.height * .15,
    );

    path.lineTo(size.width * 1.15, size.height);
    path.lineTo(-size.width * .1, size.height);
    path.close();
    final paint = Paint()
      ..shader = AppColors.primaryGradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    canvas.drawPath(path, paint);
  }

  /// Middle Wave
  void _drawMiddleWave(Canvas canvas, Size size) {
    final path = Path();

    path.moveTo(-size.width * .1, size.height * .28);

    path.cubicTo(
      size.width * .18,
      size.height * .50,
      size.width * .42,
      size.height * .06,
      size.width * .63,
      size.height * .24,
    );

    path.cubicTo(
      size.width * .94,
      size.height * .04,
      size.width,
      size.height * .02,
      size.width * 1.15,
      size.height * .00,
    );

    path.lineTo(size.width * 1.15, size.height);
    path.lineTo(-size.width * .1, size.height);
    path.close();
    canvas.drawPath(path, Paint()..color = const Color(0xff4CAF50));
  }

  /// Front Wave
  void _drawFrontWave(Canvas canvas, Size size) {
    final path = Path();

    path.moveTo(-size.width * .1, size.height * .46);

    path.cubicTo(
      size.width * .02,
      size.height * 1.10,
      size.width * .15,
      size.height * .86,
      size.width * .30,
      size.height * .58,
    );

    path.cubicTo(
      size.width * .90,
      size.height * .32,
      size.width ,
      size.height * .34,
      size.width * 1.15,
      size.height * 0.38,
    );

    path.lineTo(size.width * 1.15, size.height);
    path.lineTo(-size.width * .1, size.height);
    path.close();

    final paint = Paint()
      ..shader = AppColors.primaryGradientVertical.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
