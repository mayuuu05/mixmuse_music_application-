import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home_screen.dart';


class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF26CCD),
                  Color(0xFFD495DB),
                  Color(0xFFE4BEE2),
                  Color(0xFFB9C4E7),
                  Color(0xFF99BEE9),
                  Color(0xFF5BA7F5),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.12 + 5),
                Text(
                  'MixMuse',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.08,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Your Music, Your Vibe, Anytime',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.049,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Find your latest favourite music\nfrom our collection',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.045,
                      color: Colors.black,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(height: screenHeight * 0.070),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.15,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.099),
                Image.asset(
                  'assets/images/istockphoto-1395567847-612x612__1_-removebg-preview.png',
                  height: 380,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}