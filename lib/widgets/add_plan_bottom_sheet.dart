import 'package:flutter/material.dart';
import '../widgets/category_box.dart';
import '../widgets/quick_action.dart';
import '../models/plan_model.dart';
import '../models/phase_model.dart';
import '../data/category_data.dart';
import '../models/category_model.dart';

class AddPlanBottomSheet extends StatefulWidget {
  const AddPlanBottomSheet({super.key});

  @override
  State<AddPlanBottomSheet> createState() => _AddPlanBottomSheetState();
}

class _AddPlanBottomSheetState extends State<AddPlanBottomSheet> {
  CategoryModel _category = sampleCategories.first;
  DateTime? _startDate;
  DateTime? _endDate;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _phaseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        hintText: 'Nhập kế hoạch mới tại đây',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CategoryBox(
                          category: _category,
                          onTap: () => _showCategoryPicker(context),
                        ),
                        const SizedBox(width: 6),
                        QuickAction(
                          icon: Icons.calendar_today_outlined,
                          text: _startDate == null
                              ? 'Bắt đầu'
                              : '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}',
                          onTap: () => _pickDate(context, true),
                        ),
                        const SizedBox(width: 6),
                        QuickAction(
                          icon: Icons.calendar_today_outlined,
                          text: _endDate == null
                              ? 'Kết thúc'
                              : '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
                          onTap: () => _pickDate(context, false),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Giai đoạn 1:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextField(
                            controller: _phaseController,
                            decoration: const InputDecoration(
                              hintText: 'Nhập giai đoạn 1:',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(fontSize: 15),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            label: const Text('Thêm nhiệm vụ'),
                          ),
                        ],
                      ),
                    ),

                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text(
                        'Thêm giai đoạn',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  if (_titleController.text.trim().isEmpty) return;

                  final newPlan = PlanModel(
                    title: _titleController.text.trim(),
                    category: _category,
                    startDate: _startDate,
                    endDate: _endDate,
                    phases: [
                      PhaseModel(
                        title: _phaseController.text.isEmpty
                            ? 'Giai đoạn 1'
                            : _phaseController.text,
                        tasks: [],
                      ),
                    ],
                  );

                  Navigator.pop(context, newPlan);
                },
                child: const Text(
                  'Lưu',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate(BuildContext context, bool isStart) async {
    DateTime tempDate = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? DateTime.now());

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    Expanded(
                      child: CalendarDatePicker(
                        initialDate: tempDate,
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2030),
                        onDateChanged: (date) {
                          setModalState(() {
                            tempDate = date;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 8,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setModalState(() {
                              tempDate = DateTime.now().add(
                                const Duration(days: 30),
                              );
                            });
                          },
                          child: const Text('1 tháng'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setModalState(() {
                              tempDate = DateTime.now().add(
                                const Duration(days: 90),
                              );
                            });
                          },
                          child: const Text('3 tháng'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setModalState(() {
                              tempDate = DateTime.now().add(
                                const Duration(days: 180),
                              );
                            });
                          },
                          child: const Text('6 tháng'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setModalState(() {
                              tempDate = DateTime.now().add(
                                const Duration(days: 365),
                              );
                            });
                          },
                          child: const Text('1 năm'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (isStart) {
                              _startDate = tempDate;
                            } else {
                              _endDate = tempDate;
                            }
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Chọn'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: sampleCategories.map((category) {
            return ListTile(
              leading: Icon(category.icon, color: category.color),
              title: Text(category.name),
              onTap: () {
                setState(() {
                  _category = category;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
