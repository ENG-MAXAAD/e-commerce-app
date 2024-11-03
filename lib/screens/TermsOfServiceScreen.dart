import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfServiceScreen extends StatelessWidget {
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
              'Term Of Service',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff23262F),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
            centerTitle: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            // Title Section
            Text(
              "Privacy Policy",
              style: GoogleFonts.urbanist(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: const Color(0xff374151),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                // Version Label
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2F1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "v1.1.0",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF374151),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Publish Date
                Text(
                  "Published on ",
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                    height: 1.4,
                  ),
                ),
                Text(
                  "February, 2024",
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF374151),
                    height: 1.4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Download Button
            OutlinedButton.icon(
              onPressed: () {
                // Action to download the PDF
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF374151)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              icon:
                  const Icon(Icons.download_rounded, color: Color(0xFF374151)),
              label: Text(
                "Download as PDF",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4B5563),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Privacy Policy Text
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  "Protecting your privacy is a top priority at our parcel delivery app. We understand that you entrust us with your personal information, and we take that responsibility seriously.\n\n"
                  "When you use our app, we collect and use information only as necessary to provide our services and improve your experience. This includes information such as your name, address, and delivery details. We also use cookies and similar technologies to personalize your experience and track usage data.\n\n"
                  "We do not sell your information to third parties, and we only share it with our trusted partners and service providers when necessary to provide our services. We take reasonable steps to protect your information from unauthorized access, disclosure, or misuse.\n\n"
                  "If you have any questions or concerns about our privacy practices, please don't hesitate to contact us. Your trust and satisfaction are important to us, and we will do everything we can to address your concerns.",
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF4F4F4F),
                    height: 1.5,
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
