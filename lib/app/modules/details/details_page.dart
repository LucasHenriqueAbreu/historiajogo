import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/core/widgets/hero_article.dart';
import 'package:historiajogo/app/models/history.dart';

import 'details_controller.dart';

class DetailsPage extends StatefulWidget {
  final History history;

  const DetailsPage({Key? key, required this.history}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = Modular.get<DetailsController>();

  @override
  void initState() {
    // TODO: talvez não precise
    controller.history = widget.history;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeroArticle(
            tag: '${widget.history.title}${widget.history.image}',
            child: Image.network(
              widget.history.image,
              fit: BoxFit.fill,
            ),
          ),
          ListTile(
            title: Text(widget.history.title),
            subtitle: Text(widget.history.resume),
          ),
          Text('Aqui pode ter Autor, avaliação, tempo de leitura... ')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.read_more),
        onPressed: () {
          Modular.to.pushNamed('/read-history', arguments: widget.history);
        },
      ),
    );
  }
}
