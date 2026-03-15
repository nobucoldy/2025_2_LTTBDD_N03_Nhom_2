import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../data/language_data.dart';

class CategoryBox extends StatelessWidget {
  final CategoryModel? category;
  final VoidCallback onTap;
  final String locale;

  const CategoryBox({
    super.key,
    required this.category,
    required this.onTap,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    String t(String key) => localizedText[locale]?[key] ?? key;

    final Color bgColor = Colors.purple.shade50;
    final Color borderColor = Colors.purple.shade200;
    final Color textColor = Colors.purple;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 80,
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
            category != null ? t(category!.name) : t('cat_none'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: textColor,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
