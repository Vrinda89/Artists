import 'package:albums/font_type.dart';
import 'package:albums/utils/ui/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeFacedText extends StatelessWidget {
  final String title;
  final Color color;
  final bool isWithUnderline;
  final FontType fontType;
  final TextAlign textAlign;
  final double textSize;

  const TypeFacedText(
      {Key? key,
      this.title = "no text",
      this.color = Colors.black,
      this.isWithUnderline = false,
      this.fontType = FontType.regular,
      this.textAlign = TextAlign.start,
      this.textSize = AppTextStyle.textRegularTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        style: isWithUnderline
            ? AppTextStyle.getAppTextStyle(color, fontType, textSize)
            : AppTextStyle.getAppTextStyle(color, fontType, textSize));
  }
}
