import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constants/drop_down_menu_items.dart';
import 'package:todo/enums.dart';
import 'package:todo/ui/Widgets/button.dart';
import 'package:todo/ui/Widgets/shared/custom_drop_down_button.dart';
import 'package:todo/ui/Widgets/task_color_builder.dart';
import 'package:todo/ui/cubits/date_time/date_time_cubit.dart';
import 'package:todo/ui/cubits/drop_down_field/drop_down_field_cubit.dart';
import 'package:todo/utils/mixins/string_to_datetime_converter.dart';
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

class _AddTaskScreenState extends State<AddTaskScreen>
    with StringToDateTimeConverter {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _noteEditingController = TextEditingController();
  late String _date;
  late String _startTime;
  late String _endTime;
  int _remindMe = DropDownMenuItems.remindMeDropDownMenuItems[0];
  String _repeat = DropDownMenuItems.repeatDropDownMenuItems[0].toString();
  final TextEditingController _taskColorEditingController =
      TextEditingController();
  DateTime currentSeletedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  @override
  void initState() {
    _date = DateFormat.yMd().format(DateTime.now());
    super.initState();
  }

  void addTask() {
    try {} catch (e) {
      debugPrint(e.toString());
    }
  }

  void changeTime(bool isStartTime) {
    showTimePicker(
            context: context,
            initialTime: isStartTime ? selectedStartTime : selectedEndTime)
        .then((time) {
      isStartTime
          ? _startTime = time == null ? selectedStartTime.format(context) : time.format(context)
          : _endTime = time == null ? selectedEndTime.format(context) : time.format(context);
      if (time != null) {
        isStartTime ? selectedStartTime = time : selectedEndTime = time;
      }
      DateTimeCubit.get(context)
          .changeTime(isStartTime ? _startTime : _endTime,isStartTime);
    });
  }

  void changeDate() {
    showDatePicker(
            context: context,
            initialDate: currentSeletedDate,
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime(DateTime.now().year + 10))
        .then((selectedDateTime) {
      _date = DateFormat.yMd().format(selectedDateTime ?? currentSeletedDate);
      if (selectedDateTime != null) {
        currentSeletedDate = selectedDateTime;
      }
      DateTimeCubit.get(context).changeDate(_date);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
           const AppBarTask(assetImagePath: "assets/images/person.png",appBarTitle: "Add Task",isHomePage: false,),
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.only(top: 20, left: 14, right: 14),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                          hintText: DateFormat.yMd().format(DateTime.now()),
                          formFieldType: FormFieldType.date,
                          widget: IconButton(
                              onPressed: () {
                                changeDate();
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
                              formFieldType: FormFieldType.startTime,
                              hintText:
                                  DateFormat("hh:mm a").format(DateTime.now()),
                              widget: IconButton(
                                  onPressed: () {
                                    changeTime(true);
                                  },
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
                                title: "End time",
                                formFieldType: FormFieldType.endTime,
                                hintText: DateFormat("hh:mm a")
                                    .format(
                                        DateTime.now().add(const Duration(minutes: 10)))
                                    .toString(),
                                widget: IconButton(
                                    onPressed: () {
                                      changeTime(false);
                                    },
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
                            formFieldType: FormFieldType.dropDown,
                            readOnly: true,
                            hintText: "$_remindMe minutes early",
                            widget: Row(
                              children: [
                                Builder(builder: (context) {
                                  return CustomDropDownButton(
                                    dropDownMenuItems:
                                        DropDownMenuItems.remindMeDropDownMenuItems,
                                    onChanged: (Object? newValue) {
                                      _remindMe = newValue as int;
                                      DropDownFieldCubit.get(context)
                                          .changeRemindDropDownMenuItemValue(
                                              _remindMe.toString());
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
                            formFieldType: FormFieldType.dropDown,
                            readOnly: true,
                            hintText: _repeat,
                            widget: Row(
                              children: [
                                Builder(builder: (context) {
                                  return CustomDropDownButton(
                                      dropDownMenuItems:
                                          DropDownMenuItems.repeatDropDownMenuItems,
                                      onChanged: (Object? newValue) {
                                        _repeat = newValue.toString();
                                        DropDownFieldCubit.get(context)
                                            .changeRepeatDropDownMenuItemValue(
                                                _repeat);
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
