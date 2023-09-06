import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/constants/app_color_constants.dart';
import 'package:todo_list/features/todo_list/models/todo_model.dart';

class TaskBuildItem extends StatefulWidget {
  const TaskBuildItem({super.key, required this.todoModel});
  final TodoModel todoModel;
  @override
  State<TaskBuildItem> createState() => _TaskBuildItemState();
}

class _TaskBuildItemState extends State<TaskBuildItem> {
  bool _checkBoxStata = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: AppColorConstants.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Checkbox(
              value: _checkBoxStata,
              onChanged: (value) {
                _checkBoxStata = value!;
              },
              side: BorderSide(color: Colors.white.withOpacity(0.87)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.todoModel.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.87),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Text(
                        widget.todoModel.dateTime,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      const Spacer(),
                      !widget.todoModel.done
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: widget.todoModel.taskCategory.color,
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          widget.todoModel.taskCategory.icon),
                                      const SizedBox(width: 6.0),
                                      Text(
                                        widget.todoModel.taskCategory.name,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 6.0),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      color: AppColorConstants.cardColor,
                                      borderRadius: BorderRadius.circular(7.0),
                                      border: Border.all(
                                          color:
                                              AppColorConstants.primaryColor)),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.flag_outlined,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 6.0),
                                      Text(
                                        '${widget.todoModel.priority}',
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
