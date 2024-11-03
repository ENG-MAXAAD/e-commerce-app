import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Components/CustomTextField.dart';

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
        appBar: AppBar(
          title: const Text(
            'Create New Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          elevation: 1.0,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create New Password',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const Gap(14),
                const Text(
                  'Enter a new password and confirm it below.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const Gap(36),

                // New Password Field
                CustomTextField(
                  hintText: 'Enter your new password',
                  labelText: 'New Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const Gap(16),

                // Confirm Password Field
                CustomTextField(
                  hintText: 'Confirm your new password',
                  labelText: 'Confirm Password',
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      "Create Password",
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
