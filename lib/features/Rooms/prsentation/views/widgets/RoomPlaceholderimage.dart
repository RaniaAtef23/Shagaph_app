import 'package:flutter/material.dart';

class RoomPlaceholderimage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit; // Add this line to accept a BoxFit parameter

  const RoomPlaceholderimage({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.cover, // Default to BoxFit.cover if not provided
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit, // Use the fit parameter here
    );
  }
}
