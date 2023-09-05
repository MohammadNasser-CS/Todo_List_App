import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/svg_paths.dart';

class EmptyListPage extends StatelessWidget {
  const EmptyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 6.0),
          SvgPicture.asset(SvgPaths.emptyListPage),
          const SizedBox(height: 16.0),
          const Column(
            children: [
              Text(
                'What do you want to do today?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Tap + to add your tasks',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
