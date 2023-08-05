import 'package:flutter/material.dart';

class TaskCircle extends StatelessWidget {
  final Color taskCircleColor;
  final bool isSelected;
  const TaskCircle(
      {super.key, required this.taskCircleColor, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    debugPrint("Task Circle");
    return CircleAvatar(
      radius: 14,
      backgroundColor: taskCircleColor,
      child: isSelected
          ? const Icon(
              Icons.done,
              size: 16,
              color: Colors.white,
            )
          : null,
    );
  }
}
