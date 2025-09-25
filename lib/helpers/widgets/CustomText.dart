import 'package:chatapp/helpers/theme/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key, required this.text, required this.weight, required this.size,this.color});

  final String text;
  final FontWeight weight;
  final double size;
 final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.splineSans(
        fontWeight: weight,
        fontSize: size,
        color: color??AppColors.textPrimary
      ),
    );

  }
}
