import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/offers/presentation/widgets/ticket.dart';


import '../../../../themes.dart';

// Reusable OffersWidgetCard
class OffersWidgetCard extends StatelessWidget {
  const OffersWidgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 163.w,
        height: 230.h,
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
              child: Image.asset(
                'assets/Frame 1080.png', // Sample image
                width: 163.w,
                height: 108.h,
                fit: BoxFit.cover, // Ensures the image fits the container
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6.h, right: 8.w, left: 8.w),
              child: Text("Today’s offer", style: offers_card),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.only(right: 8.w, left: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 108.w, // Set the width
                    height: 38.h, // Set the height
                    child: Text(
                      "10% discount on 3 hours or more",
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
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Stack(
              alignment: Alignment.center, // Align the dialog towards the top
              children: [
                Positioned(
                  top: 258.h, // Adjust this value to move it higher or lower
                  child: Material(
                    type: MaterialType.transparency, // Makes the background transparent
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width , // Dialog width
                      child: AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min, // Avoid extra space
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 0.w, left: 0.w, top: 12.h),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/Vector2.png',
                                        width: 22.29.w,
                                        height: 17.14.h,
                                      ),
                                      SizedBox(width: 8.w),
                                      Expanded(
                                        child: Text(
                                          "30% off 10 bookings (up to EGP 150)",
                                          style: offers_desc,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  const SCticketShape(), // Custom widget
                                ],
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFF04C29),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 45.w),
                              ),
                              child: Text(
                                "Copy",
                                style: TextStyle(
                                  color: const Color(0xFFF3F3F3),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  fontFamily: 'Comfortaa',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },

    );
  }
}
