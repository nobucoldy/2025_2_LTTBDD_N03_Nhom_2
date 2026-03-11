import 'package:flutter/material.dart';
import '../models/plan_model.dart';

Widget planCard(PlanModel plan) {
  final Color contentColor = plan.isDone ? Colors.grey.shade400 : Colors.purple;
  final Color titleColor = plan.isDone ? Colors.grey.shade500 : Colors.black87;

  return AnimatedOpacity(
    duration: const Duration(milliseconds: 300),
    opacity: plan.isDone ? 0.6 : 1.0,
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: plan.isDone ? Colors.grey.shade50 : Colors.purple.shade50,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: plan.isDone
              ? Colors.grey.shade200
              : Colors.purple.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Icon(
            plan.category?.icon ?? Icons.assignment_outlined,
            color: contentColor,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                    decoration: plan.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.grey.shade400,
                    decorationThickness: 2,
                  ),
                ),
                if (plan.phases.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      plan.phases.map((p) => p.title).join(', '),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                        decoration: plan.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),

          Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: plan.isDone ? Colors.grey.shade300 : Colors.grey,
          ),
        ],
      ),
    ),
  );
}
