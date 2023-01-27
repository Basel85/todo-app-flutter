import 'package:flutter/material.dart';

import '../../theme.dart';
class TaskColorBuilder extends StatefulWidget {

  const TaskColorBuilder({super.key});


  @override
  State<TaskColorBuilder> createState() => _TaskColorBuilderState();
}

class _TaskColorBuilderState extends State<TaskColorBuilder> {
  List<Color> taskColor = [primary,pink,orange];
  int taskColorCurrentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",style: Themes.titleStyle,),
        const SizedBox(height: 8,),
        Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: 8,
          children: List.generate(taskColor.length, (index) => GestureDetector(
            onTap: (){
              setState(() {
                taskColorCurrentIndex=index;
              });
            },
            child: CircleAvatar(
              radius: 14,
              backgroundColor: taskColor[index],
              child: taskColorCurrentIndex==index?const Icon(Icons.done,size: 16,color: Colors.white,):null,
            ),
          )),
        ),
      ],
    );
  }
}
