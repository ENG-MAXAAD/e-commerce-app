import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/header/app_bar.dart';

class ThemeSelectionScreen extends StatefulWidget {
  @override
  _ThemeSelectionScreenState createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen> {
  String _selectedTheme = 'Light mode';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppHeader().buildPreferredSize(context, "Theme", Icons.arrow_back),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              "Appearance",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xff393C44),
              ),
            ),
            const SizedBox(height: 24),
            // Light Mode Option
            _buildThemeOption(
              assetPath:
                  'assets/light_mode.png', // Replace with your asset path
              title: 'Light mode',
              value: 'Light mode',
            ),
            const SizedBox(height: 24),
            // Dark Mode Option
            _buildThemeOption(
              assetPath: 'assets/dark_mode.png', // Replace with your asset path
              title: 'Dark mode',
              value: 'Dark mode',
            ),
            const SizedBox(height: 24),
            // Automatic Option
            _buildThemeOption(
              assetPath: 'assets/auto_mode.png', // Replace with your asset path
              title: 'Automatic',
              value: 'Automatic',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption({
    required String assetPath,
    required String title,
    required String value,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero, // Aligns the icon with the title
      leading: Container(
        width: 44, // Adjusted to fit the border and avatar
        height: 44, // Adjusted to fit the border and avatar
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Color(0xFFD3D4D5),
              width: 1), // 1px border with specified color
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(
            assetPath, // Replace with your asset path
            width: 24, // Adjust size as needed
            height: 24, // Adjust size as needed
          ),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xff393C44),
        ),
      ),
      trailing: Radio<String>(
        value: value,
        groupValue: _selectedTheme,
        onChanged: (newValue) {
          setState(() {
            _selectedTheme = newValue!;
          });
        },
        activeColor: const Color(0xff2563EB),
      ),
      onTap: () {
        setState(() {
          _selectedTheme = value;
        });
      },
    );
  }
}
