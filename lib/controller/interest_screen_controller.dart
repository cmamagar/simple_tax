import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestCalculatorController extends GetxController {
  final principalController = TextEditingController();
  final rateController = TextEditingController();
  final timeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var result = ''.obs;

  void calculateInterest() {
    final principal = double.tryParse(principalController.text) ?? 0;
    final rate = double.tryParse(rateController.text) ?? 0;
    final time = double.tryParse(timeController.text) ?? 0;

    if (principal > 0 && rate > 0 && time > 0) {
      final interest = (principal * rate * time) / 100;
      result.value = interest.toStringAsFixed(2);
    } else {
      result.value = 'Invalid input';
    }
  }

  void onClose() {
    principalController.clear();
    rateController.clear();
    timeController.clear();
    result.value = '';
  }
}
