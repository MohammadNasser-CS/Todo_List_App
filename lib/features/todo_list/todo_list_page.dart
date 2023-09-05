import 'package:flutter/material.dart';
import 'package:todo_list/features/todo_list/models/todo_model.dart';
import 'package:todo_list/features/todo_list/widgets/empty_list_page.dart';
import 'package:todo_list/features/todo_list/widgets/task_build_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<TodoModel> _taskList = [];
  @override
  Widget build(BuildContext context) {
    if (_taskList.isEmpty) {
      return const Column(
        children: [
          EmptyListPage(),
        ],
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: _taskList.length,
      itemBuilder: (context, index) => const TaskBuildItem(),
    );
  }
}
