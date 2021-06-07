


import 'package:historiajogo/app/models/step_logical_decision.dart';

abstract class StepLogicalDecisionRepository {
  Future<void> create(StepLogicalDecision step);
}