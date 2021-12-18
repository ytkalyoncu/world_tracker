import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_map/world_map.dart';

// import '../../i18n/language_controller.dart';
import 'controller.dart';
import '../../components/drawer.dart';
import '../../constants.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LanguageController languageController = Get.find();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('home.title'.tr),
        // TODO: Add i18n if it needs in the future
        // actions: [
        //   TextButton(
        //     onPressed: () => controller.toggleLanguage(),
        //     child: Text(
        //       languageController.lang.toUpperCase(),
        //       style: const TextStyle(fontSize: 25, color: Colors.white),
        //     ),
        //   )
        // ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.05, horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Map
              Expanded(
                child: InteractiveViewer(
                  maxScale: 75.0,
                  child: Center(
                    child: Obx(
                      () => WorldMap(
                        callback: (countryCode, tapUpDetails) {
                          Get.bottomSheet(
                            bottomSheetCard(countryCode),
                            // barrierColor: Colors.transparent,
                          );
                        },
                        countryColors: controller.worldCountryColors,
                      ),
                    ),
                  ),
                ),
              ),
              statsText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget statsText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Countries:',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Obx(
          () => Text(
            'Been: ${controller.counter['been']}',
            style: const TextStyle(
              color: beenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Obx(
          () => Text(
            'Want: ${controller.counter['want']}',
            style: const TextStyle(
              color: wantColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Obx(
          () => Text(
            'Favorite: ${controller.counter['fav']}',
            style: const TextStyle(
              color: favColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheetCard(String countryCode) {
    var countryFlagName = countryCode[0] + countryCode[1].toLowerCase();
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: appBarColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    '/flags/$countryFlagName.png',
                    width: 100,
                    height: 60,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(width: 10),
              Text(
                countryFlagName.tr,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Obx(
                  () => bottomSheetCheckBox(
                    'Been',
                    countryCode,
                    controller.countryList[countryCode]?.been ?? false,
                    beenColor,
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => bottomSheetCheckBox(
                    'Want',
                    countryCode,
                    controller.countryList[countryCode]?.want ?? false,
                    wantColor,
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => bottomSheetCheckBox(
                    'Favorite',
                    countryCode,
                    controller.countryList[countryCode]?.fav ?? false,
                    favColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomSheetCheckBox(
      String text, String countryCode, bool value, Color color) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: color),
      child: CheckboxListTile(
        activeColor: appBarColor,
        checkColor: color,
        // tileColor: Colors.white,
        title: Text(
          text,
          style: TextStyle(color: color),
        ),
        value: value,
        onChanged: (bool? val) {
          if (color == beenColor || color == wantColor) {
            controller.toggleCountry(countryCode: countryCode, color: color);
          }
        },
        controlAffinity: ListTileControlAffinity.leading,
        // contentPadding: const EdgeInsets.all(2), // This thing is not working
      ),
    );
  }
}
