import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:albums/utils/ui/ui_helper.dart';
import 'package:flutter/material.dart';

import 'card_view.dart';
import 'home_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            TypeFacedText(
              title: 'Welcome to the app',
              textSize: 50.0,
              textAlign: TextAlign.center,
              color: Colors.black,
            ),
            UiHelper.verticalSpaceMedium,
            TypeFacedText(
              textAlign: TextAlign.center,
              title: 'Press a button to get started',
              textSize: 30.0,
            ),
            UiHelper.verticalSpaceLarge,
            CustomCardView(body: HomeMenu(title: 'Discover an Album')),
            UiHelper.verticalSpaceMedium,
            CustomCardView(body: HomeMenu(title: 'Discover a Post')),
          ],
        ),
      ),
    );
  }
}
