// ignore_for_file: avoid_multiple_declarations_per_line

import 'package:flutter/widgets.dart';

import 'colors.dart';

class MyTextStyles {
  static const String _displayFont = 'Hagrid';
  static const String _textFont = '$_displayFont Text';
  static const TextStyle headline4 = TextStyle(
        fontFamily: _displayFont,
        fontWeight: FontWeight.w800,
        fontSize: 40,
        color: MyColors.accentColor,
      ),
      headline6 = TextStyle(
        fontFamily: _displayFont,
        fontWeight: FontWeight.w900,
        fontSize: 50,
      ),
      bodyText1 = TextStyle(
        fontFamily: _textFont,
        fontWeight: FontWeight.w200,
        fontSize: 24,
      ),
      bodyText2 = TextStyle(
        fontFamily: _textFont,
        fontWeight: FontWeight.w300,
        fontSize: 24,
      ),
      subtitle2 = TextStyle(
        fontFamily: _displayFont,
        fontWeight: FontWeight.w400,
        fontSize: 24,
      ),
      button = TextStyle(
        fontFamily: _textFont,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      caption = TextStyle(
        fontFamily: _textFont,
        fontSize: 14,
        color: MyColors.contrastColorLight,
        fontWeight: FontWeight.w100,
      ),
      overline = TextStyle(
        fontFamily: _textFont,
        fontSize: 10,
        fontWeight: FontWeight.w300,
      );
}
