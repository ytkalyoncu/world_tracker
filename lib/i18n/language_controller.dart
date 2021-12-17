import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants.dart';

class LanguageController extends GetxController {
  Locale get locale => _language.value;
  String get lang => _language.value.languageCode;

  // Update current language
  void updateLanguage(Locale value) {
    _setLocale(value);
  }

  late Rx<Locale> _language;
  final _store = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _setInitialLocalLanguage();
  }

  void _setLocale(Locale value) {
    _language.value = value;
    Get.updateLocale(value);

    // Save language to store async
    _store.write('language', _language.value.languageCode);
  }

  // Retrieves and sets language based on device settings or default value
  void _setInitialLocalLanguage() {
    var storedLocale = _currentLanguageStore;
    if (storedLocale == null) {
      var deviceLanguage = Get.deviceLocale ?? defaultLanguage;
      _language = deviceLanguage.obs;
      updateLanguage(deviceLanguage);
    } else {
      _language = storedLocale.obs;
      updateLanguage(storedLocale);
    }
  }

  // Gets current language stored
  Locale? get _currentLanguageStore {
    var languageCode = _store.read<String?>('language');
    var isStored = languageCode != null && languageCode != '';
    return isStored ? Locale(languageCode!) : null;
  }
}
