import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool allowNotifications = true;
  bool emailNotifications = false;
  bool orderNotifications = false;
  bool generalNotifications = true;

  @override
  Widget build(BuildContext context) {
    // Detect the current theme to support dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
            boxShadow: [
              BoxShadow(
                color:
                    isDarkMode ? Colors.transparent : const Color(0x0F4B5563),
                offset: const Offset(0, 6),
                blurRadius: 12.0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Notifications',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            elevation: 0,
            foregroundColor: isDarkMode ? Colors.white : Colors.black,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            _buildNotificationOption(
              title: "Allow Notifications",
              subtitle: "Receive daily updates and alerts",
              value: allowNotifications,
              onChanged: (value) {
                setState(() {
                  allowNotifications = value;
                });
              },
              isDarkMode: isDarkMode,
            ),
            _buildNotificationOption(
              title: "Email Notifications",
              subtitle: "Get updates via email",
              value: emailNotifications,
              onChanged: (value) {
                setState(() {
                  emailNotifications = value;
                });
              },
              isDarkMode: isDarkMode,
            ),
            _buildNotificationOption(
              title: "Order Notifications",
              subtitle: "Stay informed about your orders",
              value: orderNotifications,
              onChanged: (value) {
                setState(() {
                  orderNotifications = value;
                });
              },
              isDarkMode: isDarkMode,
            ),
            _buildNotificationOption(
              title: "General Notifications",
              subtitle: "Receive general updates",
              value: generalNotifications,
              onChanged: (value) {
                setState(() {
                  generalNotifications = value;
                });
              },
              isDarkMode: isDarkMode,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a single notification option with a title, subtitle, and switch.
  Widget _buildNotificationOption({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
    required bool isDarkMode,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Color(0xff212121),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isDarkMode ? Colors.white70 : Color(0xFF212121),
              ),
            ),
          ),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white, // Toggle color when active
            inactiveThumbColor: isDarkMode
                ? Colors.grey[700]
                : Colors.white, // Toggle color when inactive
            inactiveTrackColor: isDarkMode
                ? Colors.grey[800]
                : Colors.grey[300], // Track color when inactive
            activeTrackColor: Color(0xFF2563EB), // Track color when active
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        const Divider(
          color: Color(0xFFD3D4D5),
          height: 1.0,
        ),
      ],
    );
  }
}
