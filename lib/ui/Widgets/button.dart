import 'package:flutter/material.dart';
import 'package:todo/theme.dart';
class TaskButton extends StatelessWidget {
  final String label;
  final Function ()onTap;
  const TaskButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    debugPrint("Button");
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primary
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: white
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
