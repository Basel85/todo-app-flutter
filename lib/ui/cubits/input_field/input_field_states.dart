abstract class InputFieldStates {}

class InputFieldInitialState extends InputFieldStates {}

class InputFieldChangedDateState extends InputFieldStates {
  final String date;
  InputFieldChangedDateState(this.date);
}

class InputFieldChangedStartTimeState extends InputFieldStates {
  final String startTime;
  InputFieldChangedStartTimeState(this.startTime);
}

class InputFieldChangedEndTimeState extends InputFieldStates {
  final String endTime;
  InputFieldChangedEndTimeState(this.endTime);
}

class InputFieldChangedRepeatState extends InputFieldStates {
  final String repeatValue;
  InputFieldChangedRepeatState(this.repeatValue);
}

class InputFieldChangedRemindState extends InputFieldStates {
  final String remindValue;
  InputFieldChangedRemindState(this.remindValue);
}
