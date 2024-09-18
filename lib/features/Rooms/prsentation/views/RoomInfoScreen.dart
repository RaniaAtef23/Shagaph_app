import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/core/utils/app_router.dart';
import 'package:shaghaf/features/Rooms/prsentation/views/widgets/ImageCarousel.dart';
import 'package:shaghaf/features/Rooms/prsentation/views/widgets/amenities_bottom_sheet.dart';
import 'package:shaghaf/features/Rooms/prsentation/views/widgets/amenity_item.dart';
import 'package:shaghaf/features/Rooms/prsentation/views/widgets/plan_bottom_sheet.dart';

class RoomInfoScreen extends StatefulWidget {
  const RoomInfoScreen({super.key});

  @override
  _RoomInfoScreenState createState() => _RoomInfoScreenState();
}

class _RoomInfoScreenState extends State<RoomInfoScreen> {
  String _selectedPlan = '60.0 EGP/Hour'; // Default selected plan

  void _updatePlan(String newPlan) {
    setState(() {
      _selectedPlan = newPlan;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const ImageCarousel(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: SizedBox(height: screenHeight * 0.85), // Adjust based on content
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.4, // Adjust to overlap with the carousel image
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight ,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:  Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Training Room',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Comfortaa',
                              color: const Color(0xffF04C29),
                            ),
                          ),
                           SizedBox(height: 12.0.h),
                          Container(
                            width: screenWidth * 0.3,
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 3.0,
                                  spreadRadius: 1,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 24.h,
                                    width: 24.w,
                                    child: Image.asset('assets/mdi_love-seat-outline.png')),
                                SizedBox(width: 8.0.w),
                                Text(
                                  '30 Seats',
                                  style: TextStyle(
                                    fontSize:14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Comfortaa',
                                    color: const Color(0xff111111),
                                  ),
                                ),
                              ],
                            ),
                          ),
                       SizedBox(height: 12.0.h),
                          SizedBox(
                            height: 65.h,
                            width: 350.w,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff333333),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.0.h),
                          Text(
                            'Amenities',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Comfortaa',
                              color: const Color(0xffF04C29),
                            ),
                          ),
                           SizedBox(height: 12.0.h),
                           Padding(
                            padding: EdgeInsets.only(left: 17.0.w),
                            child: Wrap(
                              spacing: 16.0,
                              runSpacing: 10.0,
                              children: [
                                AmenityItem(icon: 'assets/solar_printer-line-duotone.png', label: 'Printer, Scanner and photocopier'),
                                AmenityItem(icon: 'assets/ion_wifi-outline.png', label: 'Wi-fi'),
                                AmenityItem(icon: 'assets/ph_coffee.png', label: 'Free coffee'),
                                AmenityItem(icon: 'assets/ic_round-ondemand-video.png', label: 'Video Conf'),
                                AmenityItem(icon: 'assets/streamline_screen-broadcast.png', label: 'LED screen'),
                              ],
                            ),
                          ),
                         SizedBox(height: 15.0.h),
                          GestureDetector(
                            onTap: () => showAmenitiesBottomSheet(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 24,
                                    height: 24,
                                    child: Image.asset('assets/material-symbols_double-arrow.png')),
                                SizedBox(width: 8.0.w),
                              ],
                            ),
                          ),
                           SizedBox(height: 16.0.h),
                          Row(
                            children: [
                              SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: Image.asset('assets/ep_location.png')),
                               SizedBox(width: 8.0.w),
                              Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Comfortaa',
                                  color: const Color(0xffF04C29),
                                ),
                              ),
                            ],
                          ),
                           SizedBox(height: 12.0.h),
                          Container(
                            height: screenHeight * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: const DecorationImage(
                                image: AssetImage('assets/Frame 30044.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                           SizedBox(height: 16.0.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0.h,
              left: 0.0.w,
              right: 0.0.w,
              child: Container(
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 9.0,
                      spreadRadius: 2.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => showPlanBottomSheet(context, _updatePlan),
                        child: Row(
                          children: [
                            Text(
                              _selectedPlan,
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Comfortaa',
                                color: const Color(0xffF04C29),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down,size: 24.spMin,color:const Color(0xffF04C29) ,),
                      ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).go(AppRouter.kTime);
                          // Add your action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF04C29),
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.015),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        child: Text(
                          'Select Date',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                            color: Colors.white,
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
      ),
    );
  }
}
