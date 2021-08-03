import 'package:flutter/material.dart';
import 'package:register/utils/constants.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = custom_gray;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.06, size.height * 0.1,
        size.width * 0.4, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.41, size.height * 0.2, size.width, size.height * 0.35);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
