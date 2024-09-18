import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/More/presentation/views/widgets/ProfileTextField.dart';
import '../../../../core/utils/app_router.dart';
import '../../../auth/presentation/views/widgets/CustomTextField.dart'; // Assuming CustomTextField is CTextField here

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your new password';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform the form submission or data saving logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize = 20 * (screenWidth / 375); // Adjust this base size as needed

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).go(AppRouter.kMainScreen); // Navigate to the settings screen
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: titleFontSize, // Use the responsive font size
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CTextField(
                    label: 'Full Name',
                    hintText: 'Enter your full name',
                    icon: null,
                    isPassword: false,
                    controller: _nameController,
                    validator: _validateName,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CTextField(
                    label: 'Phone Number',
                    hintText: '0123456789',
                    icon: null,
                    isPassword: false,
                    controller: _phoneController,
                    validator: _validatePhone,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CTextField(
                    label: 'Change Password',
                    hintText: 'Enter your new password',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: _passwordController,
                    validator: _validatePassword,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CTextField(
                    label: 'Confirm Password',
                    hintText: 'Confirm your new password',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: _confirmPasswordController,
                    validator: _validateConfirmPassword,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
