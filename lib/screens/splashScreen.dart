import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'onboardingScreen].dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LaunchScreen(),
    );
  }
}

// Launch Screen
class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the SplashScreen after a short delay
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.png"), // Use back.png as background
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/logo2.png', // replace with your logo path
            height: 120,
          ),
        ),
      ),
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 10 seconds and then navigate to the OnboardingScreen
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OnboardingScreen())); // Close the splash screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.png"), // Use back.png as background
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Spacer(flex: 3), // Top spacing
              // Logo image
              Image.asset(
                'assets/log1.png', // replace with your logo file path
                height: 80,
              ),
              SizedBox(height: 24),
              // App name and welcome text
              Column(
                children: [
                  Text(
                    'EziBuy',
                    style: GoogleFonts.roboto(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff23262F),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome To EziBuy',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4F5159),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2), // Space between text and spinner
              // Custom loading spinner
              CustomLoadingIndicator(),
              SizedBox(height: 24),
              // Footer text
              Text(
                'by EziBuy',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7B7D82),
                ),
              ),
              Spacer(flex: 1), // Bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Loading Indicator
class CustomLoadingIndicator extends StatefulWidget {
  @override
  _CustomLoadingIndicatorState createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Speed of the animation
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller!.value * 2 * math.pi,
          child: CustomPaint(
            painter: SegmentPainter(),
            size: Size(50, 50), // Size of the loading indicator
          ),
        );
      },
    );
  }
}

class SegmentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double segmentWidth = 6.0;
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = segmentWidth
      ..strokeCap = StrokeCap.round;

    final List<Color> colors = [
      Colors.blueAccent.withOpacity(0.1),
      Colors.blueAccent.withOpacity(0.3),
      Colors.blueAccent.withOpacity(0.5),
      Colors.blueAccent.withOpacity(0.7),
      Colors.blueAccent,
    ];

    final double radius = size.width / 2;
    final double gap = 8 * (math.pi / 180); // Gap between segments

    for (int i = 0; i < colors.length; i++) {
      paint.color = colors[i];
      double startAngle = i * (math.pi / 4) + gap;
      double sweepAngle = math.pi / 6;
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
