import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/CustomTextField.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0F4B5563),
                offset: Offset(2, 2),
                blurRadius: 12.0,
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Change Password',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              const SizedBox(height: 8),
              CustomTextField(
                hasSuffixIcon: true,
                labelText: 'Old Password',
                hintText: "Enter your password",
                icon: Icons.lock_outline,
                isPassword: !_isOldPasswordVisible,
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 8),
              CustomTextField(
                hasSuffixIcon: true,
                labelText: 'New Password',
                hintText: "Enter your password",
                icon: Icons.lock_outline,
                isPassword: !_isNewPasswordVisible,
              ),
              const SizedBox(height: 16),

              // Confirm New Password Field with Label
              const SizedBox(height: 8),
              CustomTextField(
                hasSuffixIcon: true,
                labelText: 'Confirm New Password',
                hintText: "Enter your password",
                icon: Icons.lock_outline,
                isPassword: !_isConfirmPasswordVisible,
              ),

              Gap(300),

              // Save Password Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle password save logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff23262F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 120),
                  ),
                  child: Text(
                    "Save Password",
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
