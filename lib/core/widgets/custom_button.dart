import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_color_constants.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isPrimary = true,
  });
  final Function() onPressed;
  final String title;
  final bool isPrimary;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(
          width: 2.5,
          color: !widget.isPrimary ? Colors.cyan : Colors.transparent,
        ),
      ),
      color: widget.isPrimary
          ? Colors.cyan
          : AppColorConstants.scaffoldBackgroundColor,
      height: 48.0,
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
