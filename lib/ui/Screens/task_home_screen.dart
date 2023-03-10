import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/ui/Widgets/appbar_task.dart';
import 'package:todo/ui/Widgets/button.dart';

import '../../theme.dart';

class TaskHomeScreen extends StatefulWidget {
  const TaskHomeScreen({Key? key}) : super(key: key);

  @override
  State<TaskHomeScreen> createState() => _TaskHomeScreenState();
}

class _TaskHomeScreenState extends State<TaskHomeScreen> {
  DateTime _currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    print(_currentDate);
    return Scaffold(
      appBar: appBarTask("assets/images/person.png", true),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 10, top: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()).toString(),
                        style: Themes.subHeadingStyle,
                      ),
                      Text(
                        "Today",
                        style: Themes.headingStyle,
                      )
                    ],
                  )),
                  TaskButton(label: "+ Add task", onTap: () {})
                ],
              ),
              const SizedBox(height: 6,),
              DatePicker(
                DateTime.now(),
                width: 70,
                height: 100,
                initialSelectedDate: DateTime.now(),
                selectedTextColor: white,
                selectionColor: primary,
                deactivatedColor: white,
                dateTextStyle: Themes.dateTimeStyle,
                dayTextStyle: Themes.dayTimeStyle,
                monthTextStyle: Themes.monthTimeStyle,
                onDateChange: (newDate)=>setState(() {
                  _currentDate=newDate;
                }),
              ),
              SizedBox(height: 6,),

            ],
          ),
        ),
      ),
    );
  }
}
