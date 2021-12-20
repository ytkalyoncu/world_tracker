import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../pages/home/controller.dart';
import '../constants.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: appBarColor,
            ),
            child: Column(
              children: [
                const Text(
                  'World Tracker',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(
                      () => Text(
                        'Been: ${controller.countBeen}',
                        style: const TextStyle(
                          color: beenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        'Been: ${controller.countWant}',
                        style: const TextStyle(
                          color: wantColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        'Been: ${controller.countFav}',
                        style: const TextStyle(
                          color: favColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Map'),
            onTap: () {
              Get.offAndToNamed(Routes.home);
            },
          ),
          ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Country List'),
              selectedTileColor: Colors.blue[100],
              onTap: () => Get.toNamed(Routes.countryList)),
          ListTile(
            leading: const Icon(Icons.table_chart),
            title: const Text('Statistics'),
            selectedTileColor: Colors.blue[100],
            onTap: () {
              //Get.toNamed(...);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            selectedTileColor: Colors.blue[100],
            onTap: () {
              //Get.toNamed(...);
            },
          ),
        ],
      ),
    );
  }
}
