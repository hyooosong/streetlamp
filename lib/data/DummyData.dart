import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
import 'package:streetlamp/utils/formatPrice.dart';

import 'City.dart';
import 'Event.dart';

class Dummydata {
  final formatNumber = NumberFormat.simpleCurrency();

  final List<City> leftCityList = [
    City(cityName: 'seoul'.tr(), count: formatPrice(323112)),
    City(cityName: 'incheon'.tr(), count: formatPrice(152675)),
    City(cityName: 'jeolla'.tr(), count: formatPrice(132788)),
    City(cityName: 'jeju'.tr(), count: formatPrice(86599)),
  ];

  final List<City> rightCityList = [
    City(cityName: 'gangwon'.tr(), count: formatPrice(102884)),
    City(cityName: 'gyeonggi'.tr(), count: formatPrice(267904)),
    City(cityName: 'chungcheong'.tr(), count: formatPrice(112007)),
    City(cityName: 'gyeongsang'.tr(), count: formatPrice(280227)),
  ];

  final List<Event> eventList = [
    Event(date: '2024-10-15', charge: '152', usage: '122'),
    Event(date: '2024-10-14', charge: '84', usage: '77'),
    Event(date: '2024-10-12', charge: '129', usage: '90'),
    Event(date: '2024-10-11', charge: '133', usage: '112'),
    Event(date: '2024-10-09', charge: '90', usage: '91'),
    Event(date: '2024-10-08', charge: '155', usage: '141'),
  ];
}
