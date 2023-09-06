import 'package:todo_list/features/todo_list/models/task_category.dart';

class TodoModel {
  final String title;
  final String description;
  final String dateTime;
  final TaskCategory taskCategory;
  final int priority;
  final List<TodoModel> subTasks;
  final bool done;
  TodoModel({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.taskCategory,
    required this.priority,
    required this.subTasks,
    this.done = false,
  });
}
