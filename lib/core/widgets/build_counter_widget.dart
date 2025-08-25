
import 'package:flutter/material.dart';

Widget buildCounter({
  required int value,
  required VoidCallback onDecrement,
  required VoidCallback onIncrement,
}) {
  return Container(
    height: 48,
    margin: const EdgeInsets.only(top: 6),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        const SizedBox(width: 8),
        GestureDetector(onTap: onDecrement, child: const Icon(Icons.remove, size: 28)),
        const Spacer(),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, anim) =>
              ScaleTransition(scale: anim, child: child),
          child: Text(
            "$value",
            key: ValueKey<int>(value),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
        ),
        const Spacer(),
        GestureDetector(onTap: onIncrement, child: const Icon(Icons.add, size: 28)),
        const SizedBox(width: 8),
      ],
    ),
  );
}