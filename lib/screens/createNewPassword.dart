import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/screens/login.dart';
import '../Components/CustomSuceesBottom.dart';
import '../Components/CustomTextField.dart';
import '../Components/header/app_bar.dart';
import 'home.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppHeader().buildPreferredSize(
            context, "Create New Password", Icons.arrow_back),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create New Password',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Color(0xff393C44)),
                ),
                const Gap(14),
                Text(
                  'Create New Password to make your account more secure.',
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7B7D82)),
                ),
                const Gap(36),

                // New Password Field
                CustomTextField(
                  hintText: 'Enter your new password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  hasSuffixIcon: true,
                ),
                const Gap(16),

                // Confirm Password Field
                CustomTextField(
                  hintText: 'Confirm your new password',
                  hasSuffixIcon: true,
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const Gap(24),

                // Create Password Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add password creation logic here
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => SuccessBottomSheet(
                          title: "Success!",
                          message: "You have successfully reset your password.",
                          buttonText: "Continue",
                          onButtonPressed: () {
                            Navigator.pop(context); // Close modal
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => LoginScreen()));
                          },
                          checkmarkImagePath: 'assets/message.png',
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
                      "Create Password",
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
    );
  }
}
