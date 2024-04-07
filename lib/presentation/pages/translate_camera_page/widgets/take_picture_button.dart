import 'package:flutter/material.dart';

class TakePictureButton extends StatelessWidget {
  const TakePictureButton({
    super.key,
    required this.onTakePicture,
    required this.isActiveButton,
  });
  final VoidCallback onTakePicture;
  final bool isActiveButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTakePicture,
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isActiveButton ? Colors.white : Colors.white.withOpacity(.4),
            width: 2,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActiveButton ? Colors.white : Colors.white.withOpacity(.4),
          ),
        ),
      ),
    );
  }
}
