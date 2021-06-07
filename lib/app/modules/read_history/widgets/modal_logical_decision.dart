import 'package:flutter/material.dart';
import 'package:historiajogo/app/models/step_logical_decision.dart';

class ModalLogicalDecision extends StatelessWidget {
  final StepLogicalDecision logicalDecision;

  const ModalLogicalDecision({Key? key, required this.logicalDecision})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          Text(logicalDecision.description, style: Theme.of(context).textTheme.bodyText1,),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Não'),
            onTap: () {
              Navigator.pop<bool>(context, false);
            },
          ),
          ListTile(
            leading: Icon(Icons.done),
            title: Text('Sim'),
            onTap: () {
              Navigator.pop<bool>(context, true);
            },
          ),
        ],
      ),
    );
  }
}
