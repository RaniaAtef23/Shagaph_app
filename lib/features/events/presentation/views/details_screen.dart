import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/events/presentation/views/carsoul.dart';
import 'package:timelines/timelines.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../themes.dart';
import '../../../Home/presentation/views/widgets/ImageCarousel.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  _RoomInfoScreenState createState() => _RoomInfoScreenState();
}

class _RoomInfoScreenState extends State<DetailsScreen> {
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
                  const Carousel(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: SizedBox(height: screenHeight * 0.52),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.4, // Adjust to overlap with the carousel image
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.9,
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
                      offset: const Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text("Details", style: details_style),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FixedTimeline.tileBuilder(
                            theme: TimelineTheme.of(context).copyWith(
                              nodePosition: 0,
                              color: const Color(0xFFF04C29),
                              indicatorTheme: const IndicatorThemeData(size: 10),
                              connectorTheme: const ConnectorThemeData(color: Color(
                                  0x91F04C29),space: 10,thickness: 1,)
                            ),
                            builder: TimelineTileBuilder.connectedFromStyle(
                              contentsAlign: ContentsAlign.basic,
                              connectorStyleBuilder: (context, index) {
                                return ConnectorStyle.dashedLine;
                              },
                              firstConnectorStyle: ConnectorStyle.transparent,
                              lastConnectorStyle: ConnectorStyle.transparent,
                              indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                              contentsBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: SizedBox(
                                    width: screenWidth * 0.85, // Ensure text doesn't overflow
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: SizedBox(
                                        height: (index == 4) ? 100.h : 40.h,
                                        child: Text(
                                          _getTimelineText(index),
                                          style: timeline_text2,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
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
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () =>"",
                        child: Row(
                          children: [
                            Text(
                              "200.0 EGP/Person",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Comfortaa',
                                color: const Color(0xffF04C29),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).go(AppRouter.kBookingreview);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF04C29),
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.013),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          'Book Now',
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

  String _getTimelineText(int index) {
    switch (index) {
      case 0:
        return "We will learn how to make ceramics and use them after that";
      case 1:
        return "The workshop will last for one day and last 3 hours. We will learn about it";
      case 2:
        return "We will learn about the types of clay to differentiate the final result of the product";
      case 3:
        return "How do I make shapes with clay without them cracking?";
      case 4:
        return "We will burn the shapes we made and find out how they burn so that you can use them after that and live with you";
      default:
        return "";
    }
  }
}
