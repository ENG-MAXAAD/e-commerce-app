import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Wrapping AppBar in a Container to customize shadow effect
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // subtle gray shadow color
                  offset: Offset(1, 6), // position of the shadow
                  blurRadius: 12.0, // blur intensity
                ),
              ],
            ),
            child: AppBar(
              title: const Text(
                'Enter OTP',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              backgroundColor: Colors.white,
              elevation: 0, // Set AppBar elevation to 0 to avoid double shadow
              foregroundColor: Colors.black,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
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
                  const Text(
                    'Enter Verification Code',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  const Gap(14),
                  const Text(
                    "Please Enter The OTP Sent to +1 2345 678 4321",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const Gap(36),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (value) {},
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.black,
                    ),
                  ),
                  const Gap(24),
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
                        "Verify",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const Gap(24),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Logic for resending OTP
                      },
                      child: const Text(
                        "Didn't receive the code? Resend",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
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
