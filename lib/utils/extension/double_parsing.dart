import 'package:intl/intl.dart';

extension PriceFormater on int {
  String formatPrice() {
    final formatter = NumberFormat("#,##0", "en_US");

    return formatter.format(this);
  }
}
