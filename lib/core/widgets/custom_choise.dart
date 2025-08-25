import 'package:flutter/material.dart';

class CustomChoice extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomChoice({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onTap, required String label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: Colors.green, width: 3)
              : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(
          imagePath,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
