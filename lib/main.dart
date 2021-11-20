import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'debug/index.dart';
import 'i18n/app_translations.dart';
import 'i18n/language_controller.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  await GetStorage.init();

  Get.put<LanguageController>(LanguageController());

  runApp(const MyApp());
}

// TODO(Tarik): Add authorization
// TODO(Serkan): Add themes and theme controller and also transitions

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (languageController) => GetMaterialApp(
        // Debug
        debugShowCheckedModeBanner: false,
        enableLog: true,
        logWriterCallback: Logger.write,
        // Route
        initialRoute: Routes.home,
        getPages: AppRoutes.routes,
        // Translation
        translations: AppTranslations(),
        locale: languageController.locale,
        // Themes
        defaultTransition: Transition.fade,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
