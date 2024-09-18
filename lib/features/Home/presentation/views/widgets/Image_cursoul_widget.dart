import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/placeHolderImage.dart';

class ImageCursoulWidget extends StatefulWidget {
  const ImageCursoulWidget({super.key});

  @override
  State<ImageCursoulWidget> createState() => _ImageCursoulWidgetState();
}

final List<String> imagePaths = [
  'assets/home_background.png',
  'assets/home_background.png',
  'assets/home_background.png',
  'assets/home_background.png',
  'assets/home_background.png',
  'assets/home_background.png',
];

class _ImageCursoulWidgetState extends State<ImageCursoulWidget> {
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
            right: 9.0.w,
            top: 50.h,
            child: IconButton(
              icon: Image.asset(
                'assets/material-symbols_notifications-unread-outline.png',
                fit: BoxFit.contain,
                height: 32.h,
                width: 34.w,
                color: Colors.white,
              ),
              onPressed: () {
                // Add your notification action here
              },
            ),
          ),
          Positioned(
            bottom: 105.h,
            left: 25.w,
            child: Container(
              width: 93.w,
              height: 29.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: const Color(0xffF04C29),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Image.asset(
                      "assets/ep_location.png",
                      filterQuality: FilterQuality.high,
                      width: 21.w,
                      height: 21.h,
                    ),
                  ),
                  SizedBox(width: 4.w), // Padding between icon and text
                  Text(
                    "Location",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: const Color(0xFFFFFFFF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 51.h,
            left: 25.w,
            child: Row(
              children: [
                Container(
                  child: Text(
                    "Delightful open air",
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: 22.3 / 20.h,
                      letterSpacing: -0.3.w,
                      color: const Color(0xffFFFFFF),
                    ),
                  ),
                ),
                SizedBox(width: 100.w),
                Padding(
                  padding: EdgeInsets.only(bottom: 13.h, left: 5.w),
                  child: Container(
                    width: 51.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF04C29).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/fluent-emoji-flat_star.png",
                          fit: BoxFit.contain,
                          width: 20.w,
                          height: 15.h,
                        ),
                        SizedBox(width: 4.w),
                        Padding(
                          padding: EdgeInsets.only(right: 4.0.w, top: 1.h),
                          child: Text(
                            "4.7",
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0.h,
            left: 3.0.w,
            right: 2.0.w,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(.25),
                    blurRadius: 0.5,
                    spreadRadius: 29.0,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
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
                                ? const Color(0xffF36E52)
                                : const Color(0xffD49572),
                          ),
                          child: CircleAvatar(
                            radius: 6.5.r,
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
