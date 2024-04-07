import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UtilsTranslator {
  static Widget get goBackButton => leftArrowButton(Get.back);
  static Widget leftArrowButton([VoidCallback? onPressed]) => IconButton(
        onPressed: onPressed,
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
      );

  final BuildContext _context;
  UtilsTranslator.of(this._context);

  MediaQueryData get _mediaQueryOf => MediaQuery.of(_context);
  Size get sizeDevice => _mediaQueryOf.size;
}
