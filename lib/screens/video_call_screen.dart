import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:gap/gap.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  double _volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main Video Feed
          Positioned.fill(
            child: Image.asset(
              'assets/call/bgimage.png', // Replace with actual video feed
              fit: BoxFit.cover,
            ),
          ),
          // Back Arrow Button
          Positioned(
            top: 70,
            left: 16,
            child: IconButton(
              icon: Image.asset('assets/arrow-left.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Small Overlay Video
          Positioned(
            top: 99,
            right: 16,
            child: Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/call/image.png', // Replace with actual overlay video feed
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Custom Volume Control Slider with Blur and Gradient Background
          Positioned(
            left: 16,
            top: MediaQuery.of(context).size.height * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  width: 44,
                  height: 162,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF23262F), // Dark gradient color
                        Color(0xFF3B3E47), // Lighter gradient color
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    color: Color(0x33FFFFFF), // Semi-transparent white overlay
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 4,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 8),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 16),
                              activeTrackColor: Colors.blue,
                              inactiveTrackColor: Color(0xffD2D6E1),
                              thumbColor: Colors.white,
                            ),
                            child: Slider(
                              value: _volume,
                              onChanged: (value) {
                                setState(() {
                                  _volume = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Image.asset('assets/call/music.png'),
                      Gap(10),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Bottom Control Container with Gradient
          Positioned(
            top: 700,
            left: 0,
            right: 0,
            child: Container(
              width: 375,
              height: 176,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(15, 12, 34, 0.0),
                    Color(0xFF000E08),
                  ],
                  stops: [0.0806, 0.45],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildControlButton(
                    iconPath: 'assets/call/mic.png',
                    backgroundColor: Color(0xffD2D6E1).withOpacity(0.25),
                    onPressed: () {
                      // Mute functionality
                    },
                  ),
                  _buildControlButton(
                    iconPath: 'assets/call/music.png',
                    backgroundColor: Color(0xffD2D6E1).withOpacity(0.25),
                    onPressed: () {
                      // Speaker functionality
                    },
                  ),
                  _buildControlButton(
                    iconPath: 'assets/call/video.png',
                    backgroundColor: Color(0xffD2D6E1).withOpacity(0.25),
                    onPressed: () {
                      // Toggle camera functionality
                    },
                  ),
                  _buildControlButton(
                    iconPath: 'assets/call/chat.png',
                    backgroundColor: Color(0xff2563EB),
                    onPressed: () {
                      // Open chat functionality
                    },
                  ),
                  _buildControlButton(
                    iconPath: 'assets/call/remove.png',
                    backgroundColor: Colors.red,
                    onPressed: () {
                      // End call functionality
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required String iconPath,
    Color backgroundColor = const Color(0x99000000),
    required VoidCallback onPressed,
  }) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: backgroundColor,
      child: IconButton(
        icon: Image.asset(iconPath),
        onPressed: onPressed,
      ),
    );
  }
}
