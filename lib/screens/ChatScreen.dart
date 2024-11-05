import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/screens/IncomingCallScreen.dart';
import 'package:myapp_ecommerce/screens/video_call_screen.dart';

class ChatScreen extends StatelessWidget {
  final bool showTimestamp;

  const ChatScreen({Key? key, this.showTimestamp = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/profile1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Esther Howard',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1A1C1E),
                  ),
                ),
                Text(
                  'Active now',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7B7D82),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/phone-call.png', width: 24, height: 24),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IncomingCallScreen()));
            },
          ),
          IconButton(
            icon: Image.asset('assets/video.png', width: 24, height: 24),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideoCallScreen()));
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildUserMessage("You did your job well!", "09:25 AM"),
                if (showTimestamp) _buildTimestamp("Today"),
                _buildReceiverMessage(
                  "Have a great working week!!",
                  "Esther Howard",
                  showAvatar: true,
                  time: "09:25 AM",
                ),
                _buildReceiverMessage(
                  "Hope you like it",
                  "Esther Howard",
                  showAvatar: false,
                  time: "09:25 AM",
                ),
                _buildVoiceMessage("09:25 AM"),
                _buildReceiverMessage(
                  "Look at this all Product!!",
                  "Esther Howard",
                  showAvatar: true,
                  time: "09:25 AM",
                ),
                _buildProductImages("09:25 AM"),
                _buildUserMessage("Hello! Esther Howard", "09:25 AM"),
              ],
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildUserMessage(String message, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 270),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7B7D82),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiverMessage(
    String message,
    String name, {
    required bool showAvatar,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showAvatar) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/profile1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ] else
            const SizedBox(width: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showAvatar)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1A1C1E),
                      ),
                    ),
                  ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 270),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    message,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1A1C1E),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7B7D82),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimestamp(String timestamp) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            timestamp,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1A1C1E),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVoiceMessage(String timestamp) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xff2563EB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/play.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Row(
                  children: [
                    Image.asset(
                      "assets/played.png",
                      width: 90,
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "assets/stream.png",
                      width: 70,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Text(
                  "00:16",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              timestamp,
              style: GoogleFonts.inter(
                color: Color(0xff7B7D82),
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImages(String time) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F7FB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/product1.png',
                    width: 68,
                    height: 68,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/product2.png',
                    width: 68,
                    height: 68,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF7B7D82),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFF1F5F9),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Image.asset('assets/attach.png', width: 24, height: 24),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Write your message',
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7B7D82),
                ),
                filled: true,
                fillColor: const Color(0xFFF1F5F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Image.asset('assets/camera.png', width: 24, height: 24),
          const SizedBox(width: 12),
          Image.asset('assets/Vector.png', width: 24, height: 24),
        ],
      ),
    );
  }
}
