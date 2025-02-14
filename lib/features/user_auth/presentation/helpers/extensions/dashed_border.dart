import 'dart:ui';
import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double gapWidth;
  final double cornerRadius;

  DashedBorderPainter({
    this.color = Colors.grey,
    this.strokeWidth = 1.0,
    this.dashWidth = 5.0,
    this.gapWidth = 3.0,
    this.cornerRadius = 8.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Create a rounded rectangle path
    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(cornerRadius),
    ));

    // Create the dashed path
    final dashPath = _createDashedPath(path, dashWidth, gapWidth);
    canvas.drawPath(dashPath, paint);
  }

  Path _createDashedPath(Path path, double dashWidth, double gapWidth) {
    final Path dashedPath = Path();
    final PathMetrics pathMetrics = path.computeMetrics();

    for (final PathMetric metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double endDistance = distance + dashWidth < metric.length
            ? distance + dashWidth
            : metric.length;
        dashedPath.addPath(
          metric.extractPath(distance, endDistance),
          Offset.zero,
        );
        distance = endDistance + gapWidth;
      }
    }

    return dashedPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
