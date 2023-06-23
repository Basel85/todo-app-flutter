import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constants/drop_down_menu_items.dart';
import 'package:todo/enums.dart';
import 'package:todo/ui/Widgets/button.dart';
import 'package:todo/ui/Widgets/shared/custom_drop_down_button.dart';
import 'package:todo/ui/Widgets/task_color_builder.dart';
import 'package:todo/ui/cubits/date_time/date_time_cubit.dart';
import 'package:todo/ui/cubits/drop_down_field/drop_down_field_cubit.dart';
import '../../theme.dart';
import '../Widgets/appbar_task.dart';
import '../Widgets/input_field.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  static const routeName = "/addTask";
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _noteEditingController = TextEditingController();
  final TextEditingController _dateEditingController = TextEditingController();
  final TextEditingController _startTimeEditingController =
      TextEditingController();
  final TextEditingController _endTimeEditingController =
      TextEditingController();
  final TextEditingController _remindMeEditingController =
      TextEditingController();
  final TextEditingController _repeatEditingController =
      TextEditingController();
  final TextEditingController _taskColorEditingController =
      TextEditingController();
  int selectedMinute = DropDownMenuItems.remindMeDropDownMenuItems[0];
  String repeatValue = DropDownMenuItems.repeatDropDownMenuItems[0];
  late DateTime _currentDate;
  late DateFormat _dateFormat;
  @override
  void initState() {
    _currentDate = DateTime.now();
    _dateFormat = DateFormat.yMd();
    super.initState();
  }

  void addTask() {}
  void changeDate(String date) {
    DateTimeCubit.get(context).changeDate(date);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBarTask(
          appBarTitle: "Add Task", "assets/images/person.png", false),
      body: Container(
        width: size.width,
        margin: const EdgeInsets.only(top: 20, left: 14, right: 14),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ListView(
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
                  widget: IconButton(
                    icon: const Icon(
                      Icons.alarm_add_rounded,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  )),
              InputField(
                  title: "Note",
                  hintText: "Enter note here",
                  controller: _noteEditingController,
                  widget: IconButton(
                    icon: const Icon(
                      Icons.alarm_add_rounded,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  )),
              InputField(
                title: "Date",
                readOnly: true,
                controller: _dateEditingController,
                hintText: _dateFormat.format(DateTime.now()),
                widget: IconButton(
                    onPressed: () async {
                      DateTime? selectedDateTime = await showDatePicker(
                          context: context,
                          initialDate: _currentDate,
                          firstDate: DateTime(_currentDate.year),
                          lastDate: DateTime(_currentDate.year + 1));
                      _dateEditingController.text =
                          _dateFormat.format(selectedDateTime!);
                      changeDate(_dateEditingController.text);
                    },
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
                    readOnly: true,
                    controller: _startTimeEditingController,
                    hintText:
                        DateFormat("hh:mm a").format(DateTime.now()).toString(),
                    widget: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.access_alarm_rounded,
                          color: Colors.grey,
                        )),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InputField(
                      readOnly: true,
                      controller: _endTimeEditingController,
                      title: "End time",
                      hintText: DateFormat("hh:mm a")
                          .format(
                              DateTime.now().add(const Duration(minutes: 10)))
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
              BlocProvider<DropDownFieldCubit>(
                create: (context) => DropDownFieldCubit(),
                child: InputField(
                  title: "Remind",
                  controller: _remindMeEditingController,
                  formFieldType: FormFieldType.dropDown,
                  readOnly: true,
                  hintText: "$selectedMinute minutes early",
                  widget: Row(
                    children: [
                      Builder(builder: (context) {
                        return CustomDropDownButton(
                          dropDownMenuItems:
                              DropDownMenuItems.remindMeDropDownMenuItems,
                          onChanged: (Object? newValue) {
                            DropDownFieldCubit.get(context)
                                .changeRemindDropDownMenuItemValue(
                                    newValue.toString());
                          },
                        );
                      }),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              BlocProvider<DropDownFieldCubit>(
                create: (context) => DropDownFieldCubit(),
                child: InputField(
                  title: "Repeat",
                  controller: _repeatEditingController,
                  formFieldType: FormFieldType.dropDown,
                  readOnly: true,
                  hintText: repeatValue,
                  widget: Row(
                    children: [
                      Builder(builder: (context) {
                        return CustomDropDownButton(
                            dropDownMenuItems:
                                DropDownMenuItems.repeatDropDownMenuItems,
                            onChanged: (Object? newValue) {
                              DropDownFieldCubit.get(context)
                                  .changeRepeatDropDownMenuItemValue(
                                      newValue.toString());
                            });
                      }),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(children: [
                const Expanded(child: TaskColorBuilder()),
                TaskButton(
                  label: "Create task",
                  onTap: () {},
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
