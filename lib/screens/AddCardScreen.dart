import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewCardScreen extends StatefulWidget {
  @override
  _AddNewCardScreenState createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  bool _obscureCardNumber = true;

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
                color: Color(0x0F4B5563), // 6% opacity gray shadow color
                offset: Offset(2, 2), // position of the shadow
                blurRadius: 12.0, // blur intensity
              ),
            ],
          ),
          child: AppBar(
            title: const Text(
              'Add New Card',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
            elevation: 0, // Set AppBar elevation to 0 to avoid double shadow
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cardholder Name Field
            _buildTextField('Cardholder Name', false),
            const SizedBox(height: 16),
            // Card Number Field with Toggle Visibility
            _buildCardNumberField(),
            const SizedBox(height: 16),
            // Expiry Date and CVV Row
            Row(
              children: [
                Expanded(child: _buildTextField('MM / YY', false)),
                const SizedBox(width: 17),
                Expanded(child: _buildTextField('3-digit CVV', false)),
              ],
            ),
            const SizedBox(height: 42),
            // Add New Card Button
            _buildAddNewCardButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, bool obscureText) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.21, // Equivalent to 19.36px line height for font size 16px
          color: const Color(0xff7B7D82),
        ),
        filled: true,
        fillColor: const Color(0xffF9F9FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.21, // Equivalent to 19.36px line height for font size 16px
        color: const Color(0xff7B7D82),
      ),
    );
  }

  Widget _buildCardNumberField() {
    return TextField(
      obscureText: _obscureCardNumber,
      decoration: InputDecoration(
        hintText: 'Card Number',
        hintStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.21,
          color: const Color(0xff7B7D82),
        ),
        filled: true,
        fillColor: const Color(0xffF9F9FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'assets/Mastercard11.png', // Replace with your asset path
                width: 40,
                height: 30,
              ),
            ),
          ],
        ),
      ),
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.21,
        color: const Color(0xff7B7D82),
      ),
    );
  }

  Widget _buildAddNewCardButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xff23262F),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: () {
            print('Add new card button tapped');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/scan.png', // Update to the correct asset path
                      color: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Add New Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/right_arrow.png', // Update to the correct asset path
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
