import 'package:intl/intl.dart';

class HumanFormats {
  // ** encerrando la variable entre [] la hacemos opcional
  static String number(double number, [int decimals = 0]) {
    final formaterNumber = NumberFormat.compactCurrency(
            decimalDigits: decimals, locale: 'en', symbol: '')
        .format(number);
    return formaterNumber;
  }
}
