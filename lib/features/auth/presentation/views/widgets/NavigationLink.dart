import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class NavigationLink extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onPressed;

  const NavigationLink({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero, // Remove default padding if needed
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questionText,
              style: Styles.questionTextStyle.copyWith(
                fontSize: 10.sp, // Responsive font size
              ),
            ),
            SizedBox(width: 4.w), // Add gap between texts
            Text(
              actionText,
              style: Styles.actionTextStyle.copyWith(
                fontSize: 12.sp, // Responsive font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
