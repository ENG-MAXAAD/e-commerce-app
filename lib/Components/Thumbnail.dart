// Helper Widget for Thumbnail Images
import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String imagePath;

  const Thumbnail({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 77, // Adjusted width to better fit the design
        height: 84, // Adjusted height for aspect ratio alignment
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
