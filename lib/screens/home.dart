import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hello Sacky',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          // elevation: 2.0,

          // Left icon - menu icon with image
          leading: IconButton(
            icon: Image.asset(
              'assets/menu.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // Handle menu button press
            },
          ),

          // Right icons - search, notification, and shopping bag with images
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/search.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                // Handle search button press
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/notification.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                // Handle notification button press
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/bag.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                // Handle bag button press
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: const Center(
            child: Text('Welcome to the Home Screen!'),
          ),
        ),
      ),
    );
  }
}
