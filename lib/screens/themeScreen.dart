import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0F4B5563), // Shadow color with slight opacity
                offset: Offset(2, 2), // Shadow position
                blurRadius: 12.0, // Blur effect
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Theme',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0, // Remove shadow beneath AppBar
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
            const SizedBox(height: 16),
            // Light Mode Option
            _buildThemeOption(
              icon: Icons.wb_sunny_outlined,
              title: 'Light mode',
              value: 'Light mode',
            ),
            // Dark Mode Option
            _buildThemeOption(
              icon: Icons.nights_stay_outlined,
              title: 'Dark mode',
              value: 'Dark mode',
            ),
            // Automatic Option
            _buildThemeOption(
              icon: Icons.hourglass_empty_outlined,
              title: 'Automatic',
              value: 'Automatic',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero, // Aligns the icon with the title
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.black),
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
