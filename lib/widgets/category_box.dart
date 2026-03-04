import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryBox extends StatelessWidget {
  final CategoryModel? category;
  final VoidCallback onTap;

  const CategoryBox({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Colors.purple.shade50;
    final Color borderColor = Colors.purple.shade200;
    final Color textColor = Colors.purple;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 70,
        height: 22,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            category?.name ?? 'Không có thể loại',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
          ),
        ),
      ),
    );
  }
}
