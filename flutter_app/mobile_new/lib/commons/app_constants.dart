import 'package:flutter/material.dart';
import 'hexColor.dart';

class AppCommons {
  static _Colors colors = _Colors();
  static _Dimens dimens = _Dimens();
}

class _Colors {
  final Color backgroundColor = Color(0xFFe2d7f5);
  final Color primaryColor = Color(0xff6732c1);
  final Color accentColor = Color(0xff4caf50);
}

class _Dimens {
  final double radiusBorderValue = 20.0;
  final double activeTabIconSize = 30.0;
  final double activeTabTextSize = 18.0;
}

final themeColor = new Color.fromRGBO(106, 94, 175, 1.0); //HexColor('#ad1a7f');
final colorPrimaryDark = HexColor('#6d0094');
final colorAccent = HexColor('#ff2068');
final colorAccentSecondary = HexColor('#6d0094');
final viewBg = HexColor('#f8f8f8');
final lblValue = HexColor('#222222');

final themeColor2 = Color(0xff203152);
final primaryColor = Color(0xff203152);
final greyColor = Color(0xffaeaeae);
final greyColor2 = Color(0xffE8E8E8);