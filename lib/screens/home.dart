import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/BannerWidget.dart';
import '../Components/CategoryWidget.dart';
import '../Components/FlashSaleWidget.dart';
import '../Components/PrdoductCardWidget.dart';
import '../Components/ProductNewSales.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello Sacky',
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: Image.asset(
              'assets/menu.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/search.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                'assets/notification.png',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: [
                  BannerWidget(
                    imageUrl: 'assets/banner1.png',
                    title: "New items with Free shipping",
                    buttonText: "Shop now",
                  ),
                  BannerWidget(
                    imageUrl: 'assets/banner1.png',
                    title: "Super Flash Sale 50% Off",
                    buttonText: "Explore",
                  ),
                  BannerWidget(
                    imageUrl: 'assets/banner1.png',
                    title: "Trending Collections",
                    buttonText: "Discover",
                  ),
                ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  scrollDirection: Axis.vertical,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
              ),
              Gap(16),
              // Category Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shop by Category",
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryIcon(
                        title: 'Fashion',
                        imagePath: 'assets/fashion.png',
                        backgroundColor: Color(0xFFCCE1FD)!,
                      ),
                      CategoryIcon(
                        title: 'Mockup',
                        imagePath: 'assets/mockup.png',
                        backgroundColor: Color(0xFFF3D5D5)!,
                      ),
                      CategoryIcon(
                        title: 'Beauty',
                        imagePath: 'assets/beauty.png',
                        backgroundColor: Colors.green[100]!,
                      ),
                      CategoryIcon(
                        title: 'Bags',
                        imagePath: 'assets/bags.png',
                        backgroundColor: Colors.orange[100]!,
                      ),
                      CategoryIcon(
                        title: 'Sneakers',
                        imagePath: 'assets/sneakers.png',
                        backgroundColor: Colors.blue[100]!,
                      ),
                    ],
                  ),
                ),
              ),
              //product Section
              Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Picks",
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductCard(
                        imageUrl: 'assets/p1.png',
                        title: 'Ash Printed Half Sleeve Hawaiian Shirt',
                        price: '\$68',
                        originalPrice: '\$80.25',
                        discount: '15% OFF',
                        rating: '4.8',
                        reviewCount: '692',
                      ),
                      Gap(8),
                      ProductCard(
                        imageUrl: 'assets/p2.png',
                        title: 'Ultra Slim Fit Full Sleeve Shirt',
                        price: '\$42',
                        originalPrice: '\$60.00',
                        discount: '30% OFF',
                        rating: '4.5',
                        reviewCount: '320',
                      ),
                      Gap(8),
                      ProductCard(
                        imageUrl: 'assets/p2.png',
                        title: 'Maroon Casual Shirt',
                        price: '\$63',
                        originalPrice: '\$75.00',
                        discount: '20% OFF',
                        rating: '4.6',
                        reviewCount: '457',
                      ),
                    ],
                  ),
                ),
              ),

              // Flash Sale Banner
              FlashSaleBanner(),
              //Product new Sales
              // Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals",
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        isNew:
                            true, // Show "New" tag only for the first product
                      ),
                      ProductNewSales(
                        imageUrl: 'assets/p2.png',
                        title: 'Adidas white sneakers for men',
                        price: '\$68',
                        originalPrice: '\$70.25',
                        discount: '15% OFF',
                        rating: '4.3',
                        reviewCount: '41',
                        isNew: false, // No tag for this product
                      ),
                      ProductNewSales(
                        imageUrl: 'assets/p3.png',
                        title: 'Adidas white sneakers for women',
                        price: '\$58',
                        originalPrice: '\$65.00',
                        discount: '10% OFF',
                        rating: '4.5',
                        reviewCount: '100',
                        isNew: false, // No tag for this product
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
