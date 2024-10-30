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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0F4B5563),
                offset: Offset(2, 2),
                blurRadius: 12.0,
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Notification',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSwitchTile(
              title: 'Allow Notifications',
              subtitle: 'For daily update you will get it',
              value: allowNotifications,
              onChanged: (value) {
                setState(() {
                  allowNotifications = value;
                });
              },
            ),
            Divider(color: Colors.grey.shade300, height: 1),
            _buildSwitchTile(
              title: 'Email Notifications',
              subtitle: 'For daily update you will get it',
              value: emailNotifications,
              onChanged: (value) {
                setState(() {
                  emailNotifications = value;
                });
              },
            ),
            Divider(color: Colors.grey.shade300, height: 1),
            _buildSwitchTile(
              title: 'Order Notifications',
              subtitle: 'For daily update you will get it',
              value: orderNotifications,
              onChanged: (value) {
                setState(() {
                  orderNotifications = value;
                });
              },
            ),
            Divider(color: Colors.grey.shade300, height: 1),
            _buildSwitchTile(
              title: 'General Notifications',
              subtitle: 'For daily update you will get it',
              value: generalNotifications,
              onChanged: (value) {
                setState(() {
                  generalNotifications = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff7D7D7D),
        ),
      ),
      trailing: Transform.scale(
        scale: 1.2, // Scale the switch for better visibility
        child: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Color(0xff2563EB),
          inactiveThumbColor: Colors.grey.shade300,
          inactiveTrackColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}
