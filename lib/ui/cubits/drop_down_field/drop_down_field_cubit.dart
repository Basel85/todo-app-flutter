import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drop_down_field_states.dart';

class DropDownFieldCubit extends Cubit<DropDownFieldStates> {
  DropDownFieldCubit() : super(DropDownInitialState());
  static DropDownFieldCubit get(context) => BlocProvider.of(context);
  String selectedValue = "";
  void changeRepeatDropDownMenuItemValue(String value) {
    selectedValue = value;
    debugPrint(selectedValue);
    emit(DropDownChangedState());
  }

  void changeRemindDropDownMenuItemValue(String value) {
    selectedValue = "$value minutes early";
    emit(DropDownChangedState());
  }
}
