import 'dart:async';

import 'package:get/get.dart';
import 'package:simple_tax/view/screens/home.dart';

class SplashScreenController extends GetxController{
  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () async {
      Get.offAll(() => HomeScreen());
    });
    super.onInit();
  }
}