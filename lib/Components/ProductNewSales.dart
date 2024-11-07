import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/modal/products.dart';

import '../screens/productDetial.dart';

class ProductNewSales extends StatelessWidget {
  final Products products;

  const ProductNewSales({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              imageUrl: products.imageUrl,
              title: products.title,
              price: products.price,
              originalPrice: products.originalPrice,
              discount: products.discount,
              rating: products.rating,
              reviewCount: products.reviewCount,
              isNew: products.isNew,
              thumbnailImages: products.thumbnailImages,
              description: products.description,
              information: products.information,
              productDetails: products.productDetails,
              shippingInfo: products.shippingInfo,
              returnsPolicy: products.returnsPolicy,
            ),
          ),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Fix content height
          children: [
            // Product Image and Tag
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    products.imageUrl,
                    width: 154,
                    height: 164, // Fixed height to control overflow
                    fit: BoxFit.cover,
                  ),
                ),
                if (products.isNew)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "New",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            // Product Title
            Text(
              products.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: 13, color: const Color(0xFF393C44)),
            ),
            const SizedBox(height: 4),
            // Price and Discount Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  products.price,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  products.originalPrice,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFA7A8AC),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  products.discount,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: const Color(0xFFFD7E14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Rating Row
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xffFD7E14), size: 12),
                const SizedBox(width: 2),
                Text(
                  products.rating,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: const Color(0xFF4F5159),
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  '(${products.reviewCount})',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xff7B7D82),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
