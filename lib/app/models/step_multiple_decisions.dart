import 'package:historiajogo/app/models/step_history.dart';

class StepMultipleDecisions extends StepHistory {
  final List<StepHistory> decisions;
  StepMultipleDecisions({
    required String description,
    required this.decisions,
    required int order,
  }) : super(description: description, order: order);
}
