import 'package:countries_world_map/world/simple_world/simple_world.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../i18n/language_controller.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('home.title'.tr),
        actions: [
          TextButton(
            onPressed: () => controller.toggleLanguage(),
            child: Text(
              languageController.lang.toUpperCase(),
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
            () => SimpleWorldMap(
              callback: (countryCode, tapUpDetails) {
                controller.toggleCountry(countryCode: countryCode);
              },
              countryColors: controller.simpleWorldCountryColors,
            ),
          ),
        ),
      ),
    );
  }
}
