import 'dart:math' as math;
import 'package:animations/animations.dart';
import 'package:chatapp/helpers/theme/AppColors.dart';
import 'package:chatapp/helpers/widgets/CustomText.dart';
import 'package:chatapp/views/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }
  void init() async{
    await Future.delayed(Duration(milliseconds: 4700));
    Navigator.pushReplacement(context, PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 1500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeThroughTransition(
         animation: animation,
         secondaryAnimation: secondaryAnimation,
         child: child,
       );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
      return SigninScreen();
    },));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle
                  ),

                ).animate().fadeIn(
                  duration: Duration(milliseconds: 1500),
                  delay: const Duration(milliseconds: 2200),
                  curve: Curves.easeInOut
                ),
                SvgPicture.asset(
                  "assets/images/logo.svg",
                  width: 150,
                  height: 150,
                )
                    .animate()
                    .moveX(
                  duration: const Duration(milliseconds: 2500),
                  begin: 800,
                  end: 0,
                  curve: Curves.easeInOut,
                )
                    .rotate(
                  duration: const Duration(milliseconds: 2500),
                  end: 0, // Return to original direction (0 degrees)
                  begin: math.pi * 2, // Start from 360 degrees
                  curve: Curves.easeInOut,
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomText(
              text: "SwiftChat",
              weight: FontWeight.bold,
              size: 30,
            )
                .animate()
                .fadeIn(
              duration: const Duration(milliseconds: 1500),
              delay: const Duration(milliseconds: 2500),
            )
                .moveY(
              duration: const Duration(milliseconds: 1500),
              begin: -200,
              end: 0,
              curve: Curves.elasticOut,
              delay: const Duration(milliseconds: 2500),
            )
          ],
        ),
      ),
    );
  }
}