import 'package:bmi/core/app_colors.dart';
import 'package:bmi/core/widgets/CustomWidget.dart';
import 'package:bmi/core/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/build_counter_widget.dart';
import '../../core/widgets/custom_choise.dart';
import 'result_screen.dart';

class InfoScreen extends StatefulWidget {
  static const String routeName = "info_screen";
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  int height = 0;
  int weight = 0;
  String gender = ""; // male / female

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "B M I",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: AppColors.green,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _buildLabel("Name"),
                  TextFormWidget(
                    keyboardType: TextInputType.text,
                    isDateTime: false,
                    controller: nameController,
                    validator: (v) =>
                    (v == null || v.trim().isEmpty) ? "Enter your name" : null,
                  ),
                  const SizedBox(height: 12),

                  _buildLabel("Birth Date"),
                  TextFormWidget(
                    isDateTime: false,
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                    (v == null || v.trim().isEmpty) ? "Enter your age" : null,
                  ),

                  const SizedBox(height: 18),
                  _buildLabel("Choose Gender"),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomChoice(
                        imagePath: "assets/images/male.png",
                        isSelected: gender == "male",
                        label: "Male",
                        onTap: () => setState(() => gender = "male"),
                      ),
                      CustomChoice(
                        imagePath: "assets/images/female.png",
                        isSelected: gender == "female",
                        label: "Female",
                        onTap: () => setState(() => gender = "female"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),
                  _buildLabel("Your Height (cm)"),
                  buildCounter(
                    value: height,
                    onDecrement: () => setState(() {
                      if (height > 0) height--;
                    }),
                    onIncrement: () => setState(() => height++),
                  ),

                  const SizedBox(height: 12),
                  _buildLabel("Your Weight (kg)"),
                  buildCounter(
                    value: weight,
                    onDecrement: () => setState(() {
                      if (weight > 0) weight--;
                    }),
                    onIncrement: () => setState(() => weight++),
                  ),

                  const SizedBox(height: 22),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (!_formKey.currentState!.validate()) return;
                        if (gender.isEmpty) return _showError("Please choose gender");
                        if (height <= 0 || weight <= 0) {
                          return _showError("Please set height & weight");
                        }

                        Navigator.pushNamed(
                          context,
                          ResultScreen.routeName,
                          arguments: {
                            "name": nameController.text.trim(),
                            "age": int.tryParse(ageController.text.trim()) ?? 0,
                            "gender": gender,
                            "height": height.toDouble(),
                            "weight": weight.toDouble(),
                          },
                        );
                      },
                      child:  CustomWidget(text: "Calculate BMI"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }


}
