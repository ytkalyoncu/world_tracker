import 'package:get/get.dart';

class CountryListController extends GetxController {
  CountryListController();

  final _obj = ''.obs;

  set obj(value) => this._obj.value = value;

  get obj => this._obj.value;
}
