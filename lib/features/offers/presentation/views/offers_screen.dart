import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/offers/presentation/widgets/offers_widget.dart';

import '../../../../themes.dart';

class OffersGridPage extends StatelessWidget {
  const OffersGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/material-symbols_notifications-unread-outline.png',
                width: 24.w,
                height: 24.h,
              ),
              Text(
                "Offers",
                style: title,
              ),
              Image.asset(
                'assets/solar_list-broken.png',
                width: 24.w,
                height: 24.h,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 30.h, bottom: 90.h), // Add padding around the grid
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 163.w / 195.h, // Adjust based on design aspect ratio
                ),
                itemCount: 8, // Display 8 offers
                itemBuilder: (context, index) {
                  return const OffersWidgetCard(); // Reusable offer card
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
