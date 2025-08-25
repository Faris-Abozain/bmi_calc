import 'package:bmi/screens/on_boarding/welcome_screen.dart';
import 'package:bmi/screens/presentation/info_screen.dart';
import 'package:bmi/screens/presentation/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName, // أو InfoScreen.routeName لو لسه ما ظبطتش Welcome
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        InfoScreen.routeName: (context) => const InfoScreen(),
        ResultScreen.routeName: (context) => const ResultScreen(),
      },
    );
  }
}
