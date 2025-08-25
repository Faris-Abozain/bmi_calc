import 'package:bmi/api_manger/calc_bmi.dart';
import 'package:bmi/core/app_colors.dart';
import 'package:bmi/core/widgets/CustomWidget.dart';
import 'package:flutter/material.dart';
import '../../models/bmi_model.dart';

class ResultScreen extends StatefulWidget {
  static const String routeName = "result_screen";
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late final String name;
  late final int age;
  late final String gender;
  late final double height;
  late final double weight;

  late Future<BmiModel?> _future;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    name = (args?["name"] ?? "Unknown") as String;
    age = (args?["age"] ?? 0) as int;
    gender = (args?["gender"] ?? "Unknown") as String;
    height = (args?["height"] ?? 0.0) as double;
    weight = (args?["weight"] ?? 0.0) as double;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<BmiModel?>(
        future: calcBmi(height: height,weight: weight),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.black));
          }
          if (snapshot.hasError) {
            return _buildError("Something went wrong");
          }
          // if (!snapshot.hasData || snapshot.data?.data == null) {
          //   return _buildError("No Data Found");
          // }

          final data = snapshot.data!.data!;
          return Center(
            child: Column(
              children: [
                Container(
                  height: 270,
                  width: 350,
                  decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name.isNotEmpty ? name : "Unknown",
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            Text(
                              "A ${age > 0 ? age : "-"} years old $gender.",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                (data.bmi ?? 0).toStringAsFixed(1),
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ),
                            const Text("BMI Calc",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text("${data.height ?? "-"} cm",
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white)),
                                    const Text("Height",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ],
                                ),
                                const SizedBox(
                                    height: 60, child: VerticalDivider(color: Colors.white70)),
                                Column(
                                  children: [
                                    Text("${data.weight ?? "-"} kg",
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white)),
                                    const Text("Weight",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Image.asset("assets/images/Vector (2).png"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.summary ?? "",
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                        const SizedBox(height: 8),
                        Text(data.risk ?? "",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        const SizedBox(height: 8),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(data.recommendation ?? "",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child:  CustomWidget(text: "Calculate BMI Again"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(fontSize: 18, color: Colors.red)),
          const SizedBox(height: 10),
          InkWell(
            onTap: () => setState(() {}),
            child:  CustomWidget(text: "Try Again"),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => Navigator.pop(context),
            child:  CustomWidget(text: "Back"),
          ),
        ],
      ),
    );
  }
}
