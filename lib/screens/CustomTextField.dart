import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final Color iconColor; // Add icon color as a parameter

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.iconColor = Colors.red, // Default icon color is red
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Color(0xFFA7A8AC), // Apply icon color directly here
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: const Color(0xFFA7A8AC), // Color for the hint text
          fontWeight: FontWeight.w400, // Weight set to 400
          fontSize: 16, // Size set to 16px
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
      ),
    );
  }
}
