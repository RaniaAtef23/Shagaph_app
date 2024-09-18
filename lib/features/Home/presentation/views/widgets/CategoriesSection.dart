import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/FlippedBottomLeftContainerClipper.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/FlippedBottomRightContainerClipper.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/TopContainerClipper.dart';
import 'package:shaghaf/features/Rooms/prsentation/views/main_room_screen.dart';

import '../../../../../core/utils/app_router.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h,bottom: 15.h,left: 20.w,right: 20.w),
      child: Stack(
        children: [
          // Top Container
          InkWell(
            onTap: (){
              GoRouter.of(context).go(AppRouter.kRoomScreen);
            },
            child: ClipPath(
              clipper: TopContainerClipper(),
              child: Container(
                width: double.infinity,
                height: 220.h,
                color: const Color(0xA620473E),
                child: Center(
                  child: Row(

                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 30.w,bottom: 40.h),
                        child: Text("Rooms", style:  TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Comfortaa',
                        )),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(bottom: 50.h,left: 85.w),
                        child: Image.asset(
                          "assets/Game day-amico 2.png",
                          width: 120.w,
                          height: 150.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 170.h),
            child: Row(
              children: [
                // Flipped Left Container
                Flexible(
                  flex: 1,
                  child: ClipPath(
                    clipper: FlippedBottomLeftContainerClipper(),
                    child: InkWell(
                      onTap: (){
                        GoRouter.of(context).go(AppRouter.kOrdersScreen);
                      },
                      child: Container(
                        color: const Color(0xA6F04C29),
                        height: 230.h,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: 40.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Text("Orders", style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Comfortaa',
                                  )),
                                ),
                                Image.asset(
                                  "assets/Ecommerce web page-amico 1.png",
                                  width: 120.w,
                                  height: 120.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Space between containers

                // Flipped Right Container
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      GoRouter.of(context).go(AppRouter.kEventsScreen);
                    },
                    child: ClipPath(
                      clipper: FlippedBottomRightContainerClipper(),
                      child: Container(
                        height: 230.h,
                        color: const Color(0xA6FFCC0A),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 40.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left:28 .w),
                                  child: Text("Events", style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Comfortaa',
                                  )),
                                ),
                                Image.asset(
                                  "assets/Prototyping process-amico (1) 1.png",
                                  width: 120.w,
                                  height: 120.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Container_text {
}

