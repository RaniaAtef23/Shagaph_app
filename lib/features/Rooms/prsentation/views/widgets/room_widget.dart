import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/core/utils/app_router.dart';
import 'package:shaghaf/core/utils/styles.dart';

class RoomWidget extends StatefulWidget {
  final String name;
  final String image;

  const RoomWidget({super.key, required this.name, required this.image});

  @override
  State<RoomWidget> createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).go(AppRouter.kRoominfoScreen);
      },
      child: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Container(
          width: double.infinity,
          height: 230.h,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 5.0,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    widget.image,
                    width: double.infinity,
                    height: 170.h,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/Vector.png')
                    ),
                  ),
                  Positioned(
                    bottom: 7.h,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 13.h, left: 5.w),
                      child: Container(
                        width: 51.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffF04C29).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/fluent-emoji-flat_star.png",
                              fit: BoxFit.contain,
                              width: 20.w,
                              height: 15.h,
                            ),
                            SizedBox(width: 4.w),
                            Padding(
                              padding: EdgeInsets.only(right: 4.0.w, top: 1.h),
                              child: Text(
                                "4.7",
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Text(
                  widget.name,
                  style: Styles.StyleRooms,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
