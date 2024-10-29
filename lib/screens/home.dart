import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:myapp_ecommerce/screens/productDetial.dart';

import '../Components/CategoryWidget.dart';
import '../Components/CustomCarousel.dart';
import '../Components/FlashSaleWidget.dart';
import '../Components/PrdoductCardWidget.dart';
import '../Components/ProductNewSales.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Define screens for each navigation item
  final List<Widget> _screens = [
    HomeScreen(), // The main content for the Home screen
    DiscoverScreen(), // Placeholder screen for Discover
    OrdersScreen(), // Placeholder screen for Orders
    WishlistScreen(), // Placeholder screen for Wishlist
    ProfileScreen(), // Placeholder screen for Profile
  ];

  // Handle bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          backgroundColor: Color(0xffffffff),
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
        body: _screens[_selectedIndex], // Display the selected screen content
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff2563EB),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
          selectedLabelStyle:
              GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

// HomeScreen contains your main home content
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Carousel
          CustomCarousel(),
          const Gap(16),

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
                    backgroundColor: Color(0xFFCCE1FD),
                  ),
                  CategoryIcon(
                    title: 'Mockup',
                    imagePath: 'assets/mockup.png',
                    backgroundColor: Color(0xFFF3D5D5),
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

          // Top Picks Section
          const Gap(16),
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
                    isTopSaller: true,
                  ),
                  const Gap(8),
                  ProductCard(
                    imageUrl: 'assets/p2.png',
                    title: 'Ultra Slim Fit Full Sleeve Shirt',
                    price: '\$42',
                    originalPrice: '\$60.00',
                    discount: '30% OFF',
                    rating: '4.5',
                    reviewCount: '320',
                    isTopSaller: false,
                  ),
                  const Gap(8),
                  ProductCard(
                    imageUrl: 'assets/p3.png',
                    title: 'Maroon Casual Shirt',
                    price: '\$63',
                    originalPrice: '\$75.00',
                    discount: '20% OFF',
                    rating: '4.6',
                    reviewCount: '457',
                    isTopSaller: true,
                  ),
                ],
              ),
            ),
          ),

          // Flash Sale Banner
          FlashSaleBanner(),

          // New Arrivals Section
          const Gap(16),
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
    );
  }
}

// Placeholder screens for other navigation items
class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Discover Screen'));
  }
}

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Orders Screen'));
  }
}

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Wishlist Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Screen'));
  }
}
