import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'CustomTextField.dart';
import 'CustomButton.dart';  // Import CustomButton
import 'HeaderWidget.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void _resetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      GoRouter.of(context).go(AppRouter.kVerifyPasswordScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    final containerWidth = 0.85 * width;
    final containerHeight = 0.50 * height;
    final textPadding = 0.04 * width;

    double getFontSize(double scaleFactor) => scaleFactor * width / 100;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Header(
                  logoAsset: "assets/LOGO FINAL 1.png",
                  backButtonRoute: AppRouter.kLoginScreen,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0388 * height),
                  child: SizedBox(
                    width: containerWidth,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0x80FBD57D),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 0.09 * containerHeight),
                            Padding(
                              padding: EdgeInsets.only(left: textPadding),
                              child: Text(
                                "Forgot Your Password?",
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  color: const Color(0xFF101623),
                                  fontSize: getFontSize(5),
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),
                            Padding(
                              padding: EdgeInsets.only(left: textPadding),
                              child: Text(
                                "Enter your Email, we will send you a confirmation code",
                                style: TextStyle(
                                  color: const Color(0xFFA1A8B0),
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(3.5),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: textPadding),
                              child: CustomTextField(
                                label: "Email",
                                hintText: "Enter your Email",
                                icon: Icons.email_outlined,
                                controller: _emailController,
                                validator: _validateEmail,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: CustomButton(
                                  text: "Reset Password",
                                  onPressed: _resetPassword,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
