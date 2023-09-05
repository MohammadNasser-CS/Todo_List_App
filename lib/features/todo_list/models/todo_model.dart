import 'package:todo_list/features/todo_list/models/task_category.dart';

class TodoModel {
  final String title;
  final String description;
  final DateTime dateTime;
  final TaskCategory taskCategory;
  final int priority;
  final List<TodoModel> subTasks;

  TodoModel(
      {required this.title,
      required this.description,
      required this.dateTime,
      required this.taskCategory,
      required this.priority,
      required this.subTasks});
}
