import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

class BillScreenController extends GetxController {
  late final DateTime now;
  late RxString formattedDate = ''.obs;

  BillScreenController() {
    now = DateTime.now();
    _updateFormattedDate();
  }

  void _updateFormattedDate() {
    if (Get.locale?.languageCode == 'ne') {
      // For Nepali date
      NepaliDateTime nepaliNow = NepaliDateTime.fromDateTime(now);
      String nepaliDate = NepaliDateFormat('yyyy-MM-dd').format(nepaliNow);
      formattedDate.value =
          NepaliUnicode.convert(nepaliDate); // Convert to Nepali numerals
    } else {
      // For English date
      formattedDate.value = DateFormat('yyyy-MM-dd').format(now);
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Listen to locale changes
    ever(Get.locale.obs, (locale) {
      _updateFormattedDate();
    });
  }
}
