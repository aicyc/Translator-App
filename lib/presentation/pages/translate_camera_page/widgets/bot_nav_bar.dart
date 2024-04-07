import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({
    super.key,
    required this.onTap,
    required this.curIndex,
  });
  final ValueSetter<int>? onTap;
  final int curIndex;

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.objectGroup),
          label: 'Object',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.image),
          label: 'Import',
        ),
      ],
      currentIndex: widget.curIndex,
      type: BottomNavigationBarType.fixed,
      onTap: widget.onTap,
    );
  }
}
