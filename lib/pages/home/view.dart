import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_map/world_map.dart';

// import '../../i18n/language_controller.dart';
import 'controller.dart';
import '../../components/drawer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LanguageController languageController = Get.find();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
      drawer: const MainDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.05, horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Card(
                        color: Colors.amber,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: const [
                                Icon(Icons.flag),
                                Text('Name of the country'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: CheckboxListTile(
                                    title: const Text('Been'),
                                    value: false,
                                    onChanged: (bool? val) {},
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                  ),
                                ),
                                Expanded(
                                  child: CheckboxListTile(
                                    title: const Text('Want'),
                                    value: false,
                                    onChanged: (bool? val) {},
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                  ),
                                ),
                                Expanded(
                                  child: CheckboxListTile(
                                    title: const Text('Fav'),
                                    value: false,
                                    onChanged: (bool? val) {},
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      barrierColor: Colors.transparent,
                    );
                  },
                  child: const Text('selam')),
              // Map
              Expanded(
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
              // Simple Stats
              const Text(
                'Countries',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Been: 15',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Want: 2',
                style: TextStyle(
                  color: Colors.purple[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Favorite: 3',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
