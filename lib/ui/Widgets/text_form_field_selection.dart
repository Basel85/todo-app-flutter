import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/enums.dart';
import 'package:todo/ui/Widgets/custom_text_form_field.dart';
import 'package:todo/ui/cubits/date_time/date_time_cubit.dart';
import 'package:todo/ui/cubits/date_time/date_time_states.dart';
import 'package:todo/ui/cubits/drop_down_field/drop_down_field_cubit.dart';
import 'package:todo/ui/cubits/drop_down_field/drop_down_field_states.dart';

class TextFormFieldSelection extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final FormFieldType formFieldType;
  final bool readOnly;
  
  const TextFormFieldSelection({super.key, required this.hintText,  this.controller, required this.formFieldType, required this.readOnly});

  @override
  Widget build(BuildContext context) {
    switch (formFieldType) {
      case FormFieldType.dropDown:
        return BlocBuilder<DropDownFieldCubit, DropDownFieldStates>(
            buildWhen: (previous, current) => current is DropDownChangedState,
            builder: ((context, state) => state is DropDownChangedState?CustomTextFormField(hintText: DropDownFieldCubit.get(context).selectedValue, readOnly: readOnly, controller: controller,):CustomTextFormField(controller: controller, hintText: hintText, readOnly: readOnly)));
      case FormFieldType.date:
        return BlocBuilder<DateTimeCubit, DateTimeStates>(
          buildWhen: (previous, current) => current is DateTimeChangedDateState,
            builder: ((context, state) {
              if(state is DateTimeChangedDateState){
                return CustomTextFormField(controller: controller, hintText: state.date, readOnly: readOnly);
              }
              return CustomTextFormField(controller: controller, hintText: hintText, readOnly: readOnly);
            }));
      case FormFieldType.startTime:
        return BlocBuilder<DateTimeCubit, DateTimeStates>(
          buildWhen: (previous, current) => current is DateTimeChangedStartTimeState,
            builder: ((context, state) {
              if(state is DateTimeChangedStartTimeState){
                return CustomTextFormField(controller: controller, hintText: state.time, readOnly: readOnly);
              }
              return CustomTextFormField(controller: controller, hintText: hintText, readOnly: readOnly);
            }));
      case FormFieldType.endTime:
        return BlocBuilder<DateTimeCubit, DateTimeStates>(
          buildWhen: (previous, current) => current is DateTimeChangedEndTimeState,
            builder: ((context, state) {
              if(state is DateTimeChangedEndTimeState){
                return CustomTextFormField(controller: controller, hintText: state.time, readOnly: readOnly);
              }
              return CustomTextFormField(controller: controller, hintText: hintText, readOnly: readOnly);
            }));
      default:
        return CustomTextFormField(controller: controller, hintText: hintText, readOnly: readOnly);
    }
  }
}