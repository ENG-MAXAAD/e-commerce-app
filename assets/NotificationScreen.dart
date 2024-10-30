import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isNotificationsTab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Tab Bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    // Notifications Tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isNotificationsTab = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isNotificationsTab
                                ? Color(0xff2563EB)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Notifications",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 20 / 14, // line-height of 20px
                                  color: isNotificationsTab
                                      ? Colors.white
                                      : Color(0xff4F5159),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.notifications,
                                color: isNotificationsTab
                                    ? Colors.white
                                    : Color(0xff4F5159),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Messages Tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isNotificationsTab = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isNotificationsTab
                                ? Color(0xff2563EB)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Message",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 20 / 14,
                                  color: !isNotificationsTab
                                      ? Colors.white
                                      : Color(0xff4F5159),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.message,
                                color: !isNotificationsTab
                                    ? Colors.white
                                    : Color(0xff4F5159),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: isNotificationsTab
                  ? _buildNotificationsList()
                  : _buildMessagesList(),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build the notifications list
  Widget _buildNotificationsList() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildSectionTitle("Today"),
        _buildNotificationItem(
          icon: Icons.payment,
          title: "New Payment Added!",
          message: "Your payment has been successfully linked with Docdoc.",
          time: "5h",
          iconColor: Colors.blue,
        ),
        _buildNotificationItem(
          icon: Icons.notifications_active,
          title: "Reminders Set for Appointment",
          message:
              "You have successfully canceled your appointment with Dr. David Patel.",
          time: "5h",
          iconColor: Colors.green,
          isUnread: true,
        ),
        _buildNotificationItem(
          icon: Icons.cancel,
          title: "Appointment Cancelled",
          message:
              "You have successfully canceled your appointment with Dr. Randy Wigham.",
          time: "5h",
          iconColor: Colors.red,
        ),
        _buildSectionTitle("Yesterday"),
        _buildNotificationItem(
          icon: Icons.check_circle,
          title: "Appointment Success",
          message: "Congratulations - your appointment is confirmed!",
          time: "5h",
          iconColor: Colors.blue,
        ),
      ],
    );
  }

  // Method to build the messages list
  Widget _buildMessagesList() {
    List<Map<String, String>> messages = [
      {
        "name": "Guy Hawkins",
        "message": "Thanks for contacting me!",
        "time": "15:23"
      },
      {
        "name": "Esther Howard",
        "message": "Thanks for contacting me!",
        "time": "15:23"
      },
      {
        "name": "Dianne Russell",
        "message": "Thanks for contacting me!",
        "time": "15:23"
      },
      {
        "name": "Eleanor Pena",
        "message": "Thanks for contacting me!",
        "time": "15:23"
      },
      {
        "name": "Jane Cooper",
        "message": "Thanks for contacting me!",
        "time": "15:23"
      },
      {
        "name": "Floyd Miles",
        "message": "Thanks for contacting me!",
        "time": "15:23"
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          margin: EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/avatar_${index + 1}.png'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message['name']!,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      message['message']!,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7B7D82),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    message['time']!,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff2563EB),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "2",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper method to build section title (Today, Yesterday)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff4F5159),
        ),
      ),
    );
  }

  // Helper method to build individual notification item
  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    required Color iconColor,
    bool isUnread = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isUnread ? Color(0xffF5FAFF) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconColor.withOpacity(0.2),
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Color(0xff7B7D82),
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
