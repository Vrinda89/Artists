import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(Route routeName) {
    return navigatorKey.currentState!.push(routeName);
  }

  goBack() {
    return navigatorKey.currentState!.pop();
  }

  BuildContext getBuildContext() {
    return navigatorKey.currentState!.context;
  }
}
