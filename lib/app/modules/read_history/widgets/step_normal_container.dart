import 'package:flutter/material.dart';
import 'package:historiajogo/app/models/step_history.dart';

class StepNormalContainer extends StatelessWidget {
  final StepHistory step;

  const StepNormalContainer({Key? key, required this.step}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          step.description,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(' ... '),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
