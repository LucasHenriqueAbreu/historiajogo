
import 'package:flutter/widgets.dart';
import 'package:historiajogo/app/models/history.dart';
import 'package:historiajogo/app/repositories/history/history_repository.dart';

class HomeController extends ChangeNotifier {
  final HistoryRepository repository;
  
  ValueNotifier<List<History>> historiesValue = ValueNotifier([]);

  HomeController({required this.repository});

  List<History> get histories => this.historiesValue.value;
  set histories(List<History> histories) {
    this.historiesValue.value = histories;
  }

  Future<void> getHistories() async {
    this.histories = await this.repository.fetch();
  }
}