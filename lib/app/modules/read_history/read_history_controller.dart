import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/models/step_logical_decision.dart';
import 'package:mobx/mobx.dart';

import 'package:historiajogo/app/models/history.dart';
import 'package:historiajogo/app/models/step_history.dart';

part 'read_history_controller.g.dart';

class ReadHistoryController = _ReadHistoryControllerBase
    with _$ReadHistoryController;

abstract class _ReadHistoryControllerBase extends Disposable with Store {
  @observable
  ObservableList<StepHistory> history = ObservableList();
  StreamController<StepHistory> controller = StreamController<StepHistory>();
  late StreamSubscription<StepHistory> streamSubscription;
  late History mainHistory;
  @observable
  StepHistory? currentStep;
  int _currentIndex = 0;
  bool _currentLogicalDecision = false;

  @override
  void dispose() {
    this.streamSubscription.cancel();
  }

  void initHistoryTeller(History history) {
    history.steps.sort((a, b) => a.order.compareTo(b.order));
    this.mainHistory = history;
    this._registerListenerHistory();
    this.addStepHistory(history.steps[_currentIndex]);
  }

  void _registerListenerHistory() {
    this.streamSubscription = controller.stream.listen((StepHistory step) {
      this.addStepHistory(step);
    });
  }

  @action
  addStepHistory(StepHistory step) {
    this.history.add(step);
    this.currentStep = step;
  }

  next() async {
    final newStep = _getNewStep();
    addStepHistory(newStep);
  }

  @action
  void makeDecision(value) {
    _currentLogicalDecision = value;
    next();
  }

  StepHistory _getNewStep() {
    if (currentStep is StepLogicalDecision) {
      final stepLogicalDecision = (currentStep as StepLogicalDecision);
      return _currentLogicalDecision ? stepLogicalDecision.yes : stepLogicalDecision.no;
    }
    _currentIndex++;
    return mainHistory.steps[_currentIndex];
  }
}
