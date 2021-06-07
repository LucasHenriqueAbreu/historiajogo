import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/modules/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Modular.get<SplashController>();

  @override
  void initState() {
    controller.initializedFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: controller.initialized,
            builder: (_, __, ___) {
              if (controller.error.value) {
                return Text('Não foi possível inicializar o firebase');
              }

              if (!controller.initialized.value) {
                return CircularProgressIndicator();
              }

              return ElevatedButton(
                onPressed: () {
                  Modular.to.navigate('/home', replaceAll: true);
                },
                child: Text('Entrar'),
              );
            }),
      ),
    );
  }
}
