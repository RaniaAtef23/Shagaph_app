import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/booking/presentstion/views/info_row_view.dart';

import '../../../../themes.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // First Container
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
            child: Container(
              // Remove fixed height to avoid overflow
              // height: 246.h,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Training Room", style: first_container_large.copyWith(fontFamily: 'Comfortaa',)),
                    // Remove or adjust the SizedBox here
                    SizedBox(height: 6.h), // Adjust the height or remove this line
                    Row(
                      children: [
                        Image.asset(
                          'assets/clarity_date-line.png',
                          width: 16.w,
                          height: 16.h,
                          color: const Color(0xFFF04C29),

                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF262626),
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "15/2/2024",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4E4E4E),
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                      ],
                    ),
                    InfoList(),
                  ],
                )

              ),
            ),
          ),

          // Second Container
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
            child: Container(
              // height: 220.h, // Remove fixed height
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Meeting Room", style: first_container_large.copyWith(fontFamily: 'Comfortaa',)),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/clarity_date-line.png',
                          width: 16.w,
                          height: 16.h,
                          color: const Color(0xFFF04C29),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF262626),
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "15/2/2024",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4E4E4E),
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                      ],
                    ),
                    InfoList(),
                  ],
                ),
              ),
            ),
          ),

          // Third Container
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
            child: Container(
              // height: 220.h, // Remove fixed height
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Funny Room", style: first_container_large.copyWith(fontFamily: 'Comfortaa',)),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/clarity_date-line.png',
                          width: 16.w,
                          height: 16.h,
                          color: const Color(0xFFF04C29),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF262626),
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "10/2/2024",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4E4E4E),
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                      ],
                    ),
                    InfoList(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 100.h,)
        ],
      ),
    );
  }
}
