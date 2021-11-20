import 'dart:ui';

import 'package:countries_world_map/world/simple_world/simple_world.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../i18n/language_controller.dart';
import '../../utils/extension/simple_world_country_colors.dart';

class HomeController extends GetxController {
  final _coloredContries = RxMap<String, MaterialColor>();

  get simpleWorldCountryColors =>
      const SimpleWorldCountryColors().fromMap(_coloredContries);

  void toggleCountry({
    required String countryCode,
    MaterialColor color = Colors.blue,
  }) {
    var country = countryCode[0] + countryCode[1].toUpperCase();
    if (_coloredContries.containsKey(country)) {
      _coloredContries.remove(country);
    } else {
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
