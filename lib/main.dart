import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/theme.dart';
import 'package:todo/ui/Screens/task_home_screen.dart';
import 'package:todo/ui/cubits/date_time/date_time_cubit.dart';

import 'constants/keys.dart';
import 'constants/routes.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<DateTimeCubit>(
      create: (context) => DateTimeCubit(),
    ),
  ], child: const MyApp()));
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