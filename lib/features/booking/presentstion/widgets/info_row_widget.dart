import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'info_item_model.dart';
// Import the model class

class InfoRow extends StatelessWidget {
  final InfoItem item;

  const InfoRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          item.imagePath,
          width: 16.w,
          height: 16.h,
          color: const Color(0xFFF04C29),
        ),
        SizedBox(width: 8.w), // Spacing between image and text
        Text(
          item.label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF262626),
            fontFamily: 'Comfortaa',
          ),
        ),
        const Spacer(), // Pushes the last Text to the right
        Text(
          item.value1,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF4E4E4E),
            fontFamily: 'Comfortaa',
          ),
        ),
      ],
    );
  }
}
