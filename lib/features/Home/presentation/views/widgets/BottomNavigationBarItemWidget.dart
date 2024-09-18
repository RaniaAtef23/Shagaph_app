import 'package:flutter/material.dart';

class BottomNavigationBarItemWidget extends StatelessWidget {
  final String imagePath; // Image path for the icon
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavigationBarItemWidget({super.key, 
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final labelSize = screenWidth * 0.025; // Adjust label size based on screen width

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenWidth * 0.15, // Height based on screen width
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // Horizontal padding based on screen width
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: screenWidth * 0.08, // Icon size based on screen width
              color: isSelected ? const Color(0xff20473E) : const Color(0xff5E5F60),
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenWidth * 0.015), // Space based on screen width
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? const Color(0xff20473E) : const Color(0xff5E5F60),
                  fontSize: labelSize, // Use dynamic label size
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
