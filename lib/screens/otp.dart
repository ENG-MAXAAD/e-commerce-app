import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/screens/login.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Components/header/app_bar.dart';
import 'home.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppHeader()
            .buildPreferredSize(context, "Enter OTP", Icons.arrow_back),
        body: SingleChildScrollView(
          child: Container(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => LoginScreen()));
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
                        style: GoogleFonts.inter(
                            fontSize: 15, color: Color(0xff7B7D82)),
                        children: [
                          TextSpan(
                            text: "Resend",
                            style: GoogleFonts.inter(
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
