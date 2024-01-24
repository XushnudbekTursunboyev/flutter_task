import 'package:intl/intl.dart';

String getCurrentFormattedDate(String date) {
  if(date.isEmpty) return "";
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat.yMd().add_Hms().format(dateTime);
  return formattedDate;
}