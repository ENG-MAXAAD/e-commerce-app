import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0F4B5563), // Equivalent to #4B55630F
                offset: Offset(0, 6), // x = 0, y = 6 for vertical shadow
                blurRadius: 12.0, // Matches the 12px blur radius
                spreadRadius: 0, // Matches the 0px spread
              ),
            ],
          ),
          child: AppBar(
            title: const Text(
              'My Cards',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
            elevation: 0, // Set AppBar elevation to 0 to avoid double shadow
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            //Image
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/cards/Cards.png'),
            ),
            Gap(42),
            // Add New Card Button
            Container(
              width: 327,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xff23262F),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(28),
                  onTap: () {
                    print('Add new card button tapped');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/scan.png', // Update to the correct asset path
                              color: Colors.white,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Add New Card',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/right_arrow.png', // Update to the correct asset path
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
