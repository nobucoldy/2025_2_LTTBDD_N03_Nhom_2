import '../models/plan_model.dart';

Map<String, List<PlanModel>> groupPlansByTime(List<PlanModel> plans) {
  DateTime now = DateTime.now();
  Map<String, List<PlanModel>> grouped = {
    'Tháng này': [],
    '3 tháng tới': [],
    '6 tháng tới': [],
    '1 năm tới': [],
    'Xa hơn': [],
  };

  for (var plan in plans) {
    if (plan.endDate == null) continue;
    final end = plan.endDate!;
    if (end.isBefore(DateTime(now.year, now.month + 1, 1))) {
      grouped['Tháng này']!.add(plan);
    } else if (end.isBefore(DateTime(now.year, now.month + 3, now.day))) {
      grouped['3 tháng tới']!.add(plan);
    } else if (end.isBefore(DateTime(now.year, now.month + 6, now.day))) {
      grouped['6 tháng tới']!.add(plan);
    } else if (end.isBefore(DateTime(now.year + 1, now.month, now.day))) {
      grouped['1 năm tới']!.add(plan);
    } else {
      grouped['Xa hơn']!.add(plan);
    }
  }

  for (var list in grouped.values) {
    list.sort((a, b) => a.endDate!.compareTo(b.endDate!));
  }

  return grouped;
}
