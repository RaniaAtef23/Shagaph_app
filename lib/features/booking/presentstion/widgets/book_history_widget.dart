import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/booking/presentstion/widgets/post_widget.dart';
import 'package:shaghaf/features/booking/presentstion/widgets/upcoming_widget.dart';
import 'package:shaghaf/themes.dart';


class BookHistoryWidget extends StatefulWidget {
  const BookHistoryWidget({super.key});

  @override
  _BookHistoryWidgetState createState() => _BookHistoryWidgetState();
}

class _BookHistoryWidgetState extends State<BookHistoryWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(top:60.h,bottom:30.h, left:24.w,right:24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/material-symbols_notifications-unread-outline.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                  Text(
                    "Booking history",
                    style: title
                  ),
                  Image.asset(
                    'assets/solar_list-broken.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
            ),

            // Parent container with rounded corners
            Padding(
              padding:  EdgeInsets.symmetric( horizontal: 24.w),
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0x0a000000), // Color of unselected tabs
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: -17),
                  dividerColor: Colors.transparent,
                  controller: _tabController,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp),
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: const Color(0xFFF04C29), // Color of selected tab
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the indicator
                  ),
                  tabs: [
                    SizedBox(
                      height:50.h,
                        width: double.infinity,
                        child: const Tab(text: "Past")),
                    SizedBox(
                        height:50.h,
                        width: double.infinity,
                        child: const Tab(text: "Upcoming")),
                  ],
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  PostWidget(),
                  UpcomingWidget(),


                ],
              ),
            ),

          ],
        ),

    );
  }
}
