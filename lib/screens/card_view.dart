import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final String title;

  const CustomCardView({Key? key, this.title = "albums"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.black,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: SizedBox(
          height: 180.0,
          width: MediaQuery.of(context).size.width - 20,
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
        ),
      ),
    );
  }
}
