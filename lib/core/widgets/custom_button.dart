import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final Function() onPressed;
  final String title;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.cyan,
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
