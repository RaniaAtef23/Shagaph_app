import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/auth/presentation/views/widgets/CustomButton.dart';
import 'package:shaghaf/features/auth/presentation/views/widgets/CustomTextField.dart';
import 'package:shaghaf/features/auth/presentation/views/widgets/HeaderWidget.dart';
import 'package:shaghaf/features/auth/presentation/views/widgets/NavigationLink.dart';
import '../../../../core/utils/app_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
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

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      GoRouter.of(context).go(AppRouter.kLoginScreen); // Navigate to Login screen
      // Perform sign up
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
              SizedBox(height: screenHeight * 0.05),
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
                        SizedBox(height: screenHeight * 0.02), // Gap based on screen height
                        CustomTextField(
                          label: 'Name',
                          hintText: 'Enter your name',
                          icon: Icons.person_outline_sharp,
                          controller: _nameController,
                          validator: _validateName,
                        ),
                        SizedBox(height: screenHeight * 0.02), // Gap based on screen height
                        CustomTextField(
                          label: 'Password',
                          hintText: 'Enter your password',
                          icon: Icons.lock_outline,
                          isPassword: true,
                          controller: _passwordController,
                          validator: _validatePassword,
                        ),
                        SizedBox(height: screenHeight * 0.02), // Gap based on screen height
                        CustomTextField(
                          label: 'Confirm Password',
                          hintText: 'Confirm your password',
                          icon: Icons.lock_outline,
                          isPassword: true,
                          controller: _confirmPasswordController,
                          validator: _validateConfirmPassword,
                        ),
                        SizedBox(height: screenHeight * 0.03), // Gap before the button
                        CustomButton(
                          text: 'SIGN UP',
                          onPressed: _signUp,
                        ),
                        SizedBox(height: screenHeight * 0.005), // Gap before navigation link
                        NavigationLink(
                          questionText: "Already have an account? ",
                          actionText: "Login",
                          onPressed: () => GoRouter.of(context).go(AppRouter.kLoginScreen),
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
