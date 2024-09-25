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

  var currentIndex = 0.obs;
  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'david_r'.tr,
      'image':
          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
      'review': 'testimonial1'.tr,
      'rating': "5".tr,
    },
    {
      'name': 'sarah_l'.tr,
      'image':
          'https://www.shutterstock.com/shutterstock/photos/2122700972/display_1500/stock-photo-image-of-young-asian-woman-company-worker-in-glasses-smiling-and-holding-digital-tablet-standing-2122700972.jpg',
      'review': 'testimonial2'.tr,
      'rating': "4".tr,
    },
    {
      'name': 'michael_t'.tr,
      'image':
          'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?cs=srgb&dl=pexels-justin-shaifer-501272-1222271.jpg&fm=jpg',
      'review': 'testimonial3'.tr,
      'rating': "5".tr,
    },
  ];
}
