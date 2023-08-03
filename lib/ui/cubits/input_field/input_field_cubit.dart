import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/ui/cubits/input_field/input_field_states.dart';

class InputFieldCubit extends Cubit<InputFieldStates> {
  InputFieldCubit() : super(InputFieldInitialState());
  static InputFieldCubit get(context) => BlocProvider.of(context);
  void changeDate(String date) {
    emit(InputFieldChangedDateState(date));
  }

  void changeTime(String time, isStartTime) {
    if(isStartTime) {
      emit(InputFieldChangedStartTimeState(time));
    } else {
      emit(InputFieldChangedEndTimeState(time));
    }
  }
  void changeRepeatInputFieldMenuItemValue(String value) {
    emit(InputFieldChangedRepeatState(value));
  }

  void changeRemindInputFieldMenuItemValue(String value) {
    emit(InputFieldChangedRemindState("$value minutes early"));
  }
}
