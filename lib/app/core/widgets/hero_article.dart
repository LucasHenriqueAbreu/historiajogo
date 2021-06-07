import 'package:flutter/material.dart';

class HeroArticle extends StatelessWidget {
  final Widget child;
  final Object tag;

  final TextStyle? textStyle;

  HeroArticle({required this.child, required this.tag, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final TextStyle? _themeStyle = Theme.of(context).textTheme.bodyText2;
    return Hero(
      tag: tag,
      child: Material(
        textStyle: textStyle != null || child is Text
            ? _themeStyle!.merge((child as Text).style)
            : _themeStyle,
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
