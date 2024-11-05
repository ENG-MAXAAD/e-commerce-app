import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Components/CustomSuceesBottom.dart';
import '../Components/CustomTextField.dart';
import 'ResetPassword.dart';
import 'SignUpScreen.dart';
import 'home.dart'; // Your HomeScreen file
import '../Components/SocialMediaLinks.dart'; // Social button component

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                color: Color(0x0F4B5563), // Equivalent to #4B55630F
                offset: Offset(0, 6), // x = 0, y = 6 for vertical shadow
                blurRadius: 12.0, // Matches the 12px blur radius
                spreadRadius: 0, // Matches the 0px spread
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Log In',
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
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back when back arrow is pressed
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 30),
            CustomTextField(
              hintText: 'Enter your email',
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Enter your password',
              icon: Icons.lock_outline,
              hasSuffixIcon: true,
              isPassword: true,
            ),
            const SizedBox(height: 0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetPassword()),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xff2563EB),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => SuccessBottomSheet(
                      title: "Congratulations!",
                      message: "You have successfully completed the login.",
                      buttonText: "Continue",
                      onButtonPressed: () {
                        Navigator.pop(context); // Close modal
                        Navigator.push(context,
                            MaterialPageRoute(builder: (contex) => Home()));
                      },
                      checkmarkImagePath: 'assets/badge-check.png',
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7B7D82),
                  ),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Color(0xFF2563EB),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xffE9E9EA),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "OR",
                    style: GoogleFonts.inter(
                        color: Color(0xffD3D4D5),
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xffE9E9EA),
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SocialLoginButton(
              imageUrl: 'assets/apple2.png',
              label: 'Continue with Apple',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              imageUrl: 'assets/f.png',
              label: 'Continue with Facebook',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              imageUrl: 'assets/google.png',
              label: 'Continue with Google',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
