abstract class DateTimeStates {}
class DateTimeInitialState extends DateTimeStates {}
class DateTimeChangedDateState extends DateTimeStates {
  final String date;
  DateTimeChangedDateState(this.date);
}
class DateTimeChangedStartTimeState extends DateTimeStates {
  final String time;
  DateTimeChangedStartTimeState(this.time);
}

class DateTimeChangedEndTimeState extends DateTimeStates {
  final String time;
  DateTimeChangedEndTimeState(this.time);
}