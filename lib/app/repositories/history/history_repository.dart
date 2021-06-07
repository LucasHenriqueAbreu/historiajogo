import 'package:historiajogo/app/models/history.dart';

abstract class HistoryRepository {
  Future<void> create(History history);
  Future<List<History>> fetch();
}