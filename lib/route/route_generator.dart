import 'package:flutter/material.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(
      Widget widget, String name, dynamic objectToPass) {
    return MaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: name, arguments: objectToPass));
  }
}
