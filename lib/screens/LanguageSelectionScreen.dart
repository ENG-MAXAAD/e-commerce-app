// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl_phone_field/countries.dart';
//
// class LanguageSelectionScreen extends StatefulWidget {
//   @override
//   _LanguageSelectionScreenState createState() =>
//       _LanguageSelectionScreenState();
// }
//
// class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
//   Country selectedCountry = Country.US;
//   List<Country> suggestedCountries = [
//     Country.US,
//     Country.ID,
//   ];
//   List<Country> allCountries = [
//     Country.AL, // Albania
//     Country.AE, // UAE (Arabic)
//     Country.AZ, // Azerbaijan
//     Country.BY, // Belarus
//     Country.BA, // Bosnia
//     Country.BG, // Bulgaria
//     Country.BR, // Brazil
//     // Add more as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Language',
//           style: GoogleFonts.inter(
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Suggestion",
//               style: GoogleFonts.inter(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 8),
//             ...suggestedCountries.map((country) => _buildCountryTile(country)),
//             const Divider(),
//             Text(
//               "All Languages",
//               style: GoogleFonts.inter(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Expanded(
//               child: ListView(
//                 children: allCountries.map((country) => _buildCountryTile(country)).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCountryTile(Country country) {
//     return ListTile(
//       leading: CountryPickerUtils.getDefaultFlagImage(country),
//       title: Text(
//         country.name,
//         style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
//       ),
//       trailing: Radio<Country>(
//         value: country,
//         groupValue: selectedCountry,
//         onChanged: (Country? value) {
//           setState(() {
//             selectedCountry = value!;
//           });
//         },
//         activeColor: Colors.blue,
//       ),
//       onTap: () {
//         setState(() {
//           selectedCountry = country;
//         });
//       },
//     );
//   }
// }
