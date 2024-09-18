import 'package:flutter/material.dart';

class FlippedBottomLeftContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10.0; // Border radius
    Path path = Path();

    // Start at the bottom-left
    path.moveTo(0, size.height - radius);
    path.arcToPoint(
      Offset(radius, size.height),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Line to the bottom-right
    path.lineTo(size.width - radius, size.height-4);
    path.arcToPoint(
      Offset(size.width, size.height - radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Line up to the top-center
    path.lineTo(size.width, 82.6 + radius);
    path.arcToPoint(
      Offset(size.width - radius, 78),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width * 0.98, 79);

    // Line to the top-left
    path.lineTo(radius, 0);
    path.arcToPoint(
      Offset(0, radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Close the path with a rounded corner
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}