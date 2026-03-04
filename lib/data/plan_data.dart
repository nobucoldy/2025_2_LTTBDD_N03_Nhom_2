import '../models/plan_model.dart';
import '../models/phase_model.dart';
import 'category_data.dart';

final List<PlanModel> samplePlans = [
  PlanModel(
    title: 'Tập gym',
    category: sampleCategories.firstWhere((c) => c.id == 'health'),
    phases: [PhaseModel(title: 'Tuần 1', tasks: [])],
  ),

  PlanModel(
    title: 'Học Flutter',
    category: sampleCategories.firstWhere((c) => c.id == 'study'),
    phases: [PhaseModel(title: 'Cơ bản', tasks: [])],
  ),

  PlanModel(
    title: 'Tiết kiệm tiền',
    category: sampleCategories.firstWhere((c) => c.id == 'finance'),
    phases: [PhaseModel(title: 'Tháng 1', tasks: [])],
  ),
];
