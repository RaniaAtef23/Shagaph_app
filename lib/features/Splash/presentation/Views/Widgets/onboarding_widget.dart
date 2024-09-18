import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter
import '../../../../../core/utils/styles.dart';
import '../../../data/models/onboarding_info.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF146356),
      body: PageView.builder(
        controller: controller,
        itemCount: contents.length,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return ListView(
            children: [
              SizedBox(height: 40.h),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      child: Text(
                        "Skip",
                        style: Styles.StyleSkip.copyWith(fontSize: 17.sp),
                      ),
                      onPressed: () {
                        // Navigate using GoRouter
                        GoRouter.of(context).go('/signup');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.only(top: 0.h, left: 40.w, right: 20.w),
                child: Image.asset(
                  contents[i].image,
                  width: 350.w,
                  height: 350.h,
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(top: 2.h, left: 40.w, right: 40.w),
                child: Text(
                  contents[i].title,
                  style: Styles.StyleTitle.copyWith(fontSize: 20.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 20.w, bottom: 16.h),
                child: Text(
                  contents[i].description,
                  style: Styles.StyleDesc.copyWith(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                      (index) => Container(
                    height: currentIndex == index
                        ? MediaQuery.of(context).size.width * 0.03
                        : MediaQuery.of(context).size.width * 0.02,
                    width: currentIndex == index
                        ? MediaQuery.of(context).size.width * 0.03
                        : MediaQuery.of(context).size.width * 0.02,
                    margin: EdgeInsets.only(right: 7.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                      color: index == currentIndex
                          ? const Color(0xffF04C29)
                          : const Color(0xff82573f),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  top: MediaQuery.of(context).size.height * 0.04,
                  right: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.15,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    color: Color(0xff20473E),
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex == contents.length - 1) {
                        // Navigate using GoRouter
                        GoRouter.of(context).go('/signup');
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                        setState(() {
                          currentIndex++;
                        });
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: const Color(0xffFFFFFF),
                      size: 32.sp,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
