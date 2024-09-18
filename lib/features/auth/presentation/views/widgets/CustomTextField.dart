import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.04;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.labelTextStyle.copyWith(fontSize: fontSize),
        ),
        const SizedBox(height: 8.0),
        Container(
          constraints: const BoxConstraints(
            maxHeight: 70, // Adjust the height as needed
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: hintText,
              labelStyle: Styles.hintTextStyle.copyWith(fontSize: fontSize * .8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.grey, // Default border color
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.orange, // Focused border color
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.grey, // Default border color
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.red, // Error border color
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.red, // Focused error border color
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: 12.0, // Adjust the vertical padding to control height
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.grey, // Icon color
              ),
              errorStyle: Styles.hintTextStyle.copyWith(
                fontSize: fontSize * 0.8, // Fixed font size for error messages
                color: Colors.red, // Error message color
              ),
            ),
            obscureText: isPassword,
            validator: validator,
            cursorColor: Colors.orange, // Cursor color
          ),
        ),
      ],
    );
  }
}
