import 'package:flutter/material.dart';

class FlippedBottomRightContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10.0; // Border radius
    Path path = Path();

    // Start at the bottom-right
    path.moveTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Line to the bottom-left
    path.lineTo(radius, size.height - 5);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Line up to the top-center
    path.lineTo(0, 82.6+ radius);
    path.arcToPoint(
      Offset(radius, 78),
      radius: Radius.circular(radius),
      clockwise: true,
    );
    path.lineTo(size.width * 0.02, 79);

    // Line to the top-right
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: Radius.circular(radius),
      clockwise: true,
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
