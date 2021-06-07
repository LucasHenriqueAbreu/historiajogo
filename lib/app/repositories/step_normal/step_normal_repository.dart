

import 'package:historiajogo/app/models/step_normal.dart';

abstract class StepNormalRepository {
  Future<void> create(StepNormal step);
}