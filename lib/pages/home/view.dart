import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_map/world_map.dart';

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
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        child: InteractiveViewer(
          maxScale: 75.0,
          child: Center(
            child: Obx(
              () => WorldMap(
                callback: (countryCode, tapUpDetails) {
                  controller.toggleCountry(countryCode: countryCode);
                },
                countryColors: controller.simpleWorldCountryColors,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
