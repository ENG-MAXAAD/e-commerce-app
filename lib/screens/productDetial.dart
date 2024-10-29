import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/ProductNewSales.dart';
import '../Components/Thumbnail.dart';
import 'RatingAndReviewScreen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String title;
  final String price;
  final String originalPrice;
  final String discount;
  final String rating;
  final String reviewCount;
  final bool isNew;
  final List<String> thumbnailImages;
  final String description;
  final List<String> information;
  final String productDetails;
  final String shippingInfo;
  final String returnsPolicy;

  const ProductDetailsScreen({
    Key? key,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.reviewCount,
    required this.isNew,
    required this.thumbnailImages,
    required this.description,
    required this.information,
    required this.productDetails,
    required this.shippingInfo,
    required this.returnsPolicy,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() => quantity++);
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Image.asset(
            'assets/arrow-left.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/Icon.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'assets/share.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'assets/bag.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Product Image and Thumbnails
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.thumbnailImages[0],
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: widget.thumbnailImages.map((image) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Thumbnail(imagePath: image),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Product Title, Rating, Price, etc.
            Text(
              widget.title,
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xff121212),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ...List.generate(
                  5,
                  (index) =>
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RatingAndReviewsScreen(), // Your destination screen
                      ),
                    );
                  },
                  child: Text("${widget.reviewCount} Reviews",
                      style: GoogleFonts.inter(
                          fontSize: 12, color: const Color(0xff605F5F))),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  widget.price,
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff121212),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.originalPrice,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffA7A7A7),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Color Selection
            Text(
              'Color',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xff605F5F),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ColorDot(color: const Color(0xff20C997)),
                const Gap(4),
                ColorDot(color: const Color(0xffAF83F8)),
                const Gap(4),
                ColorDot(color: const Color(0xffE25563)),
                const Gap(4),
                ColorDot(color: const Color(0xff121212)),
              ],
            ),
            const SizedBox(height: 16),

            // Size Selection
            Text(
              'Size',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xff605F5F),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Wrap(
                  spacing: 16,
                  children: ["S", "M", "L", "XL", "2XL"].map((size) {
                    return SizeBox(size: size);
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Quantity Selector
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Color(0xff4F5159),
                      size: 24,
                    ),
                    onPressed: _decrementQuantity,
                  ),
                  Text(
                    '$quantity',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xff4F5159),
                      size: 24,
                    ),
                    onPressed: _incrementQuantity,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Add to Cart and Buy Now Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff23262F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      "Add to Cart",
                      style: GoogleFonts.inter(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Expandable Sections
            ExpansionTile(
              title: Text(
                "Description",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4F5159),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.description,
                    style: const TextStyle(color: Colors.black54, height: 1.5),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Product Details",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4F5159),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.productDetails,
                    style: const TextStyle(color: Colors.black54, height: 1.5),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Shipping Information",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4F5159),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.shippingInfo,
                    style: const TextStyle(color: Colors.black54, height: 1.5),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Returns Policy",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4F5159),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.returnsPolicy,
                    style: const TextStyle(color: Colors.black54, height: 1.5),
                  ),
                ),
              ],
            ),
            // Delivery and Shipping Section
            Divider(thickness: 1, color: Colors.grey.shade300),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined,
                          size: 18, color: Colors.black),
                      const SizedBox(width: 8),
                      Text(
                        'Delivery:',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '10 - 12 Oct, 2023',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.local_shipping_outlined,
                          size: 18, color: Colors.black),
                      const SizedBox(width: 8),
                      Text(
                        'Shipping:',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Free for orders above \$100',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, color: Colors.grey.shade300),
            // You may Also  Like
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You may also like",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "View All",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff2563EB),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Color(0xff2563EB),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SizedBox(
                height: 260,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductNewSales(
                      imageUrl: 'assets/p1.png',
                      title: 'Premium Slim Fit Beige Color Twill Pant',
                      price: '\$102',
                      originalPrice: '\$199',
                      discount: '15% OFF',
                      rating: '4.3',
                      reviewCount: '41',
                      isNew: true,
                      thumbnailImages: [
                        'assets/p1.png',
                        'assets/p2.png',
                        'assets/p3.png'
                      ],
                      description: 'This is a premium slim-fit pant...',
                      information: [
                        'Fabric: Cotton',
                        'Fit: Slim',
                        'Color: Beige'
                      ],
                      productDetails: 'Detailed product description goes here.',
                      shippingInfo: 'Ships within 3-5 business days.',
                      returnsPolicy: 'Free returns within 30 days.',
                    ),
                    ProductNewSales(
                      imageUrl: 'assets/p1.png',
                      title: 'Premium Slim Fit Beige Color Twill Pant',
                      price: '\$102',
                      originalPrice: '\$199',
                      discount: '15% OFF',
                      rating: '4.3',
                      reviewCount: '41',
                      isNew: false,
                      thumbnailImages: [
                        'assets/p1.png',
                        'assets/p2.png',
                        'assets/p3.png'
                      ],
                      description: 'This is a premium slim-fit pant...',
                      information: [
                        'Fabric: Cotton',
                        'Fit: Slim',
                        'Color: Beige'
                      ],
                      productDetails: 'Detailed product description goes here.',
                      shippingInfo: 'Ships within 3-5 business days.',
                      returnsPolicy: 'Free returns within 30 days.',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widget for Color Dots
class ColorDot extends StatelessWidget {
  final Color color;

  const ColorDot({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 30,
      height: 30,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

// Helper Widget for Size Selection
class SizeBox extends StatelessWidget {
  final String size;

  const SizeBox({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          size,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff121212),
          ),
        ),
      ),
    );
  }
}
