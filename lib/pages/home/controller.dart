import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_map/world_map.dart';
import 'package:world_tracker/constants.dart';

import '../../i18n/language_controller.dart';
import '../../models/country.dart';

class HomeController extends GetxController {
  final _coloredContries = RxMap<String, Color>();

  final _countryList = <String, Country>{}.obs;
  Map<String, Country> get countryList => _countryList;

  get worldCountryColors =>
      const WorldCountryColors().fromMap(_coloredContries);

  final _counter = RxMap<String, int>({'been': 0, 'want': 0, 'fav': 0});
  Map<String, int> get counter => _counter;

  void selectedCountry({
    required String countryCode,
    bool? been,
    bool? want,
    bool? fav,
  }) {
    bool _been = been ?? false;
    bool _want = want ?? false;
    bool _fav = fav ?? false;
  }

  void toggleCountry({
    required String countryCode,
    required Color color,
  }) {
    bool been = false;
    bool want = false;
    bool fav = false;
    if (color == beenColor) {
      been = true;
      _counter['been'] = _counter['been']! + 1;
    }
    if (color == wantColor) {
      want = true;
      _counter['want'] = _counter['want']! + 1;
    }
    if (color == favColor) {
      fav = true;
      _counter['fav'] = _counter['fav']! + 1;
    }

    if (_coloredContries.containsKey(countryCode)) {
      //_coloredContries.update(country, (value) => color);
      _coloredContries.remove(countryCode);
      _countryList.remove(countryCode);
    } else {
      _countryList.addAll({
        countryCode: Country(
            code: countryCode,
            name: countryCode.tr,
            been: been,
            want: want,
            fav: fav),
      });
      _coloredContries.addAll({countryCode: color});
      print(_countryList);
    }
  }

  toggleLanguage() {
    LanguageController languageController = Get.find();
    switch (languageController.lang) {
      case 'en':
        languageController.updateLanguage(const Locale('tr'));
        break;
      case 'tr':
        languageController.updateLanguage(const Locale('en'));
        break;
      default:
    }
  }
}
