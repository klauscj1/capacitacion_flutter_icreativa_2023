import 'package:intl/intl.dart';

class NumberFormatShow {
  static String formartNumberShow(double number) {
    final formatterNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
            .format(number);
    return formatterNumber;
  }
}
