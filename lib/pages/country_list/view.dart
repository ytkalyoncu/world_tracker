import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/drawer.dart';
import 'controller.dart';

class CountryListPage extends GetView<CountryListController> {
  const CountryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('countryList.title'.tr),
      ),
      drawer: MainDrawer(),
      body: const Center(
        child: Text('Country List'),
      ),
    );
  }
}
