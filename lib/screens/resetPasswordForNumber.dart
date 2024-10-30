import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otp.dart';

class ResetPasswordForNum extends StatelessWidget {
  const ResetPasswordForNum({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Reset Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          elevation: 1.0,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
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
                  const Text(
                    'Forgot Your Password?',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  const Gap(14),
                  const Text(
                    'Enter your email or your phone number, we will send you a confirmation code',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const Gap(24),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      hintText: 'Enter your phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'US',
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
