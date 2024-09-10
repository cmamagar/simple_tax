import 'dart:ui';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  void onLocaleChange(Locale locale) {
    Get.updateLocale(locale);
  }
}
