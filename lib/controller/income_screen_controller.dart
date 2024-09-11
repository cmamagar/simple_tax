import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/l10n/nepali_numbers.dart';

class IncomeTaxController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var selectedYear = Rxn<String>();
  var selectedTaxStatus = Rxn<String>();
  var income = ''.obs;
  var bonus = ''.obs;
  var deductions = ''.obs;
  var result = ''.obs;
  var isYearly = true.obs;
  var isNepali = false.obs;

  void updateLocale(String value) {
    if (value == 'en') {
      Get.updateLocale(Locale('en'));
      isNepali.value = false;
    } else if (value == 'ne') {
      Get.updateLocale(Locale('ne'));
      isNepali.value = true;
    }
  }

  void calculateTax() {
    if (formKey.currentState?.validate() ?? false) {
      final double incomeValue = double.tryParse(convertToEnglishNumber(income.value)) ?? 0;
      final double bonusValue = double.tryParse(convertToEnglishNumber(bonus.value)) ?? 0;
      final double deductionsValue = double.tryParse(convertToEnglishNumber(deductions.value)) ?? 0;

      final double totalIncome = incomeValue + bonusValue - deductionsValue;
      double taxAmount = isYearly.value ? totalIncome * 0.13 : totalIncome * 0.13 * 12;

      if (isNepali.value) {
        result.value = '${'Tax Amount'}: ${convertToNepaliNumber(taxAmount.toStringAsFixed(2))}';
      } else {
        result.value = '${'Tax Amount'}: Rs ${taxAmount.toStringAsFixed(2)}';
      }
    }
  }
}
