import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_map/world_map.dart';
import 'package:world_tracker/constants.dart';

import '../../i18n/language_controller.dart';
import '../../models/country.dart';

class HomeController extends GetxController {
  final _coloredContries = RxMap<String, Country>();

  bool isBeen(String countryCode) =>
      _coloredContries[countryCode]?.been ?? false;
  bool isWant(String countryCode) =>
      _coloredContries[countryCode]?.want ?? false;
  bool isFav(String countryCode) => _coloredContries[countryCode]?.fav ?? false;

  int get countBeen => _coloredContries.values.where((element) => element.been).length;
  int get countWant => _coloredContries.values.where((element) => element.want).length;
  int get countFav => _coloredContries.values.where((element) => element.fav).length;

  WorldCountryColors get worldCountryColors {
    return const WorldCountryColors().fromMap(
      _coloredContries.map(
        (k, v) => MapEntry(
            k,
            v.been
                ? beenColor
                : v.want
                    ? wantColor
                    : v.fav
                        ? favColor
                        : null),
      ),
    );
  }

  void toggleCountry({
    required String countryCode,
    required bool been,
    required bool want,
    required bool fav,
  }) {

    if (_coloredContries.containsKey(countryCode)) {
      _coloredContries.remove(countryCode);
    } else {
      _coloredContries.addAll({
        countryCode: Country(
            code: countryCode,
            name: countryCode.tr,
            been: been,
            want: want,
            fav: fav),
      });
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
