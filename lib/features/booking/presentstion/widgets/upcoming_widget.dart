import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/booking/presentstion/views/info_row_view.dart';
import 'package:shaghaf/themes.dart';
import 'clock.dart';
import 'digital_clock.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 329.h,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/e8951a1775b0c342df3b0ba8412ebebd.jpeg',
                      width: double.infinity,
                      height: 329.h,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: 329.h,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: const Center(child: Clock()),
                        ),
                        SizedBox(height: 20.h),
                        const DigitalClock(),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                child: Container(
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
                        Text("Training Room", style: first_container_large.copyWith(
                          fontFamily: 'Comfortaa',
                        )),
                        Text(
                          "Cancellation Deadline: 11/2/2024",
                          style: TextStyle(
                            color: const Color(0xFFF04C29),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                        const SizedBox(height: 10,),
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
                              "18/2/2024",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF4E4E4E),
                                fontFamily: 'Comfortaa',
                              ),
                            )
                          ],
                        ),
                        InfoList(),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF04C29),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 40.h,
                                child: const Center(
                                  child: Text(
                                    "Extra Time",
                                    style: TextStyle(color: Colors.white, fontFamily: 'Comfortaa',),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 18.w),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xFFF04C29),
                                    width: 1,
                                  ),
                                ),
                                height: 40.h,
                                child: const Center(
                                  child: Text(
                                    "Add Items",
                                    style: TextStyle(color: Color(0xFFF04C29), fontFamily: 'Comfortaa',),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.w),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100.h,)
            ],
          ),

      ),
    );
  }
}
