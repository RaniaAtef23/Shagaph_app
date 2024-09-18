import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/auth/presentation/views/widgets/CustomButton.dart';
import 'package:shaghaf/features/auth/presentation/views/widgets/CustomTextField.dart';
import 'package:shaghaf/features/auth/presentation/views/widgets/HeaderWidget.dart';
import 'package:shaghaf/features/auth/presentation/views/widgets/NavigationLink.dart';
import '../../../../core/utils/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      GoRouter.of(context).go(AppRouter.kMainScreen); // Navigate to MainSCREEN
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Header(
                logoAsset: "assets/LOGO FINAL 1.png",
                backButtonRoute: AppRouter.kOnboardingScreen,
              ),
              SizedBox(height: screenHeight * 0.05), // Consistent gap between logo and form
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 213, 125, 0.5),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          label: 'Email',
                          hintText: 'Enter your email',
                          icon: Icons.email_outlined,
                          controller: _emailController,
                          validator: _validateEmail,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextField(
                          label: 'Password',
                          hintText: 'Enter your password',
                          icon: Icons.lock_open,
                          isPassword: true,
                          controller: _passwordController,
                          validator: _validatePassword,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () => GoRouter.of(context).go(AppRouter.kForgotPasswordScreen),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w300,
                                height: 1.2,
                                letterSpacing: -0.3,
                                color: const Color.fromRGBO(54, 54, 54, 1),
                              ),
                            ),
                          ),
                        ),
                        CustomButton(
                          text: 'LOGIN',
                          onPressed: _login,
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        NavigationLink(
                          questionText: "Don't have an account? ",
                          actionText: "Sign up",
                          onPressed: () => GoRouter.of(context).go(AppRouter.kSignUpScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1,)
            ],
          ),
        ),
      ),
    );
  }
}
