import 'package:animations/animations.dart';
import 'package:chatapp/views/screens/signin_screen.dart';
import 'package:chatapp/views/widget/name_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/theme/AppColors.dart';
import '../../helpers/widgets/CustomButton.dart';
import '../../helpers/widgets/CustomText.dart';
import '../widget/EmailTextField.dart';
import '../widget/PassTextField.dart';
import '../../controllers/signUp/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController nameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Account created successfully!"),
                  backgroundColor: Colors.green,
                ),
              );
              // Navigate to home or wherever you want
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(text: "SwiftChat", weight: FontWeight.bold, size: 40),
                  SizedBox(height: 5),
                  CustomText(
                    text: "create an account.",
                    weight: FontWeight.w500,
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(height: 30),
                  NameTextField(cont: nameCont),
                  SizedBox(height: 20),
                  Emailtextfield(cont: emailCont),
                  SizedBox(height: 20),
                  Passtextfield(cont: passCont),
                  SizedBox(height: 40),

                  // Sign Up Button wrapped with BlocBuilder
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return Custombutton(
                        color: AppColors.primaryColor,
                        onPressed: state is SignUpLoading
                            ? () {} // Empty function instead of null
                            : () {
                          context.read<SignUpCubit>().signUp(
                            emailCont.text.trim(),
                            passCont.text.trim(),
                          );
                        },
                        widget: state is SignUpLoading
                            ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.backgroundColor,
                            strokeWidth: 2,
                          ),
                        )
                            : CustomText(
                          text: "Sign up",
                          weight: FontWeight.bold,
                          size: 18,
                          color: AppColors.backgroundColor,
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 20),
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
                        child: CustomText(
                          text: "OR",
                          weight: FontWeight.w500,
                          size: 15,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: .7,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Custombutton(
                    onPressed: () {
                      // Google sign in logic here
                    },
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: AppColors.textPrimary,
                          size: 25,
                        ),
                        SizedBox(width: 10),
                        CustomText(
                          text: "Continue with google",
                          weight: FontWeight.bold,
                          size: 18,
                        )
                      ],
                    ),
                    color: AppColors.inputBackground,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "already have an account , ",
                        weight: FontWeight.w500,
                        size: 12,
                        color: AppColors.textSecondary,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CustomText(
                          text: "Sign in",
                          weight: FontWeight.w500,
                          size: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}