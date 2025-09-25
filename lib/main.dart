import 'package:chatapp/controllers/signUp/sign_up_cubit.dart';
import 'package:chatapp/views/screens/signin_screen.dart';
import 'package:chatapp/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:
      [
         BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false
          ,
          home: SplashScreen()
      ),
    );
  }
}

