import 'package:flutter/material.dart';

class OpenPainter extends CustomPainter {
  static SizedBox getCustomeCircle(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: CustomPaint(
        painter: OpenPainter(),
      ),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = const Color(0xff3F5CEB)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(280, -130), 350, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
