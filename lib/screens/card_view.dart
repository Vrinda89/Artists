import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final String title;
  final Widget body;
  final double cardPadding;

  const CustomCardView(
      {Key? key,
      this.title = "albums",
      this.body = const SizedBox(),
      this.cardPadding = 30.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardPadding),
      ),
      color: Colors.black,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30), onTap: () {}, child: body),
    );
  }
}
