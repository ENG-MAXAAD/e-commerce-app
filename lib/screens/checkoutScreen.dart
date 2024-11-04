import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/CustomSuceesBottom.dart';
import 'home.dart';
import 'login.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedPaymentMethod = 'Credit card';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _onPaymentMethodSelected(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  Widget _buildShippingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your shipping address',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        _buildStyledTextField(labelText: 'Full name', hintText: 'Placeholder'),
        const SizedBox(height: 8),
        _buildStyledTextField(
            labelText: 'Street address', hintText: 'Placeholder'),
        const SizedBox(height: 8),
        _buildStyledTextField(
            labelText: 'Apt / Suite / Other', hintText: 'Placeholder'),
        const SizedBox(height: 8),
        _buildStyledTextField(labelText: 'City', hintText: 'Placeholder'),
        const SizedBox(height: 8),
        _buildStyledTextField(
            labelText: 'Postal code', hintText: 'Placeholder'),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _tabController.animateTo(1); // Go to the next tab
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStyledTextField(
      {required String labelText, required String hintText}) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: 14,
          color: Colors.grey.shade400,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPaymentMethodContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose a payment method',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'You will not be charged until you review this order on the next page.',
          style: GoogleFonts.inter(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView(
            children: [
              PaymentOption(
                label: 'Credit card',
                iconAssets: ['assets/Mastercard.png', 'assets/Visa.png'],
                isSelected: _selectedPaymentMethod == 'Credit card',
                onSelected: () => _onPaymentMethodSelected('Credit card'),
              ),
              PaymentOption(
                label: 'Apple Pay',
                iconAssets: ['assets/ApplePay.png'],
                isSelected: _selectedPaymentMethod == 'Apple Pay',
                onSelected: () => _onPaymentMethodSelected('Apple Pay'),
              ),
              PaymentOption(
                label: 'PayPal',
                iconAssets: ['assets/Paypal.png'],
                isSelected: _selectedPaymentMethod == 'PayPal',
                onSelected: () => _onPaymentMethodSelected('PayPal'),
              ),
              PaymentOption(
                label: 'Alipay',
                iconAssets: ['assets/Alipay.png'],
                isSelected: _selectedPaymentMethod == 'Alipay',
                onSelected: () => _onPaymentMethodSelected('Alipay'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _tabController.animateTo(2); // Go to the next tab
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Confirm and continue',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please confirm and submit your order',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            text: 'By clicking submit order, you agree to Fintory\'s ',
            style: GoogleFonts.inter(fontSize: 14, color: Colors.black54),
            children: [
              TextSpan(
                text: 'Terms of Use',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
              TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset('assets/Mastercard.png', height: 24),
                      const SizedBox(width: 8),
                      Text('•••• 6714', style: GoogleFonts.inter()),
                      const SizedBox(width: 8),
                      Text('01/24',
                          style: GoogleFonts.inter(color: Colors.black54)),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Handle edit payment action
                },
                child: Text(
                  'Edit',
                  style: GoogleFonts.inter(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping address',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Name: Luke Skywalker\n'
                    'Street: 1313 Wolf Pen Road\n'
                    'City: San Francisco, CA\n'
                    'Postal code: 94107\n'
                    'Country: United States',
                    style: GoogleFonts.inter(),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Handle edit address action
                },
                child: Text(
                  'Edit',
                  style: GoogleFonts.inter(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                _showSuccessBottomSheet(context); // Show success bottom sheet
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              label: Text(
                'Submit Order',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => SuccessBottomSheet(
        title: "Success!",
        message: "Your checkout was successful! Thank you for your purchase.",
        buttonText: "Proceed",
        onButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        },
        checkmarkImagePath: 'assets/message.png', // Custom image path
      ),
    );
  }

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
                color: Color(0x0F4B5563),
                offset: Offset(2, 2),
                blurRadius: 12.0,
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Checkout',
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StepIndicator(
                      isActive: _tabController.index == 0,
                      label: 'Shipping',
                      stepNumber: 1,
                      onTap: () => _tabController.animateTo(0)),
                  StepIndicator(
                      isActive: _tabController.index == 1,
                      label: 'Payment',
                      stepNumber: 2,
                      onTap: () => _tabController.animateTo(1)),
                  StepIndicator(
                      isActive: _tabController.index == 2,
                      label: 'Review',
                      stepNumber: 3,
                      onTap: () => _tabController.animateTo(2)),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildShippingContent(),
                  _buildPaymentMethodContent(),
                  _buildReviewContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Step Indicator Widget for the progress at the top of each step in the checkout process
class StepIndicator extends StatelessWidget {
  final bool isActive;
  final String label;
  final int stepNumber;
  final VoidCallback onTap;

  const StepIndicator({
    Key? key,
    required this.isActive,
    required this.label,
    required this.stepNumber,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: isActive ? Colors.green : Colors.grey.shade300,
            child: isActive
                ? Icon(Icons.check, color: Colors.white, size: 16)
                : Text(
                    stepNumber.toString(),
                    style: TextStyle(color: Colors.black87, fontSize: 12),
                  ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: isActive ? Colors.black : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (stepNumber < 3) ...[
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          ],
        ],
      ),
    );
  }
}

// Payment Option Widget for each payment method option in the payment step
class PaymentOption extends StatelessWidget {
  final String label;
  final List<String> iconAssets;
  final bool isSelected;
  final VoidCallback onSelected;

  const PaymentOption({
    Key? key,
    required this.label,
    required this.iconAssets,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Radio(
              value: label,
              groupValue: isSelected ? label : null,
              onChanged: (_) => onSelected(),
              activeColor: Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Row(
              children: iconAssets
                  .map((asset) => Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(asset, height: 24),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
