import 'package:flutter/material.dart';

class CustomHighlightedText extends StatelessWidget {
  const CustomHighlightedText(
    this.data, {
    super.key,
    this.alignment = Alignment.centerLeft,
    this.padding = const EdgeInsets.all(16.0),
  });
  final String data;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Container(
    alignment: alignment,
    margin: padding,
    child: Text(
          data,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 16,
          ),
        ),
  );
}
