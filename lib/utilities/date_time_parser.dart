

import 'package:intl/intl.dart';

class DateFormatter {
  static DateFormat requiredDate = DateFormat('yyyy-MM-dd');

  ///this will format the date (Nov 25,2021)
  static dateFormat(DateTime dateTime) {
    return requiredDate.format(dateTime);
  }

}