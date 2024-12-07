
import 'package:flutter/material.dart';
import 'dart:math' as math;

const String heart = 'Challenge_images/botiquin.png';
const String knife = 'Challenge_images/espada.png';
const String speed = 'Challenge_images/correr.png';

class AttributeWidget extends StatelessWidget {
  final double size;
  final double progress;
  final Widget child;

  const AttributeWidget({
    required Key key,
    required this.progress,
    this.size = 52,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AttributePainter(
        progressPercent: progress,
      ),
      size: Size(size, size),
      child: Container(
        padding: EdgeInsets.all(size / 3.8),
        width: size,
        height: size,
        child: child,
      ),
    );
  }
}

class AttributePainter extends CustomPainter {
  final double progressPercent;
  final double strokeWidth, filledStrokeWidth;

  final bgPaint, strokeBgPaint, strokeFilledPaint;

  AttributePainter({
    required this.progressPercent,
    this.strokeWidth = 2.0,
    this.filledStrokeWidth = 4.0,
  })  : bgPaint = Paint()..color = const Color.fromARGB(255, 0, 0, 0).withOpacity(0.25),
        strokeBgPaint = Paint()..color = const Color.fromARGB(255, 35, 98, 115), //olor de los botones de atributos
        strokeFilledPaint = Paint()
          ..color = const Color.fromARGB(255, 34, 50, 174)
          ..style = PaintingStyle.stroke
          ..strokeWidth = filledStrokeWidth
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawCircle(center, radius - strokeWidth, strokeBgPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - (strokeWidth / 2)),
      -math.pi / 2, // - 45 degrees to start from top
      (progressPercent / 100) * math.pi * 2,
      false,
      strokeFilledPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
