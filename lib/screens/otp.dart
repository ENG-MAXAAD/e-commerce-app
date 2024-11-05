import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x0F4B5563),
                  offset: Offset(0, 6),
                  blurRadius: 12.0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: AppBar(
              title: const Text(
                'Enter OTP',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: Colors.black,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
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
                  Text(
                    'Enter Verification Code',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Color(0xff393C44),
                    ),
                  ),
                  const Gap(14),
                  Text(
                    "Please Enter The OTP Sent to \n +1 2345 678 4321",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7B7D82),
                    ),
                  ),
                  const Gap(36),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (value) {},
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 56,
                      fieldWidth: 56,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Color(0xffEFF6FF),
                      selectedFillColor: Colors.white,
                      activeColor: Color(0xff2563EB), // Active border color
                      inactiveColor: Colors.transparent,
                      selectedColor: Color(0xff2563EB), // Selected border color
                      borderWidth: 1.5, // Border thickness when active
                    ),
                    textStyle: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff23262F),
                      height: 1.2, // Adjust line height as needed
                    ),
                    cursorColor: Colors.black,
                    animationType: AnimationType.fade,
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
                  ),
                  const Gap(24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the next screen or perform OTP verification logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        "Verify",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const Gap(24),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Didn't receive the code? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        children: [
                          TextSpan(
                            text: "Resend",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff2563EB),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Add resend logic here
                              },
                          ),
                        ],
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
