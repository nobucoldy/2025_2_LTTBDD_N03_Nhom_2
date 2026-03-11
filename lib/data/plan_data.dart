import '../models/plan_model.dart';
import '../models/phase_model.dart';
import 'category_data.dart';

final List<PlanModel> samplePlans = [
  PlanModel(
    title: 'Tập gym mỗi sáng',
    category: sampleCategories.firstWhere((c) => c.id == 'health'),
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 7)),
    phases: [PhaseModel(title: 'Tuần khởi động', tasks: [])],
    isDone: false, // Kế hoạch đang thực hiện
  ),

  PlanModel(
    title: 'Học cơ bản về Flutter',
    category: sampleCategories.firstWhere((c) => c.id == 'study'),
    startDate: DateTime.now().add(const Duration(days: 1)),
    endDate: DateTime.now().add(const Duration(days: 30)),
    phases: [PhaseModel(title: 'Làm quen Widget', tasks: [])],
    isDone: false,
  ),

  PlanModel(
    title: 'Mua khóa học thiết kế UI',
    category: sampleCategories.firstWhere((c) => c.id == 'finance'),
    startDate: DateTime.now().subtract(const Duration(days: 2)),
    endDate: DateTime.now().subtract(const Duration(days: 1)),
    phases: [PhaseModel(title: 'Thanh toán', tasks: [])],
    isDone: true,
  ),
];
