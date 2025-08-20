import 'package:bmi/screens/on_boarding/welcome_screen.dart';
import 'package:bmi/screens/presentation/info_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:
        {
          WelcomeScreen.routeName:(context)=>WelcomeScreen(),
          InfoScreen.routeName:(context)=>InfoScreen(),
        }

    );
  }
}


