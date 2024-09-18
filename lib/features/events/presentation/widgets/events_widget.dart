import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../themes.dart';

// Reusable OffersWidgetCard
class EventsWidget extends StatelessWidget {
  const EventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body:SingleChildScrollView(
        child: Column(

          children: [
            Padding(
              padding:EdgeInsets.only(left: 18.w, right: 18.w, top: 30.h),
              child: Row(

                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20.sp),
                    onPressed: () {
                      GoRouter.of(context).go(AppRouter.kMainScreen);
                    },
                  ),
                  SizedBox(width: 90.w,),

                  Text(
                    "Events",
                    style: title,
                  ),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Column(
                children: List.generate(4, (index) {
                  // Generates 4 identical rows
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.h), // Add space between rows
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Container
                        Container(
                          width: 163.w,
                          height: 195.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFFFFFFF),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x40000000), // Black shadow with some opacity
                                offset: Offset(0, 4), // Moves the shadow 4 pixels down
                                blurRadius: 4, // Softens the shadow
                                spreadRadius: 0, // Controls the shadow's size
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.network(
                                  'assets/Frame 1000.png', // Sample image
                                  width: 163.w,
                                  height: 108.h,
                                  fit: BoxFit.cover, // Ensures the image fits the container
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.w, left: 8.w,top: 30.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 120.w, // Set the width
                                      height: 38.h, // Set the height
                                      child: Text(
                                        "Positive education workshop",
                                        style: offers_card_grey,
                                        textAlign: TextAlign.left, // Adjust text alignment as needed
                                      ),
                                    ),
                                    Container(
                                      width: 24.w,
                                      height: 24.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: const Color(0xFFF04C29),
                                      ),
                                      child: Icon(Icons.arrow_forward, size: 10.37.sp, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Second Container
                        Container(
                          width: 163.w,
                          height: 195.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFFFFFFF),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x40000000), // Black shadow with some opacity
                                offset: Offset(0, 4), // Moves the shadow 4 pixels down
                                blurRadius: 4, // Softens the shadow
                                spreadRadius: 0, // Controls the shadow's size
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.network(
                                  'assets/event.png', // Sample image
                                  width: 163.w,
                                  height: 108.h,
                                  fit: BoxFit.cover, // Ensures the image fits the container
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.w, left: 8.w,top: 30.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 108.w, // Set the width
                                      height: 38.h, // Set the height
                                      child: Text(
                                        "Ceramics workshop",
                                        style: offers_card_grey,
                                        textAlign: TextAlign.left,
                                        // Adjust text alignment as needed
                                      ),
                                    ),
                                    Container(
                                      width: 24.w,
                                      height: 24.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: const Color(0xFFF04C29),
                                      ),
                                      child: InkWell(
                                        onTap: (){
                                          GoRouter.of(context).go(AppRouter.kDetailsScreen);
                                        },
                                          child: Icon(Icons.arrow_forward, size: 10.37.sp, color: Colors.white)

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
