import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp_ecommerce/screens/SearchResultScreen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4B5563).withOpacity(0.06),
                offset: const Offset(0, 1),
                blurRadius: 8,
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            title: Container(
              height: 36,
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F8FE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => SearchResultScreen()));
                    },
                    child: Image.asset(
                      'assets/seach1.png',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.4),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/filter.png',
                    width: 20,
                    height: 20,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Last seen",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => _buildLastSeenItem(index),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Search History",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            _buildSearchHistoryGrid(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildLastSeenItem(int index) {
    final List<String> images = [
      'assets/last_seen1.png',
      'assets/last_seen2.png',
      'assets/last_seen3.png',
      'assets/last_seen4.png',
    ];

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(images[index]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSearchHistoryGrid() {
    final List<String> searchTerms = [
      "Shoes",
      "t-shirt for man",
      "butter",
      "potatoes",
      "accessories",
      "clothes",
    ];

    return Column(
      children: [
        Row(
          children: searchTerms
              .sublist(0, 3)
              .map((term) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SearchHistoryTag(text: term),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 8),
        Row(
          children: searchTerms
              .sublist(3, 6)
              .map((term) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SearchHistoryTag(text: term),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class SearchHistoryTag extends StatelessWidget {
  final String text;

  const SearchHistoryTag({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: GoogleFonts.inter(
          fontSize: 14,
          color: const Color(0xFF6B7280),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
