import 'package:bmi/core/app_colors.dart';
import 'package:bmi/screens/presentation/info_screen.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/CustomWidget.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName="/";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Image.asset("assets/images/welcome_image.png"),
                Container(
                  height: 370,
                  width:500,
                  decoration: BoxDecoration(color: AppColors.purple),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Know Your Body Better\n ,Get Your BMI Score in Less\n Than a Minute!",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900,color: Colors.white),),
                        SizedBox(height: 30,),
                        Text("It takes just 30 seconds – and your health is\n worth it!",style: TextStyle(color: Colors.white),),
                        SizedBox(height: 50,),
                        Divider(color: Colors.white,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 33),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, InfoScreen.routeName);
                              },
                              child: CustomWidget(text: "Get Started",)),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),


          )
        ],
      ),
    );
  }
}

