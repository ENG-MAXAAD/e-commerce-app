import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'BannerWidget.dart';

class CustomCarousel extends StatefulWidget {
  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  final List<Widget> banners = [
    BannerWidget(
      imageUrl: 'assets/banner1.png',
      title: "New items with \n Free shipping",
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
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Carousel Slider
        CarouselSlider(
          items: banners,
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        // Custom Dots Indicator on the right
        Positioned(
          right: 16,
          top: 80,
          child: Column(
            children: banners.asMap().entries.map((entry) {
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? Colors.white
                      : Colors.white.withOpacity(0.4),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
