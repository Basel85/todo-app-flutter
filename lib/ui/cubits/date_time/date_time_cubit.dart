import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/ui/cubits/date_time/date_time_states.dart';

class DateTimeCubit extends Cubit<DateTimeStates> {
  DateTimeCubit() : super(DateTimeInitialState());
  static DateTimeCubit get(context) => BlocProvider.of(context);
  
  // TimeOfDay selectedTime = TimeOfDay.now();
  void changeDate(String date) {
    emit(DateTimeChangedDateState(date));
  }

  void changeTime(String time, isStartTime) {
    if(isStartTime) {
      emit(DateTimeChangedStartTimeState(time));
    } else {
      emit(DateTimeChangedEndTimeState(time));
    }
  }
}