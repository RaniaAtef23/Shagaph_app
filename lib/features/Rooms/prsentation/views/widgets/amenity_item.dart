import 'package:flutter/material.dart';

class AmenityItem extends StatelessWidget {
  final String icon;
  final String label;
  final String? description;

  const AmenityItem({
    super.key,
    required this.icon,
    required this.label,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 24,
                height: 24,
                child: Image.asset(icon,fit: BoxFit.cover,)),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Responsive font size
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Comfortaa',
                  color: const Color(0xff585858),
                ),
              ),
            ),
          ],
        ),
        if (description != null) ...[
          const SizedBox(height: 4.0),
          Text(
            description!,
            style: TextStyle(
              fontSize: screenWidth * 0.03, // Responsive font size
              fontWeight: FontWeight.w400,
              fontFamily: 'Comfortaa',
              color: const Color(0xff585858),
            ),
          ),
        ],
      ],
    );
  }
}
