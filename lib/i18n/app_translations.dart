// ignore_for_file: prefer_single_quotes

import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => const {
        "en": {"home.title": "World Tracker"},
        "tr": {"home.title": "Dünya Takibi"},
      };
}
