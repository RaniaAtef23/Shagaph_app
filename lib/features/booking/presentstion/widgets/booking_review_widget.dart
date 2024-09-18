import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/booking/presentstion/views/book_history_screen.dart';
import 'package:timelines/timelines.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../themes.dart';

class BookingReviewWidget extends StatelessWidget {
  const BookingReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            GoRouter.of(context).go(AppRouter.kDetailsScreen);
          },
            child:  Icon(Icons.arrow_back_ios_outlined, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Booking Review',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF0F0F0),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFFFFFFF),
                ),
                width: 342.w,
                height: 120.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Frame 29956.png',
                        width: 100.w,
                        height: 100.w,
                      ),
                      SizedBox(width: 16.w), // Reduced width
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Training room",
                              style: first_container_large.copyWith(fontFamily: 'Comfortaa',),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "inside",
                              style: first_container_small.copyWith(fontFamily: 'Comfortaa',),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15.w), // Reduced width
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD6D6D6),
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset('assets/Frame 29957.png')),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              // Container for the timeline tile
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Booking Details",
                              style: container_title.copyWith(fontFamily: 'Comfortaa',),
                            ),
                            FixedTimeline.tileBuilder(
                              theme: TimelineTheme.of(context).copyWith(
                                nodePosition: 0,
                                color: const Color(0xFFF04C29),
                                indicatorTheme: const IndicatorThemeData(size: 8),
                              ),
                              builder: TimelineTileBuilder.connectedFromStyle(
                                contentsAlign: ContentsAlign.basic,
                                connectorStyleBuilder: (context, index) {
                                  return (index == 1)
                                      ? ConnectorStyle.dashedLine
                                      : ConnectorStyle.dashedLine;
                                },
                                firstConnectorStyle: ConnectorStyle.transparent,
                                lastConnectorStyle: ConnectorStyle.transparent,
                                indicatorStyleBuilder: (context, index) =>
                                    IndicatorStyle.dot,
                                contentsBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: (index == 0)
                                      ? Row(
                                          children: [
                                            Column(
                                              children: [
                                                FittedBox(
                                                  child: Text(
                                                    "Tus, 13 Feb 2024 4:00 PM",
                                                    style: timeline_text.copyWith(fontFamily: 'Comfortaa',),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : FittedBox(
                                          child: Text(
                                            "Tus, 13 Feb 2024 10:00 PM",
                                            style: timeline_text.copyWith(fontFamily: 'Comfortaa',),
                                          ),
                                        ),
                                ),
                                itemCount: 2,
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset('assets/mdi_love-seat-outline.png'),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "1 Seat",
                                  style: seat_style.copyWith(fontFamily: 'Comfortaa',),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 16.w), // Reduced width
                      Container(
                          width: 87.w,
                          height: 43.h,
                          decoration: BoxDecoration(
                            color: const Color(0x54F04C29),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Change",
                              style: first_button_style.copyWith(fontFamily: 'Comfortaa',),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 27.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Method",
                        style: payment_text_style.copyWith(fontFamily: 'Comfortaa',),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "You will not be debited until your booking is confirmed",
                        style: payment_desc_style.copyWith(fontFamily: 'Comfortaa',),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xFFF04C29),
                            size: 16,
                          ),
                          SizedBox(
                            width: 3.h,
                          ),
                          Text(
                            "Add card",
                            style: second_button_style.copyWith(fontFamily: 'Comfortaa',),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      child: Row(
                        children: [
                          Text(
                            "Discounts Available",
                            style: container_title.copyWith(fontFamily: 'Comfortaa',),
                          ),
                          const Spacer(), // Use Spacer to push the next widget to the right
                          Container(
                              width: 99.w,
                              height: 33.h,
                              decoration: BoxDecoration(
                                color: const Color(0x54F04C29),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "Add promo",
                                  style: first_button_style.copyWith(fontFamily: 'Comfortaa',),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xFF9A9A9A), // Grey color for the border
                          width: 1.0, // Border width
                        ),
                      ),
                      height: 42.h,
                      width: 292.12.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 7.w),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/Group.png',
                              width: 22.29.w,
                              height: 17.14.h,
                            ),
                            Expanded(
                              child: Text("30% off  10 booking (up to EGP 150)",
                                  style: form_desc.copyWith(fontFamily: 'Comfortaa',)),
                            ),
                            Container(
                                width: 63.w,
                                height: 26.h,
                                decoration: BoxDecoration(
                                  color: const Color(0x54F04C29),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    "Apply",
                                    style: first_button_style.copyWith(fontFamily: 'Comfortaa',),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(
                              color: Color(0x26000000),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Booking Charges",
                                    style: container_title.copyWith(fontFamily: 'Comfortaa',),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Color(0x26000000),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "x1 Day EGP 100.0 x 1 Seat",
                                    style: first_due.copyWith(fontFamily: 'Comfortaa',),
                                  ),
                                  Text(
                                    "EGP 100.0",
                                    style: first_due.copyWith(fontFamily: 'Comfortaa',),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Due",
                                    style: second_due.copyWith(fontFamily: 'Comfortaa',),
                                  ),
                                  Text(
                                    "EGP 100.0",
                                    style: second_due.copyWith(fontFamily: 'Comfortaa',),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 15.h,
              ),
              InkWell(
                child: book_button,
                onTap: () {

                },
              ),
              SizedBox(
                height: 15.h,
              ),
              cancellation_button,
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
