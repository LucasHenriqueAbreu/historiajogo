import 'dart:convert';

import 'package:historiajogo/app/models/step_history.dart';
import 'package:historiajogo/app/models/step_normal.dart';

class History {
  String title;
  String resume;
  List<StepHistory> steps;
  String image;

  History({required this.title, required this.resume, required this.steps, required this.image});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'resume': resume,
      'steps': (steps as List<StepNormal>).map((StepNormal x) => x.toMap()).toList(),
      'image': image,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      title: map['title'],
      resume: map['resume'],
      steps: map['steps'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) => History.fromMap(json.decode(source));
}
