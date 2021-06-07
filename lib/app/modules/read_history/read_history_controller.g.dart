// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReadHistoryController on _ReadHistoryControllerBase, Store {
  final _$historyAtom = Atom(name: '_ReadHistoryControllerBase.history');

  @override
  ObservableList<StepHistory> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<StepHistory> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  final _$_ReadHistoryControllerBaseActionController =
      ActionController(name: '_ReadHistoryControllerBase');

  @override
  dynamic addStepHistory(StepHistory step) {
    final _$actionInfo = _$_ReadHistoryControllerBaseActionController
        .startAction(name: '_ReadHistoryControllerBase.addStepHistory');
    try {
      return super.addStepHistory(step);
    } finally {
      _$_ReadHistoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
history: ${history}
    ''';
  }
}
