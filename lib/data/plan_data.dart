import '../models/plan_model.dart';
import '../models/phase_model.dart';
import 'category_data.dart';

final List<PlanModel> samplePlans = [
  PlanModel(
    title: 'Tập gym',
    category: sampleCategories.firstWhere((c) => c.id == 'health'),
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 7)),
    phases: [PhaseModel(title: 'Tuần 1', tasks: [])],
  ),

  PlanModel(
    title: 'Học Flutter',
    category: sampleCategories.firstWhere((c) => c.id == 'study'),
    startDate: DateTime.now().add(const Duration(days: 1)),
    endDate: DateTime.now().add(const Duration(days: 30)),
    phases: [PhaseModel(title: 'Cơ bản', tasks: [])],
  ),

  PlanModel(
    title: 'Tiết kiệm tiền',
    category: sampleCategories.firstWhere((c) => c.id == 'finance'),
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 90)),
    phases: [PhaseModel(title: 'Tháng 1', tasks: [])],
  ),
];
