import 'package:flutter/material.dart';
import 'package:todo_list/core/services/app_navigatort.dart';
import 'package:todo_list/core/widgets/custom_button.dart';
import 'package:todo_list/features/home/home_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 18.0),
            const Text(
              'Welcome to UpTodo',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18.0),
            const Text(
              'Please login to your account or create new account to continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFFFFF),
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(onPressed: () {}, title: 'LOGIN'),
            ),
            const SizedBox(height: 18.0),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  AppNavigator.navigateInto(context, const HomePage());
                },
                title: 'Go To Home',
                isPrimary: false,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
