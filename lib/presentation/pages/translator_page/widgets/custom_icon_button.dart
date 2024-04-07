import 'package:flutter/material.dart';

class CutomIconButton extends StatelessWidget {
  const CutomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.label,
    this.heightIconLabel = 2.0,
    this.margin = const EdgeInsets.all(2.0),
    this.padding = const EdgeInsets.all(2.0),
  });
  final Widget icon;
  final VoidCallback onPressed;
  final String label;
  final double heightIconLabel;
  final EdgeInsets margin, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      child: IconButton(
        onPressed: onPressed,
        icon: Container(
          alignment: Alignment.center,
          height: 64 + heightIconLabel,
          width: 64 + heightIconLabel,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(height: heightIconLabel),
              Text(label),
            ],
          ),
        ),
        padding: padding,
      ),
    );
  }
}
