import 'package:flutter/material.dart';

class CircularAvatarWidget extends StatelessWidget {
  final String imagePath;

  const CircularAvatarWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CircleAvatar(
      radius: screenWidth * 0.10, // Radius based on screen width
      backgroundImage: AssetImage(imagePath),
    );
  }
}
