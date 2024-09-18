import 'package:flutter/material.dart';

class TopContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10.0; // Border radius
    Path path = Path();
    double radius2 = 1.0;

    // Top-left rounded corner
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Right curve (reducing to half the height)
    path.lineTo(size.width, size.height * 0.65 - radius);
    path.arcToPoint(
      Offset(size.width - radius+2, size.height * 0.65),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Middle curve
    path.lineTo(size.width * 0.5 + radius2+2, size.height);
    path.arcToPoint(
      Offset(size.width * 0.5 - radius2, size.height),
      radius: Radius.circular(radius + 20),
      clockwise: true,
    );

    // Left curve (mirroring the right curve)
    path.lineTo(radius, size.height * 0.65);
    path.arcToPoint(
      Offset(2, size.height * 0.65 - radius),
      radius: Radius.circular(radius),
      clockwise: true, // Change this to false to mirror the direction
    );

    // Bottom-left to top-left with a curve
    path.lineTo(0, radius);
    path.arcToPoint(
      Offset(radius, 0),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
