import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../constants.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

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
