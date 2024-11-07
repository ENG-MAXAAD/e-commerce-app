import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterTab extends StatefulWidget {
  const FilterTab({Key? key}) : super(key: key);

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
    "Potatoes",
    "Accessories",
    "Clothes"
  ];

  List<String> categories = [
    "Shoes",
    "Laptops",
    "Butter",
    "Potatoes",
    "Accessories",
    "Clothes"
  ];

  String selectedLocation = 'Shoes';
  String selectedCategory = 'Laptops';
  int selectedRating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Filters',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                minPrice = 230;
                maxPrice = 1568;
                selectedLocation = 'Shoes'; // Reset to default
                selectedCategory = 'Laptops'; // Reset to default
                selectedRating = 0; // Reset rating
              });
            },
            child: Text(
              'Clear Filter',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFF3B30),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price Range Section
              Text(
                'Price Range',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff393C44),
                ),
              ),
              const SizedBox(height: 24),
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/Pagination.png', // Replace with your asset
                      height: 56,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: SfRangeSlider(
                      min: 0.0,
                      max: 2000.0,
                      values: SfRangeValues(minPrice, maxPrice),
                      onChanged: (SfRangeValues values) {
                        setState(() {
                          minPrice = values.start;
                          maxPrice = values.end;
                        });
                      },
                      activeColor: const Color(0xFF2563EB),
                      inactiveColor: const Color(0xFFE5E7EB),
                      enableTooltip: false,
                      minorTicksPerInterval: 1,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${minPrice.toStringAsFixed(0)}',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff4F5159),
                      ),
                    ),
                    Text(
                      '\$${maxPrice.toStringAsFixed(0)}',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff4F5159),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Location Section
              _buildSection('Location', locations, selectedLocation, (value) {
                setState(() => selectedLocation = value);
              }),
              const SizedBox(height: 24),

              // Category Section
              _buildSection('Category', categories, selectedCategory, (value) {
                setState(() => selectedCategory = value);
              }),
              const SizedBox(height: 24),

              // Rating Section
              Text(
                'Rating',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF23262F),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 14, // Horizontal space between rating chips
                runSpacing: 10, // Increased vertical space between rows
                children: [1, 2, 3, 4, 5]
                    .map((rating) => _buildRatingChip(rating))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {
              // Apply filter logic
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF23262F),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              'Apply Filter',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    String title,
    List<String> items,
    String selectedItem,
    Function(String) onSelected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xff393C44),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 24,
          runSpacing: 10,
          children: items.map((item) {
            final isSelected = selectedItem == item;
            return GestureDetector(
              onTap: () => onSelected(item),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : const Color(0xffF5FAFF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xff2563EB)
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Text(
                  item,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: isSelected
                        ? const Color(0xFF2563EB)
                        : const Color(0xff4F5159),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRatingChip(int rating) {
    final isSelected = selectedRating == rating;
    return GestureDetector(
      onTap: () => setState(() => selectedRating = isSelected ? 0 : rating),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF5FAFF) : const Color(0xFFF6F8FE),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xff2563EB) : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            rating,
            (index) => const Icon(
              Icons.star_rounded,
              size: 16,
              color: Color(0xFFFFB800),
            ),
          ),
        ),
      ),
    );
  }
}
