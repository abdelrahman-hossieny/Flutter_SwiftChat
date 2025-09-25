import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/theme/AppColors.dart';

class Emailtextfield extends StatelessWidget {
  const Emailtextfield({super.key, required this.cont});
  final TextEditingController cont;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cont,
      decoration:InputDecoration(
        filled: true,
        fillColor: AppColors.inputBackground,
        hintText: "Email",
        hintStyle: GoogleFonts.splineSans(
          color: AppColors.textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
        prefixIcon: SizedBox(child: Center(child: Icon(Icons.email_outlined,color: AppColors.textSecondary,))),
        prefixIconConstraints: BoxConstraints.loose(Size.fromWidth(50)),
          disabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.inputborder,width: 1.2)
          ),
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.inputborder,width: 1.2)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.inputborder,width: 1.2)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.inputborder,width: 1.2)
          )

      ),
         validator: (value) {
           if (value == null || value.trim().isEmpty) {
             return 'Please enter your email !';
           }
           if (!RegExp(
             r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
           ).hasMatch(value.trim())) {
             return 'Please enter a valid email address';
           }
           return null;
         },
    );
  }
}
