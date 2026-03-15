import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../data/category_data.dart';

final List<IconData> _quickIcons = [
  Icons.folder,
  Icons.book,
  Icons.code,
  Icons.fitness_center,
  Icons.school,
  Icons.work,
  Icons.star,
  Icons.favorite,
  Icons.lightbulb,
  Icons.flag,
  Icons.travel_explore,
  Icons.music_note,
  Icons.movie,
  Icons.palette,
  Icons.shopping_cart,
];
Future<CategoryModel?> showAddCategoryDialog(
  BuildContext context,
  String locale,
  String Function(String) t,
) async {
  final controller = TextEditingController();
  IconData selectedIcon = Icons.folder;
  bool showIcons = false;

  return showDialog<CategoryModel>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(t('add_cat_dialog_title')),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: t('add_cat_hint'),
                  prefixIcon: const Icon(Icons.edit_note),
                ),
              ),

              const SizedBox(height: 20),

              InkWell(
                onTap: () => setState(() => showIcons = !showIcons),
                child: Row(
                  children: [
                    Icon(selectedIcon, color: Colors.purple),
                    const SizedBox(width: 10),
                    Text(t('add_cat_pick_icon')),
                    const Spacer(),
                    Icon(showIcons ? Icons.expand_less : Icons.expand_more),
                  ],
                ),
              ),

              if (showIcons) ...[
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _quickIcons.map((icon) {
                    final isSelected = selectedIcon == icon;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIcon = icon;
                          showIcons = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.purple : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          icon,
                          color: isSelected ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(t('btn_cancel')),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) return;

              final newCat = CategoryModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                name: controller.text.trim(),
                icon: selectedIcon,
              );

              sampleCategories.add(newCat);

              Navigator.pop(ctx, newCat);
            },
            child: Text(t('add_btn_save')),
          ),
        ],
      ),
    ),
  );
}
