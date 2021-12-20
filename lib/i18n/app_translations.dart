// ignore_for_file: prefer_single_quotes

import 'package:get/get.dart';

import 'countries_translations.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          // Home
          "home.title": "World Tracker",
          // Country List
          "countryList.title": "Country List",
          ...countryTranslations

        },
        "tr": {
          // Home
          "home.title": "Dünya Takibi",
          // Country List
          "countryList.title": "Ülke Listesi",
        },
      };
}
