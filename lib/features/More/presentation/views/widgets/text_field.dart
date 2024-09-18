import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import screen_utils
import '../../../../../core/utils/styles.dart';

class CTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CTextField({
    required this.label,
    required this.hintText,
    this.icon,
    required this.isPassword,
    this.controller,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for this widget's context
    ScreenUtil.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.labelTextStyle.copyWith(fontSize: 14.sp), // Scalable font size
        ),
        SizedBox(height: 10.0.h), // Scalable vertical spacing
        Container(
          height: 31.h,
          width: 342.w,
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            validator: validator,
            cursorColor: Colors.orange,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Styles.hintTextStyle, // Scalable hint text size
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.0.w, // Scalable horizontal padding
                vertical: 0.0.h, // Scalable vertical padding
              ),
              prefixIcon: icon != null
                  ? Icon(icon, color: Colors.grey, size: 16.sp) // Scalable icon size
                  : null, // Conditionally showing the icon
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r), // Scalable border radius
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r), // Scalable border radius
                borderSide: const BorderSide(color: Colors.orange, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r), // Scalable border radius
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r), // Scalable border radius
                borderSide: const BorderSide(color: Colors.red, width: 1.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r), // Scalable border radius
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
              errorStyle: Styles.hintTextStyle.copyWith(
                fontSize: 12.sp, // Scalable error text size
                color: Colors.red, // Error message color
              ),
            ),
          ),
        ),
      ],
    );
  }
}
