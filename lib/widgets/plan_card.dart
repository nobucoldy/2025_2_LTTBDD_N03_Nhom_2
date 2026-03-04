import 'package:flutter/material.dart';
import '../models/plan_model.dart';

Widget planCard(PlanModel plan) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.purple.shade50,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        if (plan.category != null)
          Icon(plan.category!.icon, color: Colors.purple),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (plan.phases.isNotEmpty)
                Text(
                  plan.phases.map((p) => p.title).join(', '),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    ),
  );
}
