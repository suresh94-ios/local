import 'package:flutter/material.dart';

class CustomPaintLearning extends StatefulWidget {
  const CustomPaintLearning({Key? key}) : super(key: key);

  @override
  State<CustomPaintLearning> createState() => _CustomPaintLearningState();
}

class _CustomPaintLearningState extends State<CustomPaintLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomPaint(
          foregroundPainter:LinePainter() ,
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
