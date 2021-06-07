import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:historiajogo/app/core/widgets/hero_article.dart';
import 'package:historiajogo/app/models/history.dart';

class CardHistory extends StatelessWidget {
  final History history;

  const CardHistory({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/details', arguments: history);
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            HeroArticle(
              tag: '${history.title}${history.image}',
              child: Image.network(
                history.image,
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              title: Text(history.title),
              subtitle: Text(history.resume),
            )
          ],
        ),
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
