import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323.sp,
      height: 45.sp,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF20473E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
             Radius.circular(10.r), // Rounded top-left corner
               // Square top-right corner
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w), // Padding
          elevation: 0, // No shadow to simulate opacity effect
        ),
        child: Text(
          text,
          style: Styles.textButtom.copyWith(
             fontSize: 14.sp, // Responsive font size
          ),
        ),
      ),
    );
  }
}
