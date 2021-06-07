

import 'dart:convert';

import 'package:historiajogo/app/models/step_history.dart';

class StepLogicalDecision extends StepHistory {
  final StepHistory yes;
  final StepHistory no;
  StepLogicalDecision({
    required String description,
    required int order,
    required this.yes,
    required this.no,
  }) : super(description: description, order: order);

  Map<String, dynamic> toMap() {
    return {
      'yes': yes,
      'no': no,
    };
  }

  factory StepLogicalDecision.fromMap(Map<String, dynamic> map) {
    return StepLogicalDecision(
      order: map['order'],
      description: map['description'],
      yes: map['yes'],
      no: map['no'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StepLogicalDecision.fromJson(String source) => StepLogicalDecision.fromMap(json.decode(source));
}
