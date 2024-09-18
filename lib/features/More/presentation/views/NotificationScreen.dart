import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).go(AppRouter.kMainScreen);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Notification',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: ListView( // Use ListView to prevent overflow
          children: [
            _buildListTile('assets/Ellipse 58.png', 'Ceramics workshop Event', 'today', '12:05 pm', () {}),
            _buildDivider(),
            _buildListTile('assets/Ellipse 58.png', 'Ceramics workshop Event', 'today', '1:15 pm', () {}),
            _buildDivider(),
            _buildListTile('assets/Ellipse 58.png', 'Ceramics workshop Event', 'yesterday', '11:45 am', () {}),
            _buildDivider(),
            _buildListTile('assets/Ellipse 58.png', 'Ceramics workshop Event', 'today', '9:30 am', () {}),
            _buildDivider(),
            _buildListTile('assets/Ellipse 58.png', 'Ceramics workshop Event', 'today', '8:00 am', () {}),
            _buildDivider(),
            _buildListTile('assets/Ellipse 58.png', 'Ceramics workshop Event', 'today', '10:15 am', () {}),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String imagePath, String title, String date, String time, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric( horizontal: 8.w),
        child: Container(
          width: 342.w,

          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(imagePath),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Comfortaa',
                        color: Color(0xff191919),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                            color: Color(0xff242424),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa',
                            color: Color(0xff242424),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return const Divider(
      color: Color(0xffDCDCDC),
      height: 1,
    );
  }
}
