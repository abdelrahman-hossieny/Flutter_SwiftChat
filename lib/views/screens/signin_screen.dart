import 'package:animations/animations.dart';
import 'package:chatapp/helpers/widgets/CustomButton.dart';
import 'package:chatapp/helpers/widgets/CustomText.dart';
import 'package:chatapp/views/screens/sign_up_screen.dart';
import 'package:chatapp/views/widget/EmailTextField.dart';
import 'package:chatapp/views/widget/PassTextField.dart';
import 'package:flutter/material.dart';

import '../../helpers/theme/AppColors.dart';

class SigninScreen extends StatelessWidget {
   SigninScreen({super.key});

  final TextEditingController emailCont=TextEditingController();
  final TextEditingController passCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(text: "SwiftChat", weight: FontWeight.bold, size: 40),
            SizedBox(height: 5,),
            CustomText(text: "Welcome back! Sign in or create an account.", weight: FontWeight.w500, size: 20 , color: AppColors.textSecondary,),
            SizedBox(height: 30,),
            Emailtextfield(cont: emailCont),
            SizedBox(height: 20,),
            Passtextfield(cont: passCont),
            SizedBox(height: 40,),
            Custombutton(color: AppColors.primaryColor,onPressed: () {
              
            }, widget: CustomText(text: "Login", weight: FontWeight.bold, size: 18,color: AppColors.backgroundColor,))
        ,SizedBox(height: 20,),

         Row(
              children: [
                Expanded(
                  child: Container(
                    height: .7,
                    color: AppColors.textSecondary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomText(text: "OR", weight: FontWeight.w500, size: 15,color: AppColors.textSecondary,),
                ),
                Expanded(
                  child: Container(
                    height:.7,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          SizedBox(height: 30,),
            Custombutton(onPressed: () {

            }, widget:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle,color: AppColors.textPrimary,size: 25,),
                SizedBox(width: 10,),
                CustomText(text: "Continue with google", weight: FontWeight.bold, size: 18)
              ],
            ) , color:AppColors.inputBackground ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "don't have an account , ", weight: FontWeight.w500, size: 12,color: AppColors.textSecondary,),
                GestureDetector(
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 1700),
                    reverseTransitionDuration: Duration(milliseconds: 1700),

                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SignUpScreen();
                    },));
                }
                ,child: CustomText(text: "Sign Up", weight: FontWeight.w500, size: 12,)),

              ],
            )
          ],
        ),
      ),),
    );
  }
}
