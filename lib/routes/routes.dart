import 'package:get/get.dart';

import '../pages/country_list/index.dart';
import '../pages/home/index.dart';

part 'route_paths.dart';

class AppRoutes {
  //this is to prevent anyone from instantiating this object
  AppRoutes._();

  static const initial = Routes.home;
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: Routes.countryList,
          page: () => const CountryListPage(),
        ),
      ],
    ),
  ];
}
