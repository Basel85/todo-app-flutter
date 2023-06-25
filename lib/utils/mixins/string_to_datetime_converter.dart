import 'package:intl/intl.dart';

mixin StringToDateTimeConverter {
  DateTime convertStringToDateTime(String date,DateFormat dateFormat) {
    DateTime dateTime = dateFormat.parse(date);
    return dateTime;
  }
}
