import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
import 'package:streetlamp/utils/formatPrice.dart';

import 'City.dart';

class CityListData {
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
}
