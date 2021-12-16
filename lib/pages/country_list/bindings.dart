import 'package:get/get.dart';

import 'controller.dart';

class CountryListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryListController>(() => CountryListController());
  }
}
