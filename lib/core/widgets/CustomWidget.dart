import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomWidget extends StatelessWidget {
  String text;
   CustomWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:45 ,
      width: 330,
      decoration: BoxDecoration(
          color: AppColors.dark_purple,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 16),)),
    );
  }
}
