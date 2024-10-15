import 'package:intl/intl.dart';

String formatPrice(int price) {
  final formatter = NumberFormat("#,###", "ko_KR");
  return formatter.format(price);
}