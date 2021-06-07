import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/modules/home/home_controller.dart';
import 'package:historiajogo/app/modules/home/widgets/card_history.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    controller.getHistories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/ogw/ADGmqu8E5hE0wFvog241EXu9h2qUGkbaqwrn0MI7A1iw=s32-c-mo'),
          ),
        ),
        title: Text(
          'Olá, Lucas',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Container(
        child: _createListHistories(),
      ),
    );
  }

  Widget _createListHistories() {
    return ValueListenableBuilder(
      valueListenable: controller.historiesValue,
      builder: (_, __, ___) {
        return ListView.builder(
          itemCount: controller.histories.length,
          itemBuilder: (_, i) => CardHistory(
            history: controller.histories[i],
          ),
        );
      },
    );
  }
}
