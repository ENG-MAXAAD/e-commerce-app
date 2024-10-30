import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'CustomTextField.dart';

class EditProfileScreen extends StatelessWidget {
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
                color: Color(0x0F4B5563), // 6% opacity gray shadow color
                offset: Offset(2, 2), // position of the shadow
                blurRadius: 12.0, // blur intensity
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Edit Profile',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0, // Set AppBar elevation to 0 to avoid double shadow
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            // Profile Photo Section with dark overlay
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/profile_picture1.jpg'), // Replace with actual image asset
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), // Dark overlay
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/pen.png', // Path to your pen icon asset
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Upload Profile Photo",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff171717),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Upload Profile Photo PNG\nMax 10mb.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            // CustomTextField for Full Name
            CustomTextField(
              hintText: "Enter your name",
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            // CustomTextField for Email
            CustomTextField(
              hintText: "Enter your email",
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 16),
            // IntlPhoneField for Phone Number with Country Flag
            IntlPhoneField(
              decoration: InputDecoration(
                hintText: "Phone Number",
                hintStyle: GoogleFonts.inter(
                  color: Color(0xFFA7A8AC),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFF9FAFB),
              ),
              initialCountryCode: 'US',
              onChanged: (phone) {
                print(phone.completeNumber); // Handle phone number change
              },
            ),
          ],
        ),
      ),
    );
  }
}
