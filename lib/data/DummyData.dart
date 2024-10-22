import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
import 'package:streetlamp/data/ValueData.dart';
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

  final List<ValueData> statusList = [
    ValueData(key: 'operating'.tr(), value: 'normal'.tr()),
    ValueData(key: 'co2_savings'.tr(), value: '0.98g'),
    ValueData(key: 'savings'.tr(), value: '12,232${'won'.tr()}'),
    ValueData(key: 'electricity_bills'.tr(), value: '20,412${'won'.tr()}'),
    ValueData(key: 'charge'.tr(), value: '643 kWh'),
    ValueData(key: 'usage'.tr(), value: '55 kWh')
  ];

  final List<ValueData> performanceList = [
    ValueData(key: 'last_month_charge'.tr(), value: '1,09 kWh'),
    ValueData(key: 'this_month_charge'.tr(), value: '1,217 kWh'),
    ValueData(key: 'this_year_charge'.tr(), value: '13,122 kWh'),
    ValueData(key: 'total_charge'.tr(), value: '244,412 kWh'),
    ValueData(key: 'total_usage'.tr(), value: '239,097 kWh'),
    ValueData(key: 'total_co2_savings'.tr(), value: '25.43g')
  ];

  final List<ValueData> realTimeList = [
    ValueData(key: 'solar_cell_over'.tr(), value: 'good'.tr()),
    ValueData(key: 'solar_cell_low'.tr(), value: 'good'.tr()),
    ValueData(key: 'solar_cell_over_limit'.tr(), value: 'good'.tr()),
    ValueData(key: 'solar_cell_power'.tr(), value: 'good'.tr()),
    ValueData(key: 'battery_over'.tr(), value: 'good'.tr()),
    ValueData(key: 'battery_low'.tr(), value: 'good'.tr()),
    ValueData(key: 'battery_over_discharge'.tr(), value: 'good'.tr()),
    ValueData(key: 'led'.tr(), value: 'good'.tr()),
    ValueData(key: 'transmission'.tr(), value: 'good'.tr()),
    ValueData(key: 'reception'.tr(), value: 'good'.tr()),
    ValueData(key: 'spc'.tr(), value: 'good'.tr())
  ];
}
