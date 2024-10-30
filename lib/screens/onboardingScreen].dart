import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'package:myapp_ecommerce/screens/home.dart';
import 'package:myapp_ecommerce/screens/login.dart'; // Import to use the BackdropFilter

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/onboard1.jpg", // Update image paths accordingly
      "title": "Discover Endless Shopping Possibilities",
      "description": "Explore a wide range of products at your fingertips.",
    },
    {
      "image": "assets/onboard2.jpg",
      "title": "Effortless Shopping Experience",
      "description": "Shop seamlessly with a user-friendly interface.",
    },
    {
      "image": "assets/onboard3.jpg",
      "title": "Stay Ahead of the Latest Trends",
      "description": "Keep up with the newest arrivals and offers.",
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onGetStarted() {
    // Navigate to the main application screen
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (contex) =>
                LoginScreen())); // Adjust the route as necessary
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: _onboardingData.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Background image that spans under the status bar
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_onboardingData[index]["image"]!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Blurred container for text and button
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(24)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                            0.4), // Adjust the opacity for the background
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _onboardingData[index]["title"]!,
                            style: GoogleFonts.inter(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _onboardingData[index]["description"]!,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          if (index == _onboardingData.length - 1)
                            ElevatedButton(
                              onPressed: _onGetStarted,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff23262F),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      56), // Rounded corners for the button
                                ),
                                minimumSize: Size(
                                    327, 56), // Width and height as requested
                              ),
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          else
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Dots indicator
                                Row(
                                  children: List.generate(
                                    _onboardingData.length,
                                    (index) => AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.only(right: 5),
                                      height: 10,
                                      width: _currentPage == index ? 30 : 10,
                                      decoration: BoxDecoration(
                                        color: _currentPage == index
                                            ? Color(0xff23262F)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                                // Next button with arrow
                                GestureDetector(
                                  onTap: () {
                                    _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: Color(
                                          0xff23262FCC), // Background color
                                      borderRadius: BorderRadius.circular(
                                          28), // Circle shape
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/Arrow-Right.png', // Update to your arrow asset path
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
