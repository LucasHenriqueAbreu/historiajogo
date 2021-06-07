

import 'package:historiajogo/app/models/step_multiple_decisions.dart';

abstract class StepMultipleDecisionsRepository {
  Future<void> create(StepMultipleDecisions step);
}