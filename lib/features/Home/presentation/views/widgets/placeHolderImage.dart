import 'package:flutter/material.dart';

class Placeholderimage extends StatelessWidget {
  final String? imagePath;
  const Placeholderimage({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.fill,
    );
  }
}
