import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashSaleBanner extends StatelessWidget {
  final int endTime;

  FlashSaleBanner({super.key})
      : endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background image with BoxFit.cover
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/flash1.png', // Replace with your image path
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          // Dark overlay for better text contrast
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xff16161E).withOpacity(0.5),
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          // Text and Countdown Timer
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Super Flash Sale\n50% Off",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'GrandsExtended',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Countdown Timer
              CountdownTimer(
                endTime: endTime,
                widgetBuilder: (_, time) {
                  if (time == null) {
                    return Text(
                      'Sale Ended',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlashSaleTimerBox(
                          time: time.hours?.toString().padLeft(2, '0') ?? '00'),
                      Text(" : ",
                          style: GoogleFonts.inter(
                              color: Colors.white, fontSize: 18)),
                      FlashSaleTimerBox(
                          time: time.min?.toString().padLeft(2, '0') ?? '00'),
                      Text(" : ",
                          style: GoogleFonts.inter(
                              color: Colors.white, fontSize: 18)),
                      FlashSaleTimerBox(
                          time: time.sec?.toString().padLeft(2, '0') ?? '00'),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Timer Box Widget
class FlashSaleTimerBox extends StatelessWidget {
  final String time;

  const FlashSaleTimerBox({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        time,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
