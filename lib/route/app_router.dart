import 'package:albums/route/screens.dart';
import 'package:albums/screens/albums/albums_screen.dart';
import 'package:albums/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'route_generator.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    return _getRoute(
        screens: getScreensByName(settings.name != null
            ? settings.name.toString()
            : AlbumsScreen.routeName),
        objectToPass: settings.arguments);
  }

  Route<dynamic> _getRoute({
    required Screens screens,
    required dynamic objectToPass,
  }) {
    switch (screens) {
      case Screens.home:
        return RouteGenerator().generateRoute(
             HomeScreen(), HomeScreen.routeName, objectToPass);
      case Screens.albums:
        return RouteGenerator().generateRoute(
             const AlbumsScreen(), AlbumsScreen.routeName, objectToPass);
      case Screens.posts:
        return RouteGenerator().generateRoute(
             const AlbumsScreen(), AlbumsScreen.routeName, objectToPass);
      default:
        return RouteGenerator()
            .generateRoute(getUndefinedRoute(), "/undefined", objectToPass);
    }
  }

  Widget getUndefinedRoute() {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('No route defined for Screens'),
      ),
    );
  }

  Screens getScreensByName(String screen) {
    if (screen.toString() == Screens.home.toString()) {
      return Screens.home;
    }
    if (screen.toString() == Screens.albums.toString()) {
      return Screens.albums;
    }
    if (screen.toString() == Screens.posts.toString()) {
      return Screens.posts;
    }
    return Screens.undefined;
  }
}
