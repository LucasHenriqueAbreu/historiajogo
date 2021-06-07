import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/repositories/history/history_repository.dart';
import 'package:historiajogo/app/repositories/history/history_repository_implementation.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController(repository: i.get())),
    Bind.lazySingleton<HistoryRepository>((i) => HistoryRepositoryImplementation())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
