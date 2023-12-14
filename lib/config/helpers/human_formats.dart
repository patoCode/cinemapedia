import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    final formaterNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, locale: 'en', symbol: '')
            .format(number);
    return formaterNumber;
  }
}
