import 'package:flutter/material.dart';
import '../models/plan_model.dart';

Widget planCard(PlanModel plan) {
  return Container(
    width: double.infinity,
    height: 50,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            plan.title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Icon(Icons.delete_forever_outlined, color: Colors.white),
        ],
      ),
    ),
  );
}
