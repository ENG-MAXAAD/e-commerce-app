import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:myapp_ecommerce/main.dart';
import 'CustomTextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
        backgroundColor: Colors.white,
        elevation: 1.0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                    height: 30), // Increased top spacing for a better layout
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
                const SizedBox(height: 6),
                // Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Login Button
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
                      "Login",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Sign Up prompt
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle Sign Up tap
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Divider with "OR"
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                  ],
                ),
                const SizedBox(height: 20), // Added spacing after OR
                // Social login buttons
                SocialLoginButton(
                  imageUrl:
                      'https://w7.pngwing.com/pngs/724/759/png-transparent-apple-logo-apple-computer-icons-apple-logo-heart-computer-logo-thumbnail.png', // Apple logo
                  label: 'Continue with Apple',
                  onPressed: () {
                    // Handle Apple login
                  },
                ),
                const SizedBox(height: 10),
                SocialLoginButton(
                  imageUrl:
                      'https://www.wavetransit.com/wp-content/uploads/2021/08/Facebook-logo.png', // Facebook logo
                  label: 'Continue with Facebook',
                  onPressed: () {
                    // Handle Facebook login
                  },
                ),
                const SizedBox(height: 10),
                SocialLoginButton(
                  imageUrl:
                      'https://cdn2.hubspot.net/hubfs/53/image8-2.jpg', // Google logo
                  label: 'Continue with Google',
                  onPressed: () {
                    // Handle Google login
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final String imageUrl; // Use imageUrl for network image
  final String label;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.imageUrl, // Keep the parameter name
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.network(
          imageUrl, // Load image from network
          width: 24,
          height: 24,
          fit: BoxFit.cover, // Ensures the image covers the space correctly
        ),
        label: Text(label, style: const TextStyle(color: Colors.black)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.grey.shade400),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
