import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_color_constants.dart';
import 'package:todo_list/core/constants/svg_paths.dart';
import 'package:todo_list/features/todo_list/models/task_category.dart';
import 'package:todo_list/features/todo_list/models/todo_model.dart';
import 'package:todo_list/features/todo_list/widgets/empty_list_page.dart';
import 'package:todo_list/features/todo_list/widgets/task_build_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<TodoModel> _taskList = [
    TodoModel(
      title: 'Do Math Homework',
      description: 'description',
      dateTime: 'Today At 16:45',
      taskCategory: TaskCategory(
        name: 'University',
        icon: SvgPaths.university,
        color: AppColorConstants.purbleColor,
      ),
      priority: 1,
      subTasks: [],
    ),
    TodoModel(
      title: 'Tack out dogs',
      description: 'description',
      dateTime: 'Today At 18:20',
      taskCategory: TaskCategory(
        name: 'Home',
        icon: SvgPaths.university,
        color: AppColorConstants.redColor,
      ),
      priority: 2,
      subTasks: [],
    ),
    TodoModel(
      title: 'Business meeting with CEO',
      description: 'description',
      dateTime: 'Today At 08:15',
      taskCategory: TaskCategory(
        name: 'Work',
        icon: SvgPaths.workIcon,
        color: AppColorConstants.yellowColor,
      ),
      priority: 1,
      subTasks: [],
    ),
    TodoModel(
      title: 'Business meeting with CEO',
      description: 'description',
      dateTime: 'Today At 08:15',
      taskCategory: TaskCategory(
        name: 'Work',
        icon: SvgPaths.workIcon,
        color: AppColorConstants.yellowColor,
      ),
      priority: 1,
      subTasks: [],
    ),
    TodoModel(
      title: 'Business meeting with CEO',
      description: 'description',
      dateTime: 'Today At 08:15',
      taskCategory: TaskCategory(
        name: 'Work',
        icon: SvgPaths.workIcon,
        color: AppColorConstants.yellowColor,
      ),
      priority: 1,
      subTasks: [],
    ),
    TodoModel(
      title: 'Business meeting with CEO',
      description: 'description',
      dateTime: 'Today At 08:15',
      taskCategory: TaskCategory(
        name: 'Work',
        icon: SvgPaths.workIcon,
        color: AppColorConstants.yellowColor,
      ),
      priority: 1,
      subTasks: [],
      done: true,
    ),
    TodoModel(
      title: 'Business meeting with CEO',
      description: 'description',
      dateTime: 'Today At 08:15',
      taskCategory: TaskCategory(
        name: 'Work',
        icon: SvgPaths.workIcon,
        color: AppColorConstants.yellowColor,
      ),
      priority: 1,
      subTasks: [],
      done: true,
    ),
    TodoModel(
      title: 'Business meeting with CEO',
      description: 'description',
      dateTime: 'Today At 08:15',
      taskCategory: TaskCategory(
        name: 'Work',
        icon: SvgPaths.workIcon,
        color: AppColorConstants.yellowColor,
      ),
      priority: 1,
      subTasks: [],
      done: true,
    ),
    TodoModel(
      title: 'Business meeting with CEO',
      description: 'description',
      dateTime: 'Today At 08:15',
      taskCategory: TaskCategory(
        name: 'Work',
        icon: SvgPaths.workIcon,
        color: AppColorConstants.yellowColor,
      ),
      priority: 1,
      subTasks: [],
      done: true,
    ),
    TodoModel(
      title: 'Business meeting with CEO',
      description: 'description',
      dateTime: 'Today At 08:15',
      taskCategory: TaskCategory(
        name: 'Work',
        icon: SvgPaths.workIcon,
        color: AppColorConstants.yellowColor,
      ),
      priority: 1,
      subTasks: [],
      done: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    if (_taskList.isEmpty) {
      return const Column(
        children: [
          EmptyListPage(),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              label: const Text(
                'Search for your task...',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: Colors.grey,
                size: 32,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Container(
            height: 41.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white.withOpacity(0.21),
            ),
            child: DropdownButton(
              items: const [
                DropdownMenuItem(
                  child: Text('Selcet'),
                ),
              ],
              underline: const SizedBox(),
              padding: const EdgeInsets.all(8.0),
              onChanged: (value) {},
              borderRadius: BorderRadius.circular(12.0),
              dropdownColor: Colors.grey,
              style: TextStyle(
                color: Colors.white.withOpacity(0.87),
              ),
              autofocus: true,
            ),
          ),
          const SizedBox(height: 12.0),
          Expanded(
            child: ListView.builder(
              itemCount: _taskList.length,
              itemBuilder: (context, index) => !_taskList[index].done
                  ? TaskBuildItem(
                      todoModel: _taskList[index],
                    )
                  : const SizedBox(),
            ),
          ),
          const SizedBox(height: 12.0),
          Container(
            height: 41.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white.withOpacity(0.21),
            ),
            child: DropdownButton(
              items: const [
                DropdownMenuItem(
                  child: Text('Completed'),
                ),
              ],
              underline: const SizedBox(),
              padding: const EdgeInsets.all(8.0),
              onChanged: (value) {},
              borderRadius: BorderRadius.circular(12.0),
              dropdownColor: Colors.grey,
              style: TextStyle(
                color: Colors.white.withOpacity(0.87),
              ),
              autofocus: true,
            ),
          ),
          const SizedBox(height: 12.0),
          Expanded(
            child: ListView.builder(
              itemCount: _taskList.length,
              itemBuilder: (context, index) => _taskList[index].done
                  ? TaskBuildItem(
                      todoModel: _taskList[index],
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
