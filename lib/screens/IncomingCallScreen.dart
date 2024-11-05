import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class IncomingCallScreen extends StatefulWidget {
  const IncomingCallScreen({Key? key}) : super(key: key);

  @override
  State<IncomingCallScreen> createState() => _IncomingCallScreenState();
}

class _IncomingCallScreenState extends State<IncomingCallScreen> {
  double _slidePosition = 0.0;
  bool _isSliding = false;

  void _onHorizontalDragStart(DragStartDetails details) {
    setState(() {
      _isSliding = true;
    });
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (!_isSliding) return;

    setState(() {
      _slidePosition += details.delta.dx;
      if (_slidePosition < 0) {
        _slidePosition = 0;
      } else if (_slidePosition > 200) {
        _slidePosition = 200;
      }
    });

    if (_slidePosition >= 180) {
      _handleAnswer();
    }
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (_slidePosition < 180) {
      setState(() {
        _slidePosition = 0;
        _isSliding = false;
      });
    }
  }

  void _handleAnswer() {
    print('Call answered');
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              'assets/call/bgcall.png',
              fit: BoxFit.cover,
            ),
            // Gradient and Blur Effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(6, 13, 10, 0.6),
                      Color.fromRGBO(0, 13, 7, 0.6),
                    ],
                    stops: [-0.069, 0.8004],
                  ),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    // Centered Profile Image with Circular Background
                    Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/call/profile22.png',
                          fit: BoxFit.cover,
                          width: 128,
                          height: 128,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Caller Info
                    Text(
                      'Esther Howard',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Incoming call',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xffDBEAFE),
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    // Action Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildActionButton(
                            icon: 'assets/call/alarm-clock.png',
                            label: 'Remind me',
                            onTap: () {},
                          ),
                          _buildActionButton(
                            icon: 'assets/call/chat-text.png',
                            label: 'Message',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Slide to Answer Button
                    Container(
                      width: 280,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(28),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Colors.grey.shade300,
                          ],
                        ),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.15),
                          width: 0.5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  'Slide To Answer',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onHorizontalDragStart: _onHorizontalDragStart,
                                onHorizontalDragUpdate: _onHorizontalDragUpdate,
                                onHorizontalDragEnd: _onHorizontalDragEnd,
                                child: AnimatedContainer(
                                  duration: Duration(
                                      milliseconds: _isSliding ? 0 : 300),
                                  curve: Curves.easeOut,
                                  transform: Matrix4.translationValues(
                                      _slidePosition, 0, 0),
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.white,
                                            Colors.grey.shade300,
                                          ],
                                        ),
                                      ),
                                      child: Image.asset(
                                        'assets/call/phone-call.png',
                                        color: Color(0xFF1976D2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Bottom Indicator
                    Container(
                      width: 134,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
