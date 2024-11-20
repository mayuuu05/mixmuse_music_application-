import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../intro/intro_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/360_F_378474068_qzJGR2nJxmXsytavRelUgokS1GV8gNBN-removebg-preview.png',
            height: screenHeight * 0.4,
            width: screenWidth * 0.6,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      nextScreen: IntroScreen(),
      splashIconSize: screenHeight * 0.4,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}