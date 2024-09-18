import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/CategoriesSection.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/ImageCarousel.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/advertisement_list.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/listview_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> advertisements = [
    {'imagePath': 'assets/Frame 1042.png', 'title': 'Ceramics workshop'},
    {'imagePath': 'assets/Frame 1042.png', 'title': 'Painting class'},
    // ... more advertisements
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to start
          children: [
            // Image Carousel
            const ImageCarousel(),

            SizedBox(height: 20.h), // Responsive spacing

            // Advertisement Section
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: AdvertisementList(advertisements: advertisements),
            ),
            SizedBox(height: 10.h), // Responsive spacing

            // ListView Widget
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w), // Responsive padding
              child: ListviewWidget(),
            ),
            SizedBox(height: 20.h), // Responsive spacing

            // Categories Title
            Padding(
              padding: EdgeInsets.only(left: 20.w), // Using width for consistency
              child: Row(
                children: [
                  Expanded( // Added Expanded to avoid overflow
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff383838),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const CategoriesSection(),

            SizedBox(height: 150.h), // Extra spacing at the bottom
          ],
        ),
      ),
    );
  }
}
