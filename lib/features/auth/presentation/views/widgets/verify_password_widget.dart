import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shaghaf/features/auth/presentation/views/widgets/CustomButton.dart';
import 'HeaderWidget.dart'; // Import HeaderWidget

import '../../../../../core/utils/app_router.dart';

class VerifyPasswordWidget extends StatelessWidget {
  const VerifyPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    // Define responsive proportions
    final containerWidth = 0.85 * width;
    final containerHeight = 0.50 * height;
    final textPadding = 0.04 * width; // Example padding value
    const buttonWidth = 323.0;
    const buttonHeight = 39.0;
    double getFontSize(double scaleFactor) => scaleFactor * width / 100;

    // Focus nodes for each OTP field
    final focusNodes = List<FocusNode>.generate(6, (index) => FocusNode());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
              const Header(
              logoAsset: "assets/LOGO FINAL 1.png",
              backButtonRoute: AppRouter.kLoginScreen,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.04 * height),
              child: Column(
                  children: [
              Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Container(
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0x80FBD57D), // 50% opacity background color
                ),
                child: Column(
                  children: [
                    SizedBox(height: 0.09 * containerHeight),
                    // Responsive spacing
                    Padding(
                      padding: EdgeInsets.only(left: textPadding),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter Verification Code",
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              color: const Color(0xFF101623),
                              fontSize: getFontSize(5),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 9),
                    // Responsive spacing
                    Padding(
                      padding: EdgeInsets.only(left: textPadding),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Enter the code we have sent to your number",
                              style: TextStyle(
                                color: const Color(0xFFA1A8B0),
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                fontSize: getFontSize(3.5),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: textPadding),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "012345678***",
                            style: TextStyle(
                              color: const Color(0xFF101623),
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(3),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Responsive spacing
                    // Manually create a row of TextFormField widgets with spacing and focus control
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          _buildOtpDigitField(
                            context,
                            focusNodes[i],
                            focusNodes[i + 1],
                            getFontSize(8),
                          ),
                        SizedBox(width: getFontSize(8)), // Spacer
                        for (int i = 3; i < 6; i++)
                          _buildOtpDigitField(
                            context,
                            focusNodes[i],
                            i < 5 ? focusNodes[i + 1] : null,
                            getFontSize(8),
                          ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Responsive spacing
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomButton(
                          text: "Verify",
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min, // Use min to avoid taking up extra space
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // Use Image.asset for assets rather than Image.network
                                      Image.asset("assets/verification_image.png"),
                                      Text(
                                        'Success',
                                        style: TextStyle(
                                          color: const Color(0xFF101623), // Corrected color value
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(5),
                                          fontFamily: 'Comfortaa',
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'You have successfully reset',
                                          style: TextStyle(
                                            color: const Color(0xFFA1A8B0), // Corrected color value
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(4),
                                            fontFamily: 'Comfortaa',
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'your password.',
                                          style: TextStyle(
                                            color: const Color(0xFFA1A8B0), // Corrected color value
                                            fontWeight: FontWeight.w400,
                                            fontSize: getFontSize(4),
                                            fontFamily: 'Comfortaa',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          GoRouter.of(context).go(AppRouter.kLoginScreen);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: const Color(0xFF20473E), // Green background
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10), // Circular border
                                          ),
                                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                                          minimumSize: const Size(buttonWidth / 2, buttonHeight), // Padding inside the button
                                        ),
                                        child: Text(
                                          "Done",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: getFontSize(4),
                                            fontFamily: 'Comfortaa',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05,),
                  ],
                ),
              ),
              )],
            ),
          ),
          SizedBox(height: height * 0.1,),
          ],
        ),
      ),
    ),
    ),
    );
  }

  Widget _buildOtpDigitField(BuildContext context, FocusNode currentFocus, FocusNode? nextFocus, double fieldWidth) {
    return Container(
      width: fieldWidth,
      height: fieldWidth * 1.2,
      margin: EdgeInsets.symmetric(horizontal: fieldWidth * 0.1),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF04C29), width: 2),
        ),
      ),
      child: TextFormField(
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fieldWidth * 0.6),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: "", // Hide the counter text
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
      ),
    );
  }
}
