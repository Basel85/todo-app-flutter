import 'package:flutter/material.dart';
import 'package:todo/ui/Widgets/button.dart';
import 'package:todo/ui/Widgets/task_color_builder.dart';
import '../../theme.dart';
import '../Widgets/appbar_task.dart';
import '../Widgets/input_field.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _noteEditingController = TextEditingController();
  final List<int> remindMeMinutes = [5, 10, 15, 20];
  final List<String> repeat = ["none", "Daily", "Weekly", "Monthly"];
  int selectedMinute = 5;
  String repeatValue = "none";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: appBarTask(appBarTitle: "Add Task","assets/images/person.png",false),
      body: Container(
        width: size.width,
        margin: const EdgeInsets.only(top: 20,left: 14,right: 14),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add Task",
                  style: Themes.headingStyle,
                  textAlign: TextAlign.center,
                ),
                InputField(
                    title: "Title",
                    hintText: "Enter title here",
                    controller: _titleEditingController,
                    widget: IconButton(icon: const Icon(
                      Icons.alarm_add_rounded, color: Colors.grey,),
                      onPressed: () {},)
                ),
                InputField(
                    title: "Note",
                    hintText: "Enter note here",
                    controller: _noteEditingController,
                    widget: IconButton(icon: const Icon(
                      Icons.alarm_add_rounded, color: Colors.grey,),
                      onPressed: () {},)
                ),
                InputField(
                  title: "Date",
                  hintText: DateFormat.yMd().format(DateTime.now()),
                  widget: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      )),
                ),
                Row(
                  children: [
                    Expanded(
                        child: InputField(
                          title: "Start time",
                          hintText:
                          DateFormat("hh:mm a").format(DateTime.now()).toString(),
                          widget: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.access_alarm_rounded,
                                color: Colors.grey,
                              )),
                        )),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: InputField(
                        title: "End time",
                        hintText: DateFormat("hh:mm a")
                            .format(DateTime.now().add(const Duration(
                            minutes: 10)))
                            .toString(),
                        widget: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.access_alarm_rounded,
                              color: Colors.grey,
                            )),
                      ),
                    )
                  ],
                ),
                InputField(
                  title: "Remind",
                  hintText: "$selectedMinute minutes early",
                  widget: Row(
                    children: [
                      DropdownButton(
                        items: remindMeMinutes.map((value) =>
                            DropdownMenuItem(
                              value: value,
                              child: Text(
                                "$value",
                                style: const TextStyle(
                                    color: Colors.blueGrey
                                ),
                              ),
                            )).toList(),
                        onChanged: (int? newValue) =>
                            setState(() {
                              selectedMinute = newValue!;
                            }),
                        icon: const Icon(
                            Icons.keyboard_arrow_down, color: Colors.grey),
                        iconSize: 32,
                        elevation: 4,
                        underline: Container(height: 0,),
                        style: Themes.subTitleStyle,
                      ),
                      const SizedBox(width: 10,)
                    ],
                  ),
                ),
                InputField(
                  title: "Repeat",
                  hintText: repeatValue,
                  widget: Row(
                    children: [
                      DropdownButton(
                        items: repeat.map((value) =>
                            DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    color: Colors.blueGrey
                                ),
                              ),
                            )).toList(),
                        onChanged: (String? newValue) =>
                            setState(() {
                              repeatValue = newValue!;
                            }),
                        icon: const Icon(
                            Icons.keyboard_arrow_down, color: Colors.grey),
                        iconSize: 32,
                        elevation: 4,
                        underline: Container(height: 0,),
                        style: Themes.subTitleStyle,
                      ),
                      const SizedBox(width: 10,)
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                Row(
                    children: [
                      const Expanded(child: TaskColorBuilder()),
                      TaskButton(label: "Create task",onTap: (){},),
                    ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
