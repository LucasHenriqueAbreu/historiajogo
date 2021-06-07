import 'dart:convert';

import 'package:historiajogo/app/models/step_history.dart';

class StepNormal extends StepHistory {
  StepNormal({
    required String description,
    required int order,
  }) : super(description: description, order: order);

  Map<String, dynamic> toMap() {
    return {
      'description': this.description,
      'order': this.order,
    };
  }

  factory StepNormal.fromMap(Map<String, dynamic> map) {
    return StepNormal(
      description: map['description'],
      order: map['order'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StepNormal.fromJson(String source) => StepNormal.fromMap(json.decode(source));
}
