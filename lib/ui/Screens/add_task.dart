import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constants/drop_down_menu_items.dart';
import 'package:todo/ui/Widgets/add_task/task_circle.dart';
import 'package:todo/ui/Widgets/button.dart';
import 'package:todo/ui/Widgets/shared/custom_drop_down_button.dart';
import 'package:todo/ui/Widgets/shared/custom_non_drop_down_button.dart';
import 'package:todo/ui/Widgets/shared/custom_text_form_field.dart';
import 'package:todo/ui/cubits/input_field/input_field_cubit.dart';
import 'package:todo/ui/cubits/input_field/input_field_states.dart';
import 'package:todo/ui/cubits/task_color/task_color_cubit.dart';
import 'package:todo/ui/cubits/task_color/task_color_states.dart';
import '../../theme.dart';
import '../Widgets/shared/appbar_task.dart';
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
  int _remindMe = DropDownMenuItems.remindMeDropDownMenuItems[0];
  String _repeat = DropDownMenuItems.repeatDropDownMenuItems[0].toString();
  late String _date;
  late String _startTime;
  late String _endTime;
  DateTime _currentSeletedDate = DateTime.now();
  TimeOfDay _selectedStartTime = TimeOfDay.now();
  TimeOfDay _selectedEndTime = TimeOfDay.now();
  final List<Color> _taskCircleColors = [primary, pink, orange];
  Color _taskCircleColor = primary;
  @override
  void initState() {
    _date = DateFormat.yMd().format(DateTime.now());
    super.initState();
  }

  void addTask() {
    debugPrint("title: ${_titleEditingController.text}");
    debugPrint("note: ${_noteEditingController.text}");
    debugPrint("Date: $_date");
    debugPrint("Start time: $_startTime");
    debugPrint("End time: $_endTime");
    debugPrint("remind me: $_remindMe");
    debugPrint("repeat: $_repeat");
    debugPrint("color: $_taskCircleColor");
  }

  void changeTime(bool isStartTime) {
    showTimePicker(
            context: context,
            initialTime: isStartTime ? _selectedStartTime : _selectedEndTime)
        .then((time) {
      isStartTime
          ? _startTime = time == null
              ? _selectedStartTime.format(context)
              : time.format(context)
          : _endTime = time == null
              ? _selectedEndTime.format(context)
              : time.format(context);
      if (time != null) {
        isStartTime ? _selectedStartTime = time : _selectedEndTime = time;
        InputFieldCubit.get(context)
            .changeTime(isStartTime ? _startTime : _endTime, isStartTime);
      }
    });
  }

  void changeDate() {
    showDatePicker(
            context: context,
            initialDate: _currentSeletedDate,
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime(DateTime.now().year + 10))
        .then((selectedDateTime) {
      _date = DateFormat.yMd().format(selectedDateTime ?? _currentSeletedDate);
      if (selectedDateTime != null && selectedDateTime != _currentSeletedDate) {
        _currentSeletedDate = selectedDateTime;
        InputFieldCubit.get(context).changeDate(_date);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarTask(
        assetImagePath: "assets/images/person.png",
        appBarTitle: "Add Task",
        isHomePage: false,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 20,top: 20, left: 14, right: 14),
        children: [
          Text(
            "Add Task",
            style: Themes.headingStyle,
            textAlign: TextAlign.center,
          ),
          InputField(
              title: "Title",
              textField: CustomTextFormField(
                controller: _titleEditingController,
                hintText: "Enter title here",
                suffix: const CustomNonDropDownButton(
                iconData: Icons.alarm_add_rounded,
              ),

            ),
          ),
          InputField(
              title: "Note",
              textField: CustomTextFormField(
                controller: _noteEditingController,
                hintText: "Enter note here",
                suffix: const CustomNonDropDownButton(iconData: Icons.alarm_add_rounded),
              ),
              ),
          InputField(
            title: "Date",
            textField:
                BlocBuilder<InputFieldCubit, InputFieldStates>(
              buildWhen: (context, state) =>
                  state is InputFieldChangedDateState,
              builder: (context, state) => CustomTextFormField(
                hintText: state is InputFieldChangedDateState
                    ? state.date
                    : DateFormat.yMd().format(DateTime.now()),
                readOnly: true,
                suffix: CustomNonDropDownButton(
                  iconData: Icons.calendar_today_outlined,
                  onPressed: () {
                    changeDate();
                  },
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: InputField(
                title: "Start time",
                textField: BlocBuilder<InputFieldCubit,
                    InputFieldStates>(
                  buildWhen: (previous, current) =>
                      current is InputFieldChangedStartTimeState,
                  builder: (context, state) =>
                      CustomTextFormField(
                    hintText:
                        state is InputFieldChangedStartTimeState
                            ? state.startTime
                            : DateFormat("hh:mm a")
                                .format(DateTime.now()),
                    readOnly: true,
                     suffix: CustomNonDropDownButton(iconData: Icons.access_alarm_rounded,onPressed: () {
                      changeTime(true);
                    },),
                  ),
                ),
              )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: InputField(
                  textField: BlocBuilder<InputFieldCubit,
                      InputFieldStates>(
                    buildWhen: (previous, current) =>
                        current is InputFieldChangedEndTimeState,
                    builder: (context, state) =>
                        CustomTextFormField(
                      hintText: state
                              is InputFieldChangedEndTimeState
                          ? state.endTime
                          : DateFormat("hh:mm a")
                              .format(DateTime.now().add(
                                  const Duration(minutes: 10)))
                              .toString(),
                      readOnly: true,
                      suffix: CustomNonDropDownButton(iconData: Icons.access_alarm_rounded, onPressed: () {
                        changeTime(false);
                      },),
                    ),
                  ),
                  title: "End time",
                ),
              )
            ],
          ),
          InputField(
            title: "Remind",
            textField:
                BlocBuilder<InputFieldCubit, InputFieldStates>(
              buildWhen: (previous, current) =>
                  current is InputFieldChangedRemindState,
              builder: (context, state) => CustomTextFormField(
                hintText: state is InputFieldChangedRemindState
                    ? state.remindValue
                    : "$_remindMe minutes early",
                readOnly: true,
                suffix: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: CustomDropDownButton(
                                         dropDownMenuItems: DropDownMenuItems
                   .remindMeDropDownMenuItems,
                                         onChanged: (Object? newValue) {
                                           if (_remindMe != newValue as int) {
                        _remindMe = newValue;
                                           InputFieldCubit.get(context)
                     .changeRemindInputFieldMenuItemValue(
                         _remindMe.toString());
                                           }
                                         },
                    ),
                ),
              ),
            ),
          ),
          InputField(
            title: "Repeat",
            textField:
                BlocBuilder<InputFieldCubit, InputFieldStates>(
              buildWhen: (previous, current) =>
                  current is InputFieldChangedRepeatState,
              builder: (context, state) => CustomTextFormField(
                hintText: state is InputFieldChangedRepeatState
                    ? state.repeatValue
                    : _repeat,
                readOnly: true,
                suffix: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: CustomDropDownButton(
                    dropDownMenuItems: DropDownMenuItems
                        .repeatDropDownMenuItems,
                    onChanged: (Object? newValue) {
                      if (_repeat != newValue.toString()) {
                        _repeat = newValue.toString();
                        InputFieldCubit.get(context)
                            .changeRepeatInputFieldMenuItemValue(
                                _repeat);
                      }
                    }),
                )
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(children: [
            Expanded(
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
                      _taskCircleColors.length,
                      (index) => GestureDetector(
                          onTap: () {
                            if (_taskCircleColor !=
                                _taskCircleColors[index]) {
                              _taskCircleColor =
                                  _taskCircleColors[index];
                              TaskColorCubit.get(context)
                                  .changeTaskColorIndex(index);
                            }
                          },
                          child: BlocBuilder<TaskColorCubit,
                              TaskColorStates>(
                            buildWhen: (prev, current) =>
                                current
                                    is TaskColorChangedIndexState &&
                                (current.taskColorCurrentIndex ==
                                        index ||
                                    current.taskColorPrevIndex ==
                                        index),
                            builder: (context, state) =>
                                TaskCircle(
                              taskCircleColor:
                                  _taskCircleColors[index],
                              isSelected: state
                                      is! TaskColorChangedIndexState
                                  ? index == 0
                                      ? true
                                      : false
                                  : state.taskColorCurrentIndex ==
                                          index
                                      ? true
                                      : false,
                            ),
                          )),
                    )),
              ],
            )),
            TaskButton(
              label: "Create task",
              onTap: addTask,
            ),
          ]),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _noteEditingController.dispose();
    _titleEditingController.dispose();
    super.dispose();
  }
}
