import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static final StyleTitle = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w600,
    color: const Color(0xffffffff),
  );

  static final StyleDesc = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Comfortaa',
    height: 1.4.h,
    letterSpacing: -0.3,
    fontWeight: FontWeight.w400,
    color: const Color(0xffFFC100),
  );

  static final StyleSkip = TextStyle(
    fontSize: 17.sp,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w400,
    color: const Color(0xffffffff),
  );

  static final buttonTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    fontFamily: 'Comfortaa',
  );

  static final labelTextStyle = TextStyle(
    fontFamily: 'Comfortaa',
    color: const Color(0xFF2F2F2F),
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static final hintTextStyle = TextStyle(
    color: const Color(0xFF969696),
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Comfortaa',
  );

  static final questionTextStyle = TextStyle(
    fontFamily: 'Comfortaa',
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    height: 11.15.sp / 10.sp,
    letterSpacing: -0.3.sp,
    color: const Color(0xFF00523F),
  );

  static final actionTextStyle = TextStyle(
    fontFamily: 'Comfortaa',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 13.38.sp / 12.sp,
    letterSpacing: -0.3.sp,
    color: Colors.red,
  );

  static final textButtom = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    fontFamily: 'Comfortaa',
  );

  static final forgetPass = TextStyle(
    fontFamily: 'Comfortaa',
    color: const Color(0xFF101623),
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  );

  static final LocationTextStyle = TextStyle(
    fontFamily: 'Comfortaa',
    color: const Color(0xFFFFFFFF),
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static final RatingTextStyle = TextStyle(
    fontFamily: 'Comfortaa',
    color: const Color(0xFFFFFFFF),
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  );

  static final Container_text = TextStyle(
    color: Colors.white,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Comfortaa',
  );

  static final Categories_style = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Comfortaa',
    fontWeight: FontWeight.w400,
    color: const Color(0xff383838),
  );



  static final StyleRooms = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Comfortaa',
    height: 1.4.h,
    letterSpacing: -0.3,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );
}
