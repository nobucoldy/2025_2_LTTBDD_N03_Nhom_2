import 'package:flutter/material.dart';
import '../models/plan_model.dart';
import '../models/phase_model.dart';
import '../models/task_model.dart';

class PlanDetailScreen extends StatefulWidget {
  final PlanModel plan;

  const PlanDetailScreen({super.key, required this.plan});

  @override
  State<PlanDetailScreen> createState() => _PlanDetailScreenState();
}

class _PlanDetailScreenState extends State<PlanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final plan = widget.plan;

    return Scaffold(
      appBar: AppBar(title: Text(plan.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thể loại: ${plan.category?.name ?? 'Không có'}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 8),

            Text(
              'Thời gian: ${plan.startDate != null ? "${plan.startDate!.day}/${plan.startDate!.month}/${plan.startDate!.year}" : "-"} '
              '- ${plan.endDate != null ? "${plan.endDate!.day}/${plan.endDate!.month}/${plan.endDate!.year}" : "-"}',
            ),

            const SizedBox(height: 16),

            const Text(
              'Các giai đoạn:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: ListView.builder(
                itemCount: plan.phases.length,
                itemBuilder: (context, index) {
                  final PhaseModel phase = plan.phases[index];

                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            phase.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 8),

                          if (phase.tasks.isEmpty)
                            const Text('Chưa có nhiệm vụ')
                          else
                            Column(
                              children: phase.tasks.map((TaskModel task) {
                                return CheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  value: task.isDone,
                                  onChanged: (value) {
                                    setState(() {
                                      task.isDone = value!;
                                    });
                                  },
                                  title: Text(
                                    task.title,
                                    style: TextStyle(
                                      decoration: task.isDone
                                          ? TextDecoration.lineThrough
                                          : null,
                                      color: task.isDone
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
