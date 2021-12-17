import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_map/world_map.dart';
import 'package:world_tracker/constants.dart';

import '../../i18n/language_controller.dart';
import '../../models/country.dart';

class HomeController extends GetxController {
  final _coloredContries = RxMap<String, Color>();

  final _countryList = <Country>[].obs;
  get countryList => _countryList.toList();

  get worldCountryColors =>
      const WorldCountryColors().fromMap(_coloredContries);

  void selectedCountry(){
    
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
    }
    if (color == wantColor) {
      want = true;
    }
    if (color == favColor) {
      fav = true;
    }
    var country = countryCode[0] + countryCode[1].toUpperCase();
    if (_coloredContries.containsKey(country)) {
      if (color == beenColor || color == wantColor) {
        print('if');
        _coloredContries.update(country, (value) => color);
      }
    } else {
      print('else');
      _countryList.add(Country(
          code: country, name: country, been: been, want: want, fav: fav));
      _coloredContries.addAll({country: color});
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
