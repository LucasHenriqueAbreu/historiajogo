import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/repositories/history/history_repository.dart';
import 'package:historiajogo/app/repositories/history/history_repository_implementation.dart';

import 'details_controller.dart';
import 'details_page.dart';

class DetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailsController(repository: i.get())),
    Bind.lazySingleton<HistoryRepository>((i) => HistoryRepositoryImplementation())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DetailsPage(history: args.data,)),
  ];
}
