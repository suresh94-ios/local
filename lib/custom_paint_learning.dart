import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class CustomPaintLearning extends StatefulWidget {
  const CustomPaintLearning({Key? key}) : super(key: key);

  @override
  State<CustomPaintLearning> createState() => _CustomPaintLearningState();
}

class _CustomPaintLearningState extends State<CustomPaintLearning> {
  ui.Image? image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage(
        "assets/images/standing-woman-isolated-on-white-600w-151019570.jpg.webp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: image == null
              ? CircularProgressIndicator()
              : Container(
                  height: 300,
                  width: 300,
                  color: Colors.white,
                  child: SizedBox(
                    height: image!.height.toDouble(),
                    width: image!.width.toDouble(),
                    child: CustomPaint(
                      painter: ImagePaint(image!),
                      // child: Text(
                      //   "Suresh",
                      //   style: TextStyle(color: Colors.blue),
                      // ),
                      //foregroundPainter: LinePainter(),
                    ),
                  ))),
    );
  }

  Future loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);
    setState(() {
      this.image = image;
    });
  }
}

class ImagePaint extends CustomPainter {
  ImagePaint(this.image);
  ui.Image image;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // TODO: implement paint
    canvas.drawImage(image, Offset.zero, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false; /*{
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }*/
}

/*class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      //..blendMode = BlendMode.dst
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 10;
final path = Path();
    ///image
    path.moveTo(size.width *1/2, size.width*1/4);
    path.moveTo(size.width *1/2, size.width*1/4);
    path.moveTo(size.width *1/2, size.width*1/4);
    path.close();
canvas.drawPath(path,paint);

    /// Line drawing
    // canvas.drawLine(Offset(size.width * 1 / 6, size.width * 1),
    //     Offset(size.width * 5 / 6, size.width * 1 / 2), paint);
    // // TODO: implement paint
    // canvas.drawLine(Offset(size.width * 1, size.width * 1),
    //     Offset(size.width * 5 / 6, size.width * 1 / 2), paint);
    // // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false ;*/ /*{
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }*/ /*
}*/
