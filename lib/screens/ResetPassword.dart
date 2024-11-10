import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/screens/resetPasswordForNumber.dart';

import '../Components/header/app_bar.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppHeader()
            .buildPreferredSize(context, "Reset Password", Icons.arrow_back),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forgot Your Password?',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xff393C44)),
                  ),
                  const Gap(14),
                  Text(
                    'Enter your email or your phone number, we will send you a confirmation code',
                    style: GoogleFonts.inter(
                        color: Color(0xff7B7D82),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const Gap(36),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/envelope.png'),
                      hintText: 'Enter your email or phone number',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xff23262F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF9FAFB), // Fill color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(48),
                        borderSide: BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 1), // Border color and width
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(48),
                        borderSide:
                            BorderSide(color: Color(0xFFE5E7EB), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(48),
                        borderSide:
                            BorderSide(color: Color(0xFFE5E7EB), width: 1),
                      ),
                    ),
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordForNum(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        "Continue to Login",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
