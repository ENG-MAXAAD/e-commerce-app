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
                offset: Offset(0, 6),
                blurRadius: 12.0,
                spreadRadius: 0,
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
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            _buildNotificationOption(
              title: "Allow Notifications",
              subtitle: "For daily updates, you will get it",
              value: allowNotifications,
              onChanged: (value) {
                setState(() {
                  allowNotifications = value;
                });
              },
            ),
            _buildNotificationOption(
              title: "Email Notifications",
              subtitle: "For daily updates, you will get it",
              value: emailNotifications,
              onChanged: (value) {
                setState(() {
                  emailNotifications = value;
                });
              },
            ),
            _buildNotificationOption(
              title: "Order Notifications",
              subtitle: "For daily updates, you will get it",
              value: orderNotifications,
              onChanged: (value) {
                setState(() {
                  orderNotifications = value;
                });
              },
            ),
            _buildNotificationOption(
              title: "General Notifications",
              subtitle: "For daily updates, you will get it",
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

  Widget _buildNotificationOption({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff212121),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF212121),
              ),
            ),
          ),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            inactiveThumbColor: Color(0xffD3D4D5),
            inactiveTrackColor: Color(0xffE9E9EA),
            activeTrackColor: Color(0xFF2563EB),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        const Divider(
          color: Color(0xFFD3D4D5),
          height: 0.5,
        ),
      ],
    );
  }
}
