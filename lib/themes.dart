import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
final TextStyle title=TextStyle(
    color: const Color(0xFF111111),
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  fontFamily: 'Comfortaa'
);

final TextStyle first_container_large=TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: const Color(0xFF111111),
    fontFamily: 'Comfortaa'
);
final TextStyle details_style=TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: const Color(0xFFF04C29),
    fontFamily: 'Comfortaa'
);
final TextStyle first_container_small=TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: const Color(0xFF555555),
    fontFamily: 'Comfortaa'
);
final TextStyle container_title=TextStyle(
    fontWeight: FontWeight.w500,fontSize: 14.sp,color: const Color(0xFF000000),
    fontFamily: 'Comfortaa'
);
final TextStyle timeline_text=TextStyle(
    fontSize: 10.sp,fontWeight: FontWeight.w400,color: const Color(0xBD494949),
    fontFamily: 'Comfortaa'
);
final TextStyle timeline_text2=TextStyle(
    fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xFF383838),
    fontFamily: 'Comfortaa'
);
final TextStyle seat_style=TextStyle(
    fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xBD494949),
    fontFamily: 'Comfortaa'
);
final TextStyle first_button_style=TextStyle(
    fontSize: 12.sp,fontWeight: FontWeight.w400,color: const Color(0xFFF04C29),
    fontFamily: 'Comfortaa'
);
final TextStyle payment_text_style=TextStyle(
    fontSize: 14.sp,fontWeight: FontWeight.w400,color: const Color(0xFF000000),
    fontFamily: 'Comfortaa'
);
final TextStyle payment_desc_style=TextStyle(
    fontSize: 10.sp,fontWeight:FontWeight.w400,color:const Color(0xBD494949),
    fontFamily: 'Comfortaa'
);
final TextStyle second_button_style=TextStyle(
    fontSize: 10.sp,fontWeight: FontWeight.w400,color: const Color(0xBD494949),
    fontFamily: 'Comfortaa'
);
final TextStyle form_desc=TextStyle(
  fontSize: 11.sp,
  fontWeight: FontWeight.w500,
  color: const Color(0xFF6A6A6A),
    fontFamily: 'Comfortaa'
);
final TextStyle offers_desc=TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF20473E),
    fontFamily: 'Comfortaa'
);
final TextStyle first_due=TextStyle(
    fontSize: 14.sp,fontWeight: FontWeight.w500,color: const Color(
    0xFF464646),
    fontFamily: 'Comfortaa'
);
final TextStyle second_due=TextStyle(
    fontSize: 14.sp,fontWeight: FontWeight.w500,color: const Color(
    0xFFF04C29),
    fontFamily: 'Comfortaa'
);
final Container book_button=Container(
  width: 342.w,
  height: 51.h,
  decoration: BoxDecoration(
    color: const Color(0xFF20473E),
    borderRadius: BorderRadius.circular(10),
  ),
  child: const Center(
    child: Text(
      "Book",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFFFFFFFF),
          fontFamily: 'Comfortaa'
      ),
    ),
  ),
);
final Container next_button=Container(
  width: 342.w,
  height: 51.h,
  decoration: BoxDecoration(
    color: const Color(0xFF20473E),
    borderRadius: BorderRadius.circular(10),
  ),
  child: const Center(
    child: Text(
      "Next",
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFFFFF),
          fontFamily: 'Comfortaa'
      ),
    ),
  ),
);
final Container cancellation_button=Container(
  width: 342.w,
  height: 51.h,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),
  child: const Center(
    child: Text(
      "Cancellation Policy",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF455A64),
          fontFamily: 'Comfortaa'
      ),
    ),
  ),
);
final TextStyle offers_card=TextStyle(
    fontSize: 14.sp,fontWeight: FontWeight.w400,color: const Color(
    0xFF0A0A0A),
    fontFamily: 'Comfortaa'
);
final TextStyle offers_card_grey=TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF252525),
    fontFamily: 'Comfortaa'
);