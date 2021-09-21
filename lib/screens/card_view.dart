import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final String title;

  const CustomCardView({Key? key, this.title = "albums"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: SizedBox(
          height: 150.0,
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
    // return Card(
    //   color: Colors.black,
    //   child: SizedBox(
    //     height: 100.0,
    //     width: MediaQuery.of(context).size.width - 20,
    //     child: Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Center(
    //           child: TypeFacedText(
    //             title: title,
    //             color: Colors.white,
    //             textAlign: TextAlign.center,
    //           ),
    //         )),
    //   ),
    // );
  }
}
