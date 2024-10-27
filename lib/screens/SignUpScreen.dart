import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomTextField.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0F4B5563), // 6% opacity gray shadow color
                offset: Offset(2, 2), // position of the shadow
                blurRadius: 12.0, // blur intensity
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Sign Up',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0, // Remove AppBar default shadow
            foregroundColor: Colors.black, // Set color for icons and text
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Name TextField
              const CustomTextField(
                hintText: 'Enter your name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              // Email TextField
              const CustomTextField(
                hintText: 'Enter your email',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              // Password TextField
              const CustomTextField(
                hintText: 'Enter your password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              // Terms and Conditions
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0), // Adjust padding as needed
                      child: RichText(
                        text: TextSpan(
                          text: "I agree to the medidoc ",
                          style: GoogleFonts.inter(
                              color: Color(0xFF4F5159),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: "Terms of Service",
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle Terms of Service tap
                                },
                            ),
                            TextSpan(
                              text: " and ",
                              style: GoogleFonts.inter(
                                  color: Color(0xFF4F5159),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle Privacy Policy tap
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff23262F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.inter(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              // const Spacer(),
              // Login prompt
              Center(
                child: TextButton(
                  onPressed: () {
                    // Define what happens when the button is pressed
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account yet? ",
                      style: GoogleFonts.inter(
                        color: const Color(0xFF4F5159),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: "Log in",
                          style: GoogleFonts.inter(
                            color: Color(
                                0xFF2563EB), // Color for the "Log in" text
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
