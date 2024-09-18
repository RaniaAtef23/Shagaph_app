import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).go(AppRouter.kMainScreen);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Contact Us',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24.w, top: 16.h),
        child: Column(
          children: [
            _buildListTile('assets/ph_phone-light (2).png', '015557992', () {}),
            _buildDivider(),
            _buildListTile('assets/logos_facebook.png', 'Shaghaf Co-working space', () {}),
            _buildDivider(),
            _buildListTile('assets/logos_google-gmail.png', 'shagaf@gmail.com', () {}),
            _buildDivider(),
            _buildListTile('assets/skill-icons_instagram.png', 'shagaf@gmail.com', () {}),
            _buildDivider(),
            _buildListTile('assets/uil_snapchat-square.png', 'shagaf@gmail.com', () {}),
            _buildDivider(),
            _buildListTile('assets/logos_tiktok-icon.png', 'shagaf@gmail.com', () {}),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String imagePath, String title, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 24.w,
        height: 24.h,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Comfortaa',
        ),
      ),
      onTap: onTap,
    );
  }

  Divider _buildDivider() {
    return Divider(color: Color(0xffDCDCDC));
  }
}
