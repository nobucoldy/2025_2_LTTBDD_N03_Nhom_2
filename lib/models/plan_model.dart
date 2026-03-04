import 'category_model.dart';
import 'phase_model.dart';

class PlanModel {
  final String title;
  final CategoryModel category;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<PhaseModel> phases;

  PlanModel({
    required this.title,
    required this.category,
    this.startDate,
    this.endDate,
    required this.phases,
  });
}
