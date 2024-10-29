import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryAndShippingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.grey.shade300, thickness: 1), // Top divider

        SizedBox(height: 8),

        // Delivery Info Row
        Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.black, size: 20),
            SizedBox(width: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Delivery: ",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: "10 - 12 Oct, 2023",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 12), // Spacing between rows

        // Shipping Info Row
        Row(
          children: [
            Icon(Icons.local_shipping, color: Colors.black, size: 20),
            SizedBox(width: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Shipping: ",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: "Free for orders above \$100",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 8),

        Divider(color: Colors.grey.shade300, thickness: 1), // Bottom divider
      ],
    );
  }
}
