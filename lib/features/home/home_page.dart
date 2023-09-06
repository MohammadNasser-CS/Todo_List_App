import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_color_constants.dart';
import 'package:todo_list/core/constants/svg_paths.dart';
import 'package:todo_list/core/services/app_navigatort.dart';
import 'package:todo_list/features/calendar_page/calendar_page.dart';
import 'package:todo_list/features/focus_page/focus_page.dart';
import 'package:todo_list/features/todo_list/todo_list_page.dart';
import 'package:todo_list/features/todo_list/widgets/add_sheet.dart';
import 'package:todo_list/features/user_page/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pageList = [
    const TodoListPage(),
    const CalendarPage(),
    const FocusPage(),
    const UserPage(),
  ];
  final List<String> _pageTitles = [
    'Home',
    'Calendar',
    'Focus',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: _currentIndex != 0
            ? const SizedBox()
            : IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(SvgPaths.sort),
              ),
        title: Text(_pageTitles[_currentIndex]),
        actions: _currentIndex != 0
            ? []
            : [
                Container(
                  width: 42,
                  height: 42,
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://userstock.io/data/wp-content/uploads/2020/05/warren-wong-VVEwJJRRHgk-1024x1024.jpg'),
                    ),
                  ),
                )
              ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.navigateInto(context, const AddSheet());
        },
        backgroundColor: AppColorConstants.primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: SvgPicture.asset(
          SvgPaths.add,
          width: 32,
          height: 32,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF363636),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_sharp),
            activeIcon: Icon(Icons.access_time_filled_sharp),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: _pageList[_currentIndex],
    );
  }
}
