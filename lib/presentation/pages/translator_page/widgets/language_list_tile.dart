import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({
    super.key,
    required this.onTap,
    required this.countryName,
    required this.isSelected,
  });
  final VoidCallback onTap;
  final String countryName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(countryName),
      trailing: isSelected
          ? const FaIcon(
              FontAwesomeIcons.solidCircleCheck,
              color: Colors.green,
            )
          : null,
    );
  }

  Widget? get trailing {
    if (!isSelected) return null;

    return const FaIcon(
      FontAwesomeIcons.solidCircleCheck,
      color: Colors.green,
    );
  }
}
