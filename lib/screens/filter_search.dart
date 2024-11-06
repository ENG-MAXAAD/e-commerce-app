import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterTab extends StatefulWidget {
  @override
  _FilterTabState createState() => _FilterTabState();
}

class _FilterTabState extends State<FilterTab> {
  double minPrice = 230;
  double maxPrice = 1568;

  List<String> locations = [
    "Shoes",
    "Laptops",
    "Butter",
    "Clothes",
    "Potatoes",
    "Accessories"
  ];

  List<String> categories = [
    "Shoes",
    "Laptops",
    "Butter",
    "Clothes",
    "Potatoes",
    "Accessories"
  ];

  String selectedLocation = '';
  String selectedCategory = '';
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Filters",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                minPrice = 230;
                maxPrice = 1568;
                selectedLocation = '';
                selectedCategory = '';
                selectedRating = 0;
              });
            },
            child: Text(
              "Clear Filter",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffE53935),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price Range Slider
            const SizedBox(height: 16),
            Text(
              "Price Range",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff393C44),
              ),
            ),
            const SizedBox(height: 8),
            SfRangeSlider(
              min: 0,
              max: 2000,
              values: SfRangeValues(minPrice, maxPrice),
              onChanged: (SfRangeValues values) {
                setState(() {
                  minPrice = values.start;
                  maxPrice = values.end;
                });
              },
              showLabels: true,
              interval: 250,
              showTicks: true,
              activeColor: Color(0xff007AFF),
              inactiveColor: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${minPrice.toStringAsFixed(0)}',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4F5159)),
                ),
                Text(
                  '\$${maxPrice.toStringAsFixed(0)}',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4F5159)),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Location Chips
            Text(
              "Location",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff393C44),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: locations.map((location) {
                return ChoiceChip(
                  label: Text(
                    location,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: selectedLocation == location
                          ? Color(0xff2563EB)
                          : Color(0xff4F5159),
                    ),
                  ),
                  selected: selectedLocation == location,
                  selectedColor: Colors.white,
                  backgroundColor: Color(0xffF0F2F5),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: selectedLocation == location
                            ? Color(0xff2563EB)
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedLocation = selected ? location : '';
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Category Chips
            Text(
              "Category",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff393C44),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: categories.map((category) {
                return ChoiceChip(
                  label: Text(
                    category,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: selectedCategory == category
                          ? Color(0xff2563EB)
                          : Color(0xff4F5159),
                    ),
                  ),
                  selected: selectedCategory == category,
                  selectedColor: Colors.white,
                  backgroundColor: Color(0xffF0F2F5),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: selectedCategory == category
                            ? Color(0xff2563EB)
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = selected ? category : '';
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Rating Filter Chips
            Text(
              "Rating",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff393C44),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [1, 3, 4, 5].map((stars) {
                return ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(stars, (starIndex) {
                      return Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 16,
                      );
                    }),
                  ),
                  selected: selectedRating == stars,
                  selectedColor: Color(0xffFDEFC3),
                  backgroundColor: Color(0xffF0F2F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: selectedRating == stars
                          ? Color(0xff2563EB)
                          : Colors.transparent,
                    ),
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      selectedRating = selected ? stars : 0;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Apply filter action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff23262F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(56),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            "Apply Filter",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
