import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/core/constants/app_color_constants.dart';
import 'package:todo_list/core/constants/svg_paths.dart';
import 'package:todo_list/features/calendar_page/calendar_page.dart';
import 'package:todo_list/features/focus_page/focus_page.dart';
import 'package:todo_list/features/todo_list/todo_list_page.dart';
import 'package:todo_list/features/user_page/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String? _dateTime;

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
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shadowColor: AppColorConstants.scaffoldBackgroundColor,
                  backgroundColor: AppColorConstants.scaffoldBackgroundColor,
                  surfaceTintColor: AppColorConstants.scaffoldBackgroundColor,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16.0)), //this right here
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add Task',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.87),
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            TextFormField(
                              decoration: InputDecoration(
                                label: const Text(
                                  'Titel',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            TextFormField(
                              decoration: InputDecoration(
                                label: const Text(
                                  'Description',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Row(children: [
                              IconButton(
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1995),
                                    lastDate: DateTime(2110),
                                  );
                                  if (pickedDate != null) {
                                    debugPrint(
                                        '$pickedDate'); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    debugPrint(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      _dateTime =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {}
                                },
                                icon: const Icon(
                                  Icons.timer,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              IconButton(
                                onPressed: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (pickedTime != null) {
                                    debugPrint(
                                        '$pickedTime'); //pickedTime output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        pickedTime.format(context);
                                    // TimeOfDayFormat('yyyy-MM-dd').format(pickedTime);
                                    debugPrint(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      _dateTime =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {}
                                },
                                icon: const Icon(
                                  Icons.sell_outlined,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.flag_outlined,
                                  size: 32,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send_sharp,
                                  size: 32,
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
          // AppNavigator.navigateInto(context, const AddSheet());
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
