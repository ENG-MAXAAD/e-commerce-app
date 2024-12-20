import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/screens/filter_search.dart';
import '../Components/ProductNewSales.dart';
import '../modal/helpers/product_helper.dart';

class SearchResultScreen extends StatelessWidget {
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
                color: Color(0x0F4B5563), // Equivalent to #4B55630F
                offset: Offset(0, 6), // x = 0, y = 6 for vertical shadow
                blurRadius: 12.0, // Matches the 12px blur radius
                spreadRadius: 0, // Matches the 0px spread
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Color(0xffffffff),
            elevation: 0,
            foregroundColor: Colors.black,
            title: Text(
              "Search Result",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
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
                  'assets/bag.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Picks Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Result",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(4),
                    Text(
                      "(165 Items)",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff7B7D82)),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Clear Filter",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffE53935),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Product Grid with Two Columns
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                  height: 260,
                  child: ListView.builder(
                      itemCount: productsList.length,
                      scrollDirection: Axis.horizontal,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return ProductNewSales(
                          products: productsList[index],
                        );
                      })),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // White background color for BottomAppBar
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Filter Button with Icon on Top and Label at Bottom
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle Filter action here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilterTab()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/filter_icon.png', // Replace with the actual asset path
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Filter",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff4F5159),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Sort By Button with Icon on Top and Label at Bottom
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showSortBottomSheet(context);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/sort_icon.png', // Replace with the actual asset path
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Sort By",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff4F5159),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sort By",
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff393C44)),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xff23262F),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const Gap(12),
              Divider(
                thickness: 1,
                color: Color(0xffE9E9EA),
              ),
              // const Gap(12),
              ListTile(
                title: Text(
                  "Price - High to Low",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xff393C44),
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add sorting logic here
                },
              ),
              ListTile(
                title: Text(
                  "Price - Low to High",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xff393C44),
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add sorting logic here
                },
              ),
              ListTile(
                title: Text(
                  "Popularity",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xff393C44),
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add sorting logic here
                },
              ),
              ListTile(
                title: Text(
                  "Discount",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xff393C44),
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add sorting logic here
                },
              ),
              ListTile(
                title: Text(
                  "Customer Rating",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xff393C44),
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Add sorting logic here
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
