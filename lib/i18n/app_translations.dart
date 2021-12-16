// ignore_for_file: prefer_single_quotes

import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => const {
        "en": {
          // Home
          "home.title": "World Tracker",
          // Country List
          "countryList.title": "Country List",
        },
        "tr": {
          // Home
          "home.title": "Dünya Takibi",
          // Country List
          "countryList.title": "Ülke Listesi",
        },
      };
}
