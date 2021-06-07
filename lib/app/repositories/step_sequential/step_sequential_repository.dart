

import 'package:historiajogo/app/models/step_sequential.dart';

abstract class StepSequentialRepository {
  Future<void> create(StepSequential step);
}