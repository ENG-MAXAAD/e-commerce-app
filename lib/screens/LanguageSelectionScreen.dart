import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'English (US)';

  final List<Map<String, String>> suggestedLanguages = [
    {"name": "English (US)", "flag": "assets/flags/us.png"},
    {"name": "Indonesia", "flag": "assets/flags/id.png"},
  ];

  final List<Map<String, String>> allLanguages = [
    {"name": "Albanian", "flag": "assets/flags/al.png"},
    {"name": "Arabic", "flag": "assets/flags/ar.png"},
    {"name": "Azerbaijani", "flag": "assets/flags/az.png"},
    {"name": "Belarusian", "flag": "assets/flags/by.png"},
    {"name": "Bosnian", "flag": "assets/flags/ba.png"},
    {"name": "Bulgarian", "flag": "assets/flags/bg.png"},
    {"name": "Brazil", "flag": "assets/flags/br.png"},
  ];

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
                color: Color(0x0F4B5563), // Equivalent to #4B55630F
                offset: Offset(0, 6), // x = 0, y = 6 for vertical shadow
                blurRadius: 12.0, // Matches the 12px blur radius
                spreadRadius: 0, // Matches the 0px spread
              ),
            ],
          ),
          child: AppBar(
            title: Text(
              'Language',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Suggested Languages
            Text(
              "Suggestion",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff393C44),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: suggestedLanguages.map((language) {
                return LanguageOption(
                  language: language['name']!,
                  flag: language['flag']!,
                  isSelected: selectedLanguage == language['name'],
                  onSelect: () {
                    setState(() {
                      selectedLanguage = language['name']!;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // All Languages
            Text(
              "All Language",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff393C44),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: allLanguages.map((language) {
                  return LanguageOption(
                    language: language['name']!,
                    flag: language['flag']!,
                    isSelected: selectedLanguage == language['name'],
                    onSelect: () {
                      setState(() {
                        selectedLanguage = language['name']!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String language;
  final String flag;
  final bool isSelected;
  final VoidCallback onSelect;

  const LanguageOption({
    required this.language,
    required this.flag,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        flag,
        width: 24,
        height: 24,
      ),
      title: Text(
        language,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff393C44),
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: Color(0xFF2563EB))
          : Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFD3D4D5), width: 1),
              ),
            ),
      onTap: onSelect,
    );
  }
}
