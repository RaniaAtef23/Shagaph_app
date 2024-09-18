import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdertisementItemWidget extends StatelessWidget {
  final String imagePath;


  const AdertisementItemWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
      child: Stack(
        children: [
          Container(
            width: 273.w,
            height: 138.h,
            decoration: BoxDecoration(
              color: const Color(0xff20473E),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child:
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Image.asset(
                      'assets/Frame 1046 (3).png',
                      width: 80.w, // Quarter of the container width
                      height: 150.h, // Full height
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // Text section
          ),
        ],
      ),
    );
  }
}

