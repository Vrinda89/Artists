import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final String title;
  final Widget ? body;
  final double cardPadding;
  final VoidCallback ? onClick;

    const CustomCardView({
    Key? key,
    this.title = "albums",
    this.body ,
    this.cardPadding = 30.0,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardPadding),
      ),
      color: Colors.black,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            onClick?.call();
          },
          child: body ?? Container()),
    );
  }
}
