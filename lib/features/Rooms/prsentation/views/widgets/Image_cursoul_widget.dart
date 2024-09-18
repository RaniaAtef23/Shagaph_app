import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Use for responsive design
import 'package:go_router/go_router.dart';
import 'package:shaghaf/core/utils/app_router.dart';
import 'RoomPlaceholderimage.dart';

class ImageCarouselWidget extends StatefulWidget {
  const ImageCarouselWidget({super.key});

  @override
  State<ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

final List<String> imagePaths = [
  'assets/e8951a1775b0c342df3b0ba8412ebebd.jpeg',
  'assets/e8951a1775b0c342df3b0ba8412ebebd.jpeg',
  'assets/e8951a1775b0c342df3b0ba8412ebebd.jpeg',
  'assets/e8951a1775b0c342df3b0ba8412ebebd.jpeg',
  'assets/e8951a1775b0c342df3b0ba8412ebebd.jpeg',
  'assets/e8951a1775b0c342df3b0ba8412ebebd.jpeg',
];

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
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
          RoomPlaceholderimage(
            imagePath: imagePaths[index],
            fit: BoxFit.cover,
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
            height: MediaQuery.of(context).size.height * 0.5, // Responsive height
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
                GoRouter.of(context).go(AppRouter.kRoomScreen);
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
            right: 134.0.w,
            top: 50.0.h,
            child: Text(
              'Training Room',
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
                    "roxy",
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
            bottom: 100.0.h,
            left: 25.0.w,
            right: 25.0.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _pages.length,
                    (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                  child: InkWell(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _activePage == index
                            ? const Color(0xffF04C29)
                            : const Color(0xffF04C29).withOpacity(.5),
                      ),
                      child: CircleAvatar(
                        radius: 5.sp,
                        backgroundColor: Colors.transparent,
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
