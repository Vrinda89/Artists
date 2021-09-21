import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  final String title;

  const HomeMenu({Key? key, this.title = "title"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: TypeFacedText(
              textSize: 20.0,
              title: title,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
