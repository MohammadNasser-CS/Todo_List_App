import 'package:flutter/material.dart';
import 'package:todo_list/features/onboarding/onboaring_page.dart';
import 'package:todo_list/theme/todo_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: TodoListTheme.themeData,
      home: const OnBoardingPage(),
    );
  }
}
