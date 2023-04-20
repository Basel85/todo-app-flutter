import 'package:flutter/material.dart';
import 'package:todo/theme.dart';
import 'package:todo/ui/Screens/add_task.dart';
import 'package:todo/ui/Screens/task_home_screen.dart';

import 'constants/keys.dart';
import 'constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      navigatorKey: Keys.navigatorKey,
      routes: Routes.routes,
      home: const TaskHomeScreen(),
      );
  }
}