import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_color_constants.dart';
import 'package:todo_list/core/constants/theme_constants.dart';

class TodoListTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    primaryColor: AppColorConstants.primaryColor,
    fontFamily: ThemeConstants.latoFontFamily,
    scaffoldBackgroundColor: AppColorConstants.scaffoldBackgroundColor,
  );
}
