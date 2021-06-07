import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/models/history.dart';
import 'package:historiajogo/app/models/step_logical_decision.dart';
import 'package:historiajogo/app/modules/read_history/read_history_controller.dart';
import 'package:historiajogo/app/modules/read_history/widgets/modal_logical_decision.dart';
import 'package:historiajogo/app/modules/read_history/widgets/step_normal_container.dart';

class ReadHistoryPage extends StatefulWidget {
  final History history;

  const ReadHistoryPage({Key? key, required this.history}) : super(key: key);

  @override
  _ReadHistoryPageState createState() => _ReadHistoryPageState();
}

class _ReadHistoryPageState extends State<ReadHistoryPage> {
  final controller = Modular.get<ReadHistoryController>();

  @override
  void initState() {
    controller.initHistoryTeller(widget.history);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _createTitle(),
              _createSteps(context),
            ],
          ),
        ),
        bottomSheet: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                print('Voltar');
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                controller.next();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _createTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Text(
            widget.history.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _createSteps(BuildContext context) {
    return Expanded(
      child: Observer(builder: (_) {
        _verifyShowDecision(context);
        return this._createStepsList();
      }),
    );
  }

  ListView _createStepsList() {
    return ListView.builder(
      itemCount: controller.history.length,
      itemBuilder: (_, i) => StepNormalContainer(step: controller.history[i]),
    );
  }

  void _verifyShowDecision(BuildContext context) {
    Timer(Duration(milliseconds: 500), () {
      if (controller.currentStep != null &&
          controller.currentStep is StepLogicalDecision) {
        final logicalDecision = controller.currentStep as StepLogicalDecision;
        showModalBottomSheet<bool>(
                context: context,
                builder: (_) =>
                    ModalLogicalDecision(logicalDecision: logicalDecision))
            .then(controller.makeDecision);
      }
    });
  }
}
