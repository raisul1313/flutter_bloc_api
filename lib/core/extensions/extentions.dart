import 'package:intl/intl.dart';

extension TextFormatter on String {
  String reduceTextLength(int length) {
    return (this.length > length) ? "${substring(0, length - 1)}..." : this;
  }

  static NumberFormat currencyFormatter() {
    return NumberFormat.currency(locale: "en_US", symbol: "");
  }
}
