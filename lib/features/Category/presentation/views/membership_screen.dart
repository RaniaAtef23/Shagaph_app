import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timelines/timelines.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../themes.dart';
import '../../../booking/presentstion/views/book_history_screen.dart';
class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  bool _isChecked = false;
  bool _isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: InkWell(
          onTap: (){
            GoRouter.of(context).go(AppRouter.kMainScreen);
          },
            child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Membership',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
        Padding(
          padding:EdgeInsets.only(left: 10.w),
          child: Row(
          children: [
        
               // Add spacing between text and checkbox
          Checkbox(
        
        
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false; // Update the state when tapped
              });
            },
            activeColor: Color(0xFFF04C29), // Checkbox color when selected
            checkColor: Colors.white,
            side: BorderSide(color: Colors.yellow, width: 1,),
        
        
          ),
        
            Text(
              "A month",
              style: TextStyle(
                color: Color(0xFF383838),
                fontFamily: 'Comfortaa',
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
              ),
        ),
            Container(
              decoration: BoxDecoration(
                color:  Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
        
              ),
        width: 342.w,
              height: 250.h,
              child:     Padding(
                padding:  EdgeInsets.only(left: 13.w),
                child: FixedTimeline.tileBuilder(
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
                          child:
                            Padding(
                              padding: (index==0)? EdgeInsets.only(top: 40.h):EdgeInsets.only(),
                              child: SizedBox(
                               height: 60.h,
                                child: Text(
                                  _getTimelineText(index),
                                  style: timeline_text2,
        
                              ),
                                                      ),
                            ),
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h,),
            Padding(
              padding:EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
        
                  // Add spacing between text and checkbox
                  Checkbox(
        
        
                    value: _isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked2= value ?? false; // Update the state when tapped
                      });
                    },
                    activeColor: Color(0xFFF04C29), // Checkbox color when selected
                    checkColor: Colors.white,
                    side: BorderSide(color: Colors.yellow, width: 1,),
        
        
                  ),
        
                  Text(
                    "15 Separate days",
                    style: TextStyle(
                      color: Color(0xFF383838),
                      fontFamily: 'Comfortaa',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color:  Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
        
              ),
              width: 342.w,
              height: 180.h,
              child:     Padding(
                padding:  EdgeInsets.only(left: 13.w),
                child: FixedTimeline.tileBuilder(
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
                    lastConnectorStyle: ConnectorStyle.dashedLine,
                    indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                    contentsBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: SizedBox(
                          width: screenWidth * 0.85, // Ensure text doesn't overflow
                          child:
                          Padding(
                            padding: (index==0)? EdgeInsets.only(top: 10.h):EdgeInsets.only(top: 50.h),
                            child: SizedBox(
                              height: (index==0)?20.h:80.h,
                              child: Text(
                                _getTimelineText2(index),
                                style: timeline_text2,
        
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 140.h,),
            InkWell(
              child: next_button,
              onTap: () {
        
              },
            ),
            SizedBox(height: 50.h,),
          ],
        ),
      ) ,

    );
  }

  String _getTimelineText(int index) {
    switch (index) {
      case 0:
        return "1250 LE for one person";
      case 1:
        return "included daily drink and movie night for you and your friends";
      case 2:
        return "4 invitations for your friends  spend a day in Shagaf included drink ";
      default:
        return "";
    }
  }
  String _getTimelineText2(int index) {
    switch (index) {
      case 0:
        return "750 LE for one person";
      case 1:
        return "One invitation for your friends  spend a day in Shagaf included drink ";

      default:
        return "";
    }
  }
}



