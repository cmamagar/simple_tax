import 'dart:ui';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var currentFlag = 'assets/images/usa.png'.obs;
  void switchLanguage(String languageCode) {
    if (languageCode == 'en') {
      Get.updateLocale(Locale('en'));
      currentFlag.value = 'assets/images/usa.png'; // USA flag for English
    } else if (languageCode == 'ne') {
      Get.updateLocale(Locale('ne'));
      currentFlag.value = 'assets/images/nepal.png'; // Nepal flag for Nepali
    }
  }
}
