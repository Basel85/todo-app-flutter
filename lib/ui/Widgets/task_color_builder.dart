import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/ui/cubits/task_color/task_color_cubit.dart';
import 'package:todo/ui/cubits/task_color/task_color_states.dart';

import '../../theme.dart';

class TaskColorBuilder extends StatefulWidget {
  const TaskColorBuilder({super.key});

  @override
  State<TaskColorBuilder> createState() => _TaskColorBuilderState();
}

class _TaskColorBuilderState extends State<TaskColorBuilder> {
  List<Color> taskColor = [primary, pink, orange];
  int taskColorCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskColorCubit>(
      create: (context) => TaskColorCubit(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Color",
            style: Themes.titleStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
                taskColor.length,
                (index) => Builder(
                  builder: (context) {
                    return GestureDetector(
                          onTap: () {
                            TaskColorCubit.get(context).changeTaskColorIndex(index);
                          },
                          child: BlocBuilder<TaskColorCubit,TaskColorStates>(
                            builder:(context, _) =>  CircleAvatar(
                              radius: 14,
                              backgroundColor: taskColor[index],
                              child: TaskColorCubit.get(context).taskColorIndex == index
                                  ? const Icon(
                                      Icons.done,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),);
                  }
                ),
                    )),
        ],
      ),
    );
  }
}
