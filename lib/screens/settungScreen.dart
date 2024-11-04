import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/screens/changeScreen.dart';
import 'package:myapp_ecommerce/screens/login.dart';
import 'package:myapp_ecommerce/screens/themeScreen.dart';

import 'HelpSupportScreen.dart';
import 'LanguageSelectionScreen.dart';
import 'NotificationSettingsScreen.dart';
import 'editScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(56.0),
      //   child: Container(
      //     decoration: const BoxDecoration(
      //       color: Colors.white,
      //       boxShadow: [
      //         BoxShadow(
      //           color: Color(0x0F4B5563), // Equivalent to #4B55630F
      //           offset: Offset(0, 6), // x = 0, y = 6 for vertical shadow
      //           blurRadius: 12.0, // Matches the 12px blur radius
      //           spreadRadius: 0, // Matches the 0px spread
      //         ),
      //       ],
      //     ),
      //     child: AppBar(
      //       title: const Text(
      //         'Settings',
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      //       ),
      //       backgroundColor: Colors.white,
      //       elevation: 0,
      //       foregroundColor: Colors.black,
      //       leading: IconButton(
      //         icon: const Icon(Icons.arrow_back),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildSectionTitle("General"),
            _buildListItem(
              context,
              icon: Icons.person_outline,
              title: "Edit Profile",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
            ),
            _buildListItem(
              context,
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen()),
                );
              },
            ),
            _buildListItem(
              context,
              icon: Icons.brightness_4_outlined,
              title: "Theme (Light mode)",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ThemeSelectionScreen()),
                );
              },
            ),
            _buildListItem(
              context,
              icon: Icons.notifications_outlined,
              title: "Notification",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationSettingsScreen()));
              },
            ),
            _buildListItem(
              context,
              icon: Icons.language_outlined,
              title: "Language",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => LanguageSelectionScreen()));
              },
            ),
            _buildSectionTitle("Support"),
            _buildListItem(
              context,
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HelpSupportScreen()));
              },
            ),
            _buildListItem(
              context,
              icon: Icons.info_outline,
              title: "About Us",
              onTap: () {},
            ),
            // Spacer(),
            Expanded(
              child: Center(
                child: OutlinedButton(
                  onLongPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 157),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    side: BorderSide(color: Color(0xffE53935), width: 1),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Log Out",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffE53935),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff393C44),
        ),
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white, // Transparent background
        radius: 24, // Adjust the size as needed
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: Color(0xFFD3D4D5), width: 1), // 1px #D3D4D5 border
          ),
          padding: EdgeInsets.all(8), // Optional: Adjust padding as needed
          child: Icon(
            icon, // Use the icon passed as a parameter
            color: Color(0xff393C44),
            size: 24, // Adjust size as needed
          ),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff393C44),
        ),
      ),
      trailing:
          Icon(Icons.arrow_forward_ios, color: Color(0xff393C44), size: 16),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 4),
    );
  }
}
