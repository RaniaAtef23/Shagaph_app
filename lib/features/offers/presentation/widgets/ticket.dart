import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/offers/presentation/widgets/oval_painter.dart';

class SCticketShape extends StatelessWidget {
  const SCticketShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect( // Clip the overflow parts
          borderRadius: BorderRadius.circular(4), // Match the border radius
          child: Container(
            height: 30,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.transparent, // Background color
              border: Border.all(
                color: const Color(0xFFF04C29), // Set the border color to orange
                width: 1, // Border width
              ),
              borderRadius: BorderRadius.circular(4), // Border radius of 4
            ),
            child: CustomPaint(
              painter: OvalPainter(), // Custom painter for the ovals
            ),
          ),
        ),
        // Add the text "Rania" on top of the container
         Text(
          'Shagaf150',
          style: TextStyle(
            color: const Color(0xFF20473E), // Text color
            fontSize: 13.sp,        // Font size
            fontWeight: FontWeight.w400, // Text style
          ),
        ),
      ],
    );
  }
}

