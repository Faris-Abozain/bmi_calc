import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final bool isDateTime;
  final TextEditingController controller;

  const TextFormWidget({
    super.key,
    required this.isDateTime,
    required this.controller, required TextInputType keyboardType,  required String? Function(dynamic v) validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      keyboardType: isDateTime ? TextInputType.datetime : TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
