import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/modules/details/details_module.dart';
import 'package:historiajogo/app/modules/home/home_module.dart';
import 'package:historiajogo/app/modules/read_history/read_history_module.dart';
import 'package:historiajogo/app/modules/splash/splash_module.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/details', module: DetailsModule()),
    ModuleRoute('/read-history', module: ReadHistoryModule())
  ];

}