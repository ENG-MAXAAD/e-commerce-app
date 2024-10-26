import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'CustomTextField.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.white,
        elevation: 1.0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
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
              const SizedBox(height: 26),
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
                          style: TextStyle(color: Colors.black),
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
                              style: TextStyle(color: Colors.black),
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

              const SizedBox(height: 20),
              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              // const Spacer(),
              // Login prompt
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text.rich(
                    TextSpan(
                      text: "Already have an account yet? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
