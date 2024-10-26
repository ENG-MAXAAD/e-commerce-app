import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'CustomTextField.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

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
            onPressed: () {},
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
                  'Create New Password?',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const Gap(14),
                const Text(
                  'Enter your email or your phone number, we will send you a confirmation code',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Gap(36),
                //Text Field
                const CustomTextField(
                  hintText: 'Enter your password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                Gap(16),
                const CustomTextField(
                  hintText: 'Enter your password',
                  icon: Icons.lock_outline,
                  isPassword: true,
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
