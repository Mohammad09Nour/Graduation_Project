import 'package:flutter/material.dart';

class OpenPainter extends CustomPainter {
  static Container getCustomeCircle(BuildContext context) {
    return Container(
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
      ..color = Color(0xff3F5CEB)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(280, -130), 350, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
