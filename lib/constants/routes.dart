import 'package:flutter/material.dart';
import 'package:todo/ui/Screens/add_task.dart';
import 'package:todo/ui/Screens/task_home_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
     AddTaskScreen.routeName: (context) => const AddTaskScreen(),
     TaskHomeScreen.routeName: (context) => const TaskHomeScreen(),
  }; 
}
