import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/screens/changeScreen.dart';
import 'package:myapp_ecommerce/screens/themeScreen.dart';

import 'NotificationSettingsScreen.dart';
import 'editScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Settings',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              onTap: () {},
            ),
            const SizedBox(height: 32),
            _buildSectionTitle("Support"),
            _buildListItem(
              context,
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {},
            ),
            _buildListItem(
              context,
              icon: Icons.info_outline,
              title: "About Us",
              onTap: () {},
            ),
            Spacer(),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 135),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: BorderSide(color: Colors.red, width: 1.5),
                ),
                child: Text(
                  "Log Out",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
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
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.black),
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
