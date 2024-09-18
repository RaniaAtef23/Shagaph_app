import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Adertisement_list_widget.dart';

class AdvertisementList extends StatelessWidget {
  final List<Map<String, dynamic>> advertisements;

  const AdvertisementList({super.key, required this.advertisements});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.h, bottom: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Advertisement", style: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
                color: const Color(0xff383838),
              )), // Ensure Categories_style is defined
            ],
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 150.h, // Define a fixed height for the advertisements
          child: AdvertisementListWidget(advertisements: advertisements),
        ),
      ],
    );
  }
}
