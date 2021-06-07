
import 'package:flutter/widgets.dart';
import 'package:historiajogo/app/models/history.dart';
import 'package:historiajogo/app/repositories/history/history_repository.dart';

class DetailsController extends ChangeNotifier {
  final HistoryRepository repository;
  
  ValueNotifier<History?> historyValue = ValueNotifier(null);

  DetailsController({required this.repository});

  History? get history => this.historyValue.value;
  set history(History? history) {
    this.historyValue.value = history;
  }


}