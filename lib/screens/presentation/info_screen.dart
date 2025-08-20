import 'package:bmi/core/app_colors.dart';
import 'package:bmi/core/widgets/CustomWidget.dart';
import 'package:bmi/core/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/container_widget.dart';

class InfoScreen extends StatefulWidget {
  static const String routeName="info_screen";
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int height=0;
  int weight=0;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "B M I",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: AppColors.green),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Name",style: TextStyle(fontSize: 16),)
                  ],
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormWidget(),
                ), Row(
                  children: [
                    Text("Birth Date",style: TextStyle(fontSize: 16),)
                  ],
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormWidget()
                ),
                Text("Choose Gender",style: TextStyle(fontSize: 16),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/male.png"),
                    Image.asset("assets/images/female.png"),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("Your Height(cm)")
                  ],
                ),
                Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  height: 45,
                  width: 340,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16)
            
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(height>0){
                                  height--;
                                }else{
                                  return;
                                }
                              });
                            },
                            child: Icon(Icons.minimize, size: 30,)),
                      ),
                      Spacer(),
                      Center(child: Text(height.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900),)),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              height++;
                            });
                          },
                          child: Icon(Icons.add, size: 30,))
                    ],
                  ),
                ),
              ),
            ),
                Row(
                  children: [
                    Text("Your Weight(kg)"),
                  ],
                ),
                Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Container(
                height: 45,
                width: 340,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16)
            
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if(weight>0){
                                weight--;
                              }else{
                                return;
                              }
                            });
                          },
                          child: Icon(Icons.minimize, size: 30,)),
                    ), Spacer(),
                    Text(weight.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900),),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            weight++;
                          });
                        },
                        child: Icon(Icons.add, size: 30,))
                  ],
                ),
              ),
            ),
                    ),
                SizedBox(height: 20,),
                Center(child: CustomWidget(text: "Calculate BMI"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}






