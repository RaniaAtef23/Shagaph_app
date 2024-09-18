import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../Category/presentation/views/BirthdayScreen.dart';
import '../../../../Category/presentation/views/PhotoSessionScreen.dart';
import '../../../../Category/presentation/views/membership_screen.dart';

class ListviewWidget extends StatelessWidget {
  ListviewWidget({super.key});

  final List<String> categories = [
    "Membership",
    "Birthday",
    "Photo session",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      // width: 342.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              switch (index) {
                case 0:
                  GoRouter.of(context).go(AppRouter.kMembershipScreen);
                  break;
                case 1:
                  GoRouter.of(context).go(AppRouter.kBirthdayScreen);
                  break;
                case 2:
                  GoRouter.of(context).go(AppRouter.kPhotoSessionScreen);
                  break;
              }
            },
              child: _buildCategoryContainer(categories[index]));
        },
      ),
    );
  }

  Widget _buildCategoryContainer(String category) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 4.w), // Spacing between containers
      child: Container(
        width: 115.w,
        decoration: BoxDecoration(
          color: const Color(0xE6F04C29), // Background color
          borderRadius: BorderRadius.circular(12.r), // Rounded corners
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Glory',
            ),
          ),
        ),
      ),
    );
  }
}
