import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/screens/home.dart';

class RatingAndReviewsScreen extends StatelessWidget {
  const RatingAndReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0F4B5563), // 6% opacity gray shadow color
                offset: Offset(2, 2), // Position of the shadow
                blurRadius: 12.0, // Blur intensity
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Rating & Reviews',
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
            elevation: 0, // Remove elevation to avoid double shadow
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: Image.asset(
                'assets/arrow-left.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(), // Your destination screen
                  ),
                );
              },
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter and Sort By Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    showFilterDialog(context);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/filter.png', // Use provided filter asset
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Filter",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4F5159),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showSortDialog(context);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/sort.png', // Use provided sort asset
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Sort By",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4F5159),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Overall Rating Section as Row
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffEFF6FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '4.6',
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const Text('/5',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Based on 120 Reviews',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(5, (index) {
                          return const Icon(Icons.star,
                              color: Colors.orange, size: 18);
                        }),
                      ),
                    ],
                  ),
                  Gap(50),
                  // Star Breakdown Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Text(
                                '${5 - index} Star',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff999999),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: (5 - index) / 5,
                                  color: Colors.orange,
                                  backgroundColor: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Add Review Button
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.add, color: Color(0xff7B7D82)),
              ),
              title: Text(
                'Add A Review',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff393C44),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Color(0xff7B7D82)),
              onTap: () {},
            ),
            const Divider(thickness: 1.0),
            const SizedBox(height: 16),
            // Reviews List
            Expanded(
              child: ListView(
                children: [
                  ReviewTile(
                    rating: 5,
                    reviewTitle: 'Amazing',
                    reviewText:
                        "An amazing fit! I am somewhere around 6ft and ordered 40 size, it's a perfect fit and quality is worth the price...",
                    reviewerName: "David Johnson",
                    reviewDate: "1st Jan 2020",
                    images: [
                      'assets/review1.png',
                      'assets/review2.png',
                      'assets/review3.png'
                    ],
                  ),
                  const SizedBox(height: 16),
                  ReviewTile(
                    rating: 5,
                    reviewTitle: 'Fits Well',
                    reviewText:
                        "Fits well. Shirt is exactly as shown in the above picture. Perfect fitting as expected. Value for money product!",
                    reviewerName: "Wade Warren",
                    reviewDate: "15th Feb 2022",
                    images: [],
                  ),
                  const SizedBox(height: 16),
                  ReviewTile(
                    rating: 4,
                    reviewTitle: 'Great Quality',
                    reviewText: "Great Quality",
                    reviewerName: "Jane Doe",
                    reviewDate: "3rd Mar 2021",
                    images: ['assets/review1.png'],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter",
                      style: GoogleFonts.inter(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Gap(16),
              Text("Rating",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              const Gap(8),
              Wrap(
                spacing: 8,
                children: List.generate(5, (index) {
                  return FilterChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (i) {
                        return Icon(
                          Icons.star,
                          color:
                              i <= index ? Colors.orange : Colors.grey.shade300,
                          size: 16,
                        );
                      }),
                    ),
                    selected: false,
                    onSelected: (bool selected) {},
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  void showSortDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sort By",
                      style: GoogleFonts.inter(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Gap(16),
              ...[
                "Most Helpful",
                "Most Useful",
                "Highest Rating",
                "Lowest Rating",
                "Recent"
              ].map((option) {
                return ListTile(
                  title: Text(option, style: GoogleFonts.inter(fontSize: 14)),
                  onTap: () {},
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}

class ReviewTile extends StatelessWidget {
  final int rating;
  final String reviewTitle;
  final String reviewText;
  final String reviewerName;
  final String reviewDate;
  final List<String> images;

  const ReviewTile({
    Key? key,
    required this.rating,
    required this.reviewText,
    required this.reviewerName,
    required this.reviewDate,
    this.images = const [],
    required this.reviewTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: index < rating ? Colors.orange : Colors.grey.shade300,
              size: 18,
            );
          }),
        ),
        const SizedBox(height: 12),
        Text(
          reviewTitle,
          style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff393C44)),
        ),
        Gap(2),
        Text(
          reviewText,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Color(0xffA7A8AC),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: images.map((image) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Text(
          "$reviewerName, $reviewDate",
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
