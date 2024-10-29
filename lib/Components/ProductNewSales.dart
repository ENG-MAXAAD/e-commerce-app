import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/productDetial.dart';

class ProductNewSales extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String discount;
  final String originalPrice;
  final String rating;
  final String reviewCount;
  final bool isNew;
  final List<String> thumbnailImages;
  final String description;
  final List<String> information;
  final String productDetails;
  final String shippingInfo;
  final String returnsPolicy;

  const ProductNewSales({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.discount,
    required this.originalPrice,
    required this.rating,
    required this.reviewCount,
    this.isNew = false,
    required this.thumbnailImages,
    required this.description,
    required this.information,
    required this.productDetails,
    required this.shippingInfo,
    required this.returnsPolicy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              title: title,
              price: price,
              originalPrice: originalPrice,
              discount: discount,
              rating: rating,
              reviewCount: reviewCount,
              isNew: isNew,
              thumbnailImages: thumbnailImages,
              description: description,
              information: information,
              productDetails: productDetails,
              shippingInfo: shippingInfo,
              returnsPolicy: returnsPolicy,
            ),
          ),
        );
      },
      child: Container(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "New",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            // Product Title, Price, and other details
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: 14, color: const Color(0xFF393C44)),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  price,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(width: 4),
                Text(
                  originalPrice,
                  style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFFA7A8AC),
                      decoration: TextDecoration.lineThrough),
                ),
                const SizedBox(width: 4),
                Text(
                  discount,
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      color: const Color(0xFFFD7E14),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xffFD7E14), size: 14),
                const SizedBox(width: 4),
                Text(rating,
                    style: GoogleFonts.inter(
                        fontSize: 12, color: const Color(0xFF4F5159))),
                const SizedBox(width: 4),
                Text('($reviewCount)',
                    style: const TextStyle(
                        fontSize: 12, color: Color(0xff7B7D82))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
