import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/placeHolderImage.dart';

import '../../../../core/utils/app_router.dart';

class CursoulWidget extends StatefulWidget {
  const CursoulWidget({super.key});

  @override
  State<CursoulWidget> createState() => _ImageCursoulWidgetState();
}

final List<String> imagePaths = [
  'assets/event.png',
  'assets/event.png',
  'assets/event.png',
  'assets/event.png',
  'assets/event.png',
];

class _ImageCursoulWidgetState extends State<CursoulWidget> {
  late List<Widget> _pages;
  int _activePage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      imagePaths.length,
          (index) => Stack(
        fit: StackFit.expand,
        children: [
          Placeholderimage(
            imagePath: imagePaths[index],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  const Color(0xff000000).withOpacity(0.3),
                  const Color(0xff000000).withOpacity(0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 0.5.sh, // Responsive height using ScreenUtil
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              onPageChanged: (value) {
                setState(() {
                  _activePage = value;
                });
              },
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          Positioned(
            left: 18.0.w, // Responsive positioning
            top: 40.0.h,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 17.sp),
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kEventsScreen);
              },
            ),
          ),
          Positioned(
            right: 25.0.w,
            top: 40.0.h,
            child: CircleAvatar(
              radius: 20.sp,
              backgroundColor: Colors.white.withOpacity(0.3),
              child: Center(
                child: IconButton(
                  icon: Image.asset('assets/Vector.png'),
                  onPressed: () {
                    // Add favorite action here
                  },
                ),
              ),
            ),
          ),
          Positioned(
            right: 170.0.w,
            top: 50.0.h,
            child: Text(
              'Events',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Comfortaa',
                color: const Color(0xff111111),
              ),
            ),
          ),
          Positioned(
            bottom: 120.0.h,
            left: 25.0.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              height: 32.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0.r),
                color: const Color(0xffF04C29),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/ep_location (1).png",
                    filterQuality: FilterQuality.high,
                    width: 24.0.w,
                    height: 24.0.h,
                  ),
                  SizedBox(width: 0.0.w),
                  Text(
                    "Roxy",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),


          Positioned(
            bottom: 80.0.h,
            left: 140.0.w,
            right: 2.0.w,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 18.w, bottom: 18.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List<Widget>.generate(
                    _pages.length,
                        (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _activePage == index
                                ? const Color(0xfff04c29)
                                : const Color(0x66f04c29),
                          ),
                          child: CircleAvatar(
                            radius: 6.r,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
