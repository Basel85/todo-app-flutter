abstract class DateTimeStates {}
class DateTimeInitialState extends DateTimeStates {}
class DateTimeChangedDateState extends DateTimeStates {
  final String date;
  DateTimeChangedDateState(this.date);
}
class DateTimeChangedTimeState extends DateTimeStates {}