// lib/controller/interest_calculator_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InterestCalculatorController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final principalController = TextEditingController();
  final rateController = TextEditingController();
  final timeController = TextEditingController();

  var result = ''.obs;
  var isYearly = true.obs;
  var timePeriodType = 'Years'.obs;
  var isNepali = false.obs;

  void onLocaleChange(Locale locale) {
    // Logic to handle locale change
    isNepali.value = locale.languageCode == 'ne';
  }

  void calculateInterest() {
    if (formKey.currentState?.validate() ?? false) {
      double principal = double.parse(principalController.text.replaceAll(',', ''));
      double rate = double.parse(rateController.text.replaceAll(',', ''));
      double time = double.parse(timeController.text.replaceAll(',', ''));

      double interest = (principal * rate * time) / 100;
      if (!isYearly.value) {
        interest = interest / 12;
      }

      result.value = interest.toStringAsFixed(2);
    }
  }

  @override
  void onClose() {
    principalController.dispose();
    rateController.dispose();
    timeController.dispose();
    super.onClose();
  }
}
