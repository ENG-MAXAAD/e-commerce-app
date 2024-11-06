import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otp.dart';

class ResetPasswordForNum extends StatelessWidget {
  const ResetPasswordForNum({super.key});

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
                  color: Color(0x0F4B5563), // Equivalent to #4B55630F
                  offset: Offset(0, 6), // x = 0, y = 6 for vertical shadow
                  blurRadius: 12.0, // Matches the 12px blur radius
                  spreadRadius: 0, // Matches the 0px spread
                ),
              ],
            ),
            child: AppBar(
              title: const Text(
                'Reset Password',
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
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7B7D82)),
                  ),
                  const Gap(24),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      fillColor: Color(0xffF4F6F9),
                      filled: true,
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(
                        color: Color(0xffA3A3A3),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),

                    initialCountryCode: 'US',
                    dropdownIconPosition:
                        IconPosition.trailing, // Moves dropdown to right
                    dropdownIcon: Icon(Icons.arrow_drop_down,
                        color: Colors.black), // Custom dropdown icon
                    flagsButtonMargin: EdgeInsets.only(
                        left: 8, right: 8), // Adds margin around flag
                    // flagsButtonDecoration: BoxDecoration(
                    //   shape: BoxShape.circle, // Makes the flag circular
                    // ),
                    onChanged: (phone) {
                      print(phone
                          .completeNumber); // Full phone number including country code
                    },
                  ),
                  const Gap(100),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(),
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
                        "Continue to Login",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
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
