import 'package:flutter/material.dart';

class AppNavigator {
  static void navigateInto(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
