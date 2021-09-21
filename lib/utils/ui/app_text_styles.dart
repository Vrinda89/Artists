import 'package:flutter/material.dart';

import '../../font_type.dart';

class AppTextStyle {
  static const String _fontRegular = "DroidSerif-Regular";
  static const String _fontBold = "DroidSerif-Bold";
  static const String _fontItalic = "DroidSerif-Italic.ttf";

  static const textTitle = 20.0;
  static const textRegularTitle = 15.0;

  static String _getFont(FontType fontType) {
    if (fontType == FontType.regular) {
      return _fontRegular;
    } else if (fontType == FontType.bold) {
      return _fontBold;
    } else if (fontType == FontType.bold) {
      return _fontItalic;
    }
    return _fontRegular;
  }

  static TextStyle getAppTextStyle(
      Color color, FontType fontType, double fontSize) {
    return TextStyle(
        color: color,
        height: 1.2,
        fontSize: fontSize,
        fontFamily: _getFont(fontType));
  }
}
