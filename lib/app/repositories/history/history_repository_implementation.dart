import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:historiajogo/app/models/history.dart';
import 'package:historiajogo/app/models/step_history.dart';
import 'package:historiajogo/app/models/step_logical_decision.dart';
import 'package:historiajogo/app/models/step_normal.dart';
import 'package:historiajogo/app/models/step_sequential.dart';
import 'package:historiajogo/app/repositories/history/history_repository.dart';

class HistoryRepositoryImplementation implements HistoryRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final String collection = 'histories';
  @override
  Future<void> create(History history) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<History>> fetch() async {
    final result = await firebaseFirestore.collection(collection).get();
    List<History> histories = [];
    for (var doc in result.docs) {
      var map = doc.data();
      map['steps'] = <StepHistory>[];
      for (var step in doc.data()['steps']) {
        final stepInstanced = await _createStep(step);
        map['steps'].add(stepInstanced);
      }
      final valorConvertidoTemp = History.fromMap(map);
      histories.add(valorConvertidoTemp);
    }
    return histories;
  }

  Future<StepHistory> _createStep(step) async {
    final result = await step.get();
    if (step.parent.path == 'stepsMultipleDecisions')
      return StepNormal.fromMap(result.data());
    if (step.parent.path == 'stepsLogicalDecisions')
      return _createStepLogialDecision(result.data());
    if (step.parent.path == 'stepsSequentials')
      return _createStepSequential(result.data());
    return StepNormal.fromMap(result.data());
  }

  Future<StepLogicalDecision> _createStepLogialDecision(
      Map<String, dynamic> data) async {
    data['yes'] = await _createStep(data['yes']);
    data['no'] = await _createStep(data['no']);
    return StepLogicalDecision.fromMap(data);
  }

  Future<StepSequential> _createStepSequential(
      Map<String, dynamic> data) async {
    List<StepHistory> stepsAux = [];
    for (var step in data['steps']) {
      final stepInstanced = await _createStep(step);
      stepsAux.add(stepInstanced);
    }
    data['steps'] = stepsAux;
    return StepSequential.fromMap(data);
  }
}
