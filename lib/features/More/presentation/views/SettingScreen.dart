import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? selectedLanguage;

  final Map<String, String> languages = {
    'en': 'English',
    'ar': 'Arabic',
    'es': 'Spanish',
    'fr': 'French',
  };

  final TextStyle listTileTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Comfortaa',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Image.asset(
            'assets/material-symbols_notifications-unread-outline.png',
            width: 17.w,
            height: 20.h,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
          style: listTileTextStyle.copyWith(
              color: Color(0xff111111), fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Image.asset(
              'assets/solar_list-broken.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kProfileScreen);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.account_circle_outlined,
                          color: const Color(0xffF04C29), size: 20.sp),
                      Text("Profile",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Comfortaa'))
                    ],
                  ),
                ),
              ),
              _buildDivider(),
              Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: Row(
                    children: [
                      Icon(Icons.language_outlined,
                          color: const Color(0xffF04C29), size: 20.sp),
                      Text(selectedLanguage ?? 'English',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Comfortaa')),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            _showLanguageDialog();
                          },
                          child: Icon(Icons.keyboard_arrow_down_outlined,
                              color: Color(0xffF04C29), size: 30.sp)),
                    ],
                  )),
              _buildDivider(),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kOrdersScreen);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart_outlined,
                          color: const Color(0xffF04C29), size: 20.sp),
                      Text('Orders',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Comfortaa'))
                    ],
                  ),
                ),
              ),
              _buildDivider(),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kNotificationScreen);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.notifications_outlined,
                          color: const Color(0xffF04C29), size: 20.sp),
                      Text('Notifications',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Comfortaa'))
                    ],
                  ),
                ),
              ),
              _buildDivider(),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kContactUsScreen);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.contact_page_outlined,
                          color: const Color(0xffF04C29), size: 20.sp),
                      Text('Contact Us',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Comfortaa'))
                    ],
                  ),
                ),
              ),
              _buildDivider(),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.message_outlined,
                          color: const Color(0xffF04C29), size: 20.sp),
                      Text('About Us',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Comfortaa'))
                    ],
                  ),
                ),
              ),
              _buildDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(color: Color(0xffDCDCDC), height: 1); // Set height to minimize space
  }

  void _showLanguageDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Language',
            style: TextStyle(
              fontSize: 18.sp, // Responsive font size for the title
              fontWeight: FontWeight.bold,
              fontFamily: 'Comfortaa',
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: languages.entries.map((entry) {
                return ListTile(
                  title: Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: 16.sp, // Responsive font size for the list items
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedLanguage = entry.value;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
