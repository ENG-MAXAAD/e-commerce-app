import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductNewSales extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String discount;
  final String originalPrice;
  final String rating;
  final String reviewCount;
  final bool isNew; // New parameter to indicate if the product is new

  const ProductNewSales({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.discount,
    required this.originalPrice,
    required this.rating,
    required this.reviewCount,
    this.isNew = false, // Default to false if not specified
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Tag (Top Seller or New)
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              if (isNew)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "New",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(height: 8),

          // Product Title
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF393C44),
            ),
          ),
          const SizedBox(height: 8),

          // Price and Discount
          Row(
            children: [
              Text(
                price,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                originalPrice,
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFFA7A8AC),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                discount,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  color: Color(0xFFFD7E14),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Rating and Review Count
          Row(
            children: [
              Icon(Icons.star, color: Color(0xffFD7E14), size: 14),
              const SizedBox(width: 4),
              Text(
                rating,
                style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Color(0xFF4F5159),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 4),
              Text(
                '($reviewCount)',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7B7D82)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
