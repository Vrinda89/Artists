import 'package:albums/route/app_navigator.dart';
import 'package:albums/route/app_router.dart';
import 'package:albums/route/screens.dart';
import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:albums/utils/ui/ui_helper.dart';
import 'package:flutter/material.dart';

import 'card_view.dart';
import 'home_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: _getBaseContainer(),
      ),
    );
  }

  Widget _getBaseContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const TypeFacedText(
          title: 'Welcome to the app',
          textSize: 50.0,
          textAlign: TextAlign.center,
          color: Colors.black,
        ),
        UiHelper.verticalSpaceMedium,
        const TypeFacedText(
          textAlign: TextAlign.center,
          title: 'Press a button to get started',
          textSize: 30.0,
        ),
        UiHelper.verticalSpaceLarge,
        CustomCardView(
          onClick: () => {_navigateToNextScreen(Screens.albums)},
          body: const HomeMenu(title: 'Discover an Album'),
        ),

        UiHelper.verticalSpaceMedium,
        CustomCardView(
          onClick: () => {_navigateToNextScreen(Screens.posts)},
          body: const HomeMenu(title: 'Discover a Post'),
        ),
      ],
    );
  }

  void _navigateToNextScreen(Screens screens) {
    AppNavigator.navigateByPush(
        route: AppRouter()
            .generateRoute(RouteSettings(name: screens.toString())),
        context: context);
  }

}
