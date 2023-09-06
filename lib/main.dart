import 'package:flutter/material.dart';
import 'package:todo_list/features/onboarding/onboaring_page.dart';
import 'package:todo_list/features/start_screen/start_screen.dart';
import 'package:todo_list/shared_preference/shared_preference.dart';
import 'package:todo_list/theme/todo_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferenceClass _sharedPreferenceClass = SharedPreferenceClass();
  @override
  void initState() {
    _sharedPreferenceClass.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _sharedPreferenceClass.getOnBoardingPage(),
      builder: (context, data) {
        if (data.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: TodoListTheme.themeData,
            home: data.data! ? const StartScreen() : const OnBoardingPage(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
