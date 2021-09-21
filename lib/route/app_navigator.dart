import 'package:flutter/material.dart';

class AppNavigator{
  static Future<dynamic> navigateByPush(
      {required Route route, required BuildContext context}) async {
    var result = await Navigator.push(context, route);
    return result;
  }
}