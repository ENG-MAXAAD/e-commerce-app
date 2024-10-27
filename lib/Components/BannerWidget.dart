// Banner Widget for Carousel Slider
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomBottomBorder.dart';

class BannerWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String buttonText;

  const BannerWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Image.asset(
            imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: const Color(0xFF16161E).withOpacity(0.5),
        ),
        Positioned(
          top: 48,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              CustomOutlinedButton(
                buttonText: buttonText,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
