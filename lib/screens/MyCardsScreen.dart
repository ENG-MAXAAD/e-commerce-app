// import 'package:flutter/material.dart';
// import 'package:u_credit_card/u_credit_card.dart';
//
// class MyCardsScreen extends StatefulWidget {
//   const MyCardsScreen({Key? key}) : super(key: key);
//
//   @override
//   _MyCardsScreenState createState() => _MyCardsScreenState();
// }
//
// class _MyCardsScreenState extends State<MyCardsScreen> {
//   List<CreditCardData> cards = [
//     CreditCardData(
//       cardNumber: '4111 1111 1111 1111',
//       expiryDate: '12/24',
//       cardHolderName: 'JOHN DOE',
//       cvv: '123',
//       cardType: CardType.visa,
//       cardColor: const Color(0xFF2B2B2B),
//     ),
//     CreditCardData(
//       cardNumber: '5555 5555 5555 4444',
//       expiryDate: '10/25',
//       cardHolderName: 'JANE SMITH',
//       cvv: '456',
//       cardType: CardType.masterCard,
//       cardColor: const Color(0xFFFF9966),
//     ),
//     CreditCardData(
//       cardNumber: '3782 822463 10005',
//       expiryDate: '06/26',
//       cardHolderName: 'ROBERT JOHNSON',
//       cvv: '789',
//       cardType: CardType.americanExpress,
//       cardColor: const Color(0xFF9C6BFF),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'My Cards',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 220,
//               child: Stack(
//                 children: [
//                   for (int i = cards.length - 1; i >= 0; i--)
//                     Positioned(
//                       top: (cards.length - 1 - i) * 20.0,
//                       child: _buildCreditCard(cards[i]),
//                     ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             _buildAddNewCardButton(),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCreditCard(CreditCardData card) {
//     return CreditCardUi(
//       cardNumber: card.cardNumber,
//       expiryDate: card.expiryDate,
//       cardHolderName: card.cardHolderName,
//       cvv: card.cvv,
//       cardType: card.cardType,
//       cardColor: card.cardColor,
//       cardBrandLogo: Container(
//         padding: const EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: const Text(
//           'COINPULSE',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       showBackSide: false,
//       frontBackground: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [card.cardColor, card.cardColor.withOpacity(0.8)],
//           ),
//         ),
//       ),
//       backBackground: Container(color: card.cardColor),
//       showShadow: true,
//       textExpDate: 'Exp. Date',
//       textName: 'Card Holder',
//       textExpiry: 'MM/YY',
//       width: 340,
//       height: 200,
//       textColor: Colors.white,
//       numberColor: Colors.white,
//     );
//   }
//
//   Widget _buildAddNewCardButton() {
//     return Container(
//       width: double.infinity,
//       height: 56,
//       decoration: BoxDecoration(
//         color: const Color(0xFF2B2B2B),
//         borderRadius: BorderRadius.circular(28),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(28),
//           onTap: _showAddCardDialog,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.credit_card,
//                       color: Colors.white,
//                     ),
//                     SizedBox(width: 12),
//                     Text(
//                       'Add New Card',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Icon(
//                   Icons.chevron_right,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showAddCardDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String cardNumber = '';
//         String expiryDate = '';
//         String cardHolderName = '';
//         String cvv = '';
//
//         return AlertDialog(
//           title: const Text('Add New Card'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   decoration: const InputDecoration(labelText: 'Card Number'),
//                   onChanged: (value) => cardNumber = value,
//                 ),
//                 TextField(
//                   decoration:
//                       const InputDecoration(labelText: 'Expiry Date (MM/YY)'),
//                   onChanged: (value) => expiryDate = value,
//                 ),
//                 TextField(
//                   decoration:
//                       const InputDecoration(labelText: 'Card Holder Name'),
//                   onChanged: (value) => cardHolderName = value,
//                 ),
//                 TextField(
//                   decoration: const InputDecoration(labelText: 'CVV'),
//                   onChanged: (value) => cvv = value,
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             TextButton(
//               child: const Text('Add'),
//               onPressed: () {
//                 if (cardNumber.isNotEmpty &&
//                     expiryDate.isNotEmpty &&
//                     cardHolderName.isNotEmpty &&
//                     cvv.isNotEmpty) {
//                   setState(() {
//                     cards.add(CreditCardData(
//                       cardNumber: cardNumber,
//                       expiryDate: expiryDate,
//                       cardHolderName: cardHolderName.toUpperCase(),
//                       cvv: cvv,
//                       cardType: _getCardType(cardNumber),
//                       cardColor: _getRandomColor(),
//                     ));
//                   });
//                   Navigator.of(context).pop();
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   CardType _getCardType(String cardNumber) {
//     if (cardNumber.startsWith('4')) {
//       return CardType.visa;
//     } else if (cardNumber.startsWith('5')) {
//       return CardType.masterCard;
//     } else if (cardNumber.startsWith('3')) {
//       return CardType.americanExpress;
//     } else {
//       return CardType.other;
//     }
//   }
//
//   Color _getRandomColor() {
//     return Color(
//             (DateTime.now().millisecondsSinceEpoch * 0.000001).toInt() << 0)
//         .withOpacity(1.0);
//   }
// }
//
// class CreditCardData {
//   final String cardNumber;
//   final String expiryDate;
//   final String cardHolderName;
//   final String cvv;
//   final CardType cardType;
//   final Color cardColor;
//
//   CreditCardData({
//     required this.cardNumber,
//     required this.expiryDate,
//     required this.cardHolderName,
//     required this.cvv,
//     required this.cardType,
//     required this.cardColor,
//   });
// }
