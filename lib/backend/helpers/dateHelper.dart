import 'package:intl/intl.dart';

String formatForDisplayDate(DateTime date) {
  var format = DateFormat("MM / DD / yyyy");
  var formatted = format.format(date);
  return formatted;
}
