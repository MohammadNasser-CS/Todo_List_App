import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/core/constants/app_color_constants.dart';

class AddSheet extends StatefulWidget {
  const AddSheet({super.key});

  @override
  State<AddSheet> createState() => _AddSheetState();
}

class _AddSheetState extends State<AddSheet> {
  String? _dateTime;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Card(
          clipBehavior: Clip.antiAlias,
          color: AppColorConstants.scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Padding(
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
                            DateFormat('yyyy-MM-dd').format(pickedDate);
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
                        String formattedDate = pickedTime.format(context);
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
        ),
      ),
    );
  }
}
