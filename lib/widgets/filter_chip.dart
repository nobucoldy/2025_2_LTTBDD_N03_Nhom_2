import 'package:flutter/material.dart';

Widget filterChip(String label, {bool isSelected = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: isSelected ? Colors.purple : Colors.purple.shade100,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
