import 'package:albums/resources/palette.dart';
import 'package:flutter/material.dart';

import '../../font_type.dart';

class AppTextStyle {
  static const String fontRegular = "DroidSerif-Regular";
  static const String fontBold = "DroidSerif-Bold";
  static const String fontItalic = "DroidSerif-Italic.ttf";

  static const textTitle = 20.0;
  static const textRegularTitle = 15.0;

  static String _getFont(FontType fontType) {
    if (fontType == FontType.regular) {
      return fontRegular;
    } else if (fontType == FontType.bold) {
      return fontBold;
    } else if (fontType == FontType.bold) {
      return fontItalic;
    }
    return fontRegular;
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
