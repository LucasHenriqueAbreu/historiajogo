import 'dart:convert';

import 'package:historiajogo/app/models/step_history.dart';

class StepSequential extends StepHistory {
  final List<StepHistory> steps;
  StepSequential({
    required String description,
    required int order,
    required this.steps,
  }) : super(description: description, order: order);

  Map<String, dynamic> toMap() {
    return {
      'steps': steps,
    };
  }

  factory StepSequential.fromMap(Map<String, dynamic> map) {
    return StepSequential(
      description: map['description'],
      order: map['order'],
      steps: map['steps'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StepSequential.fromJson(String source) => StepSequential.fromMap(json.decode(source));
}
