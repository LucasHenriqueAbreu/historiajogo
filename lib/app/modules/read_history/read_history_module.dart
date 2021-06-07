import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/modules/read_history/read_history_controller.dart';
import 'package:historiajogo/app/modules/read_history/read_history_page.dart';

class ReadHistoryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ReadHistoryController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ReadHistoryPage(history: args.data,)),
  ];
}