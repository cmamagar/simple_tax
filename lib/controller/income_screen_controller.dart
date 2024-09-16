import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/l10n/nepali_numbers.dart';

class IncomeTaxController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final incomeController = TextEditingController();
  final bonusController = TextEditingController();
  final deductionController = TextEditingController();
  var result = ''.obs;
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
      final double incomeValue =
          double.tryParse(convertToEnglishNumber(incomeController.text)) ?? 0;
      final double bonusValue =
          double.tryParse(convertToEnglishNumber(bonusController.text)) ?? 0;
      final double deductionsValue =
          double.tryParse(convertToEnglishNumber(deductionController.text)) ??
              0;
      // Debugging: Print parsed values
      log('Income: $incomeValue, Bonus: $bonusValue, Deductions: $deductionsValue');
      //log('Total Income: $totalIncome');

      // Determine the tax rate based on selectYearMonthOption value
      double taxAmount;
      if (selectYearMonthOption.value == 'Year') {
        taxAmount = (incomeValue + bonusValue - deductionsValue) * 0.13 * 12;
        log("Tax Amount0");
      } else if (selectYearMonthOption.value == 'Month') {
        taxAmount = (incomeValue + bonusValue - deductionsValue) * 0.13;
      } else {
        taxAmount = 0;
        log('Invalid selectYearMonthOption value: ${selectYearMonthOption.value}');
      }

      // Debugging: Print the calculated tax amount
      log('Tax Amount: $taxAmount');
      if (isNepali.value) {
        result.value =
            '${'Tax Amount'}: ${convertToNepaliNumber(taxAmount.toStringAsFixed(2))}';
      } else {
        result.value = '${'Tax Amount'}: Rs ${taxAmount.toStringAsFixed(2)}';
      }
    } else {
      log('Form validation failed');
    }
  }

  var selectedYearOption = "".obs;
  var selectStatusOption = "".obs;
  var selectYearMonthOption = "".obs;

  // Options for the dropdown
  final List<String> yearOptions = ['Year 1', 'Year 2', 'Year 3'];
  final List<String> statusOptions = ['Single', 'Married'];
  final List<String> yearMonthOptions = ['Year', 'Month'];

  // Method to update selected status
  void updateSelectedStatus(String value) {
    selectStatusOption.value = value;
  }

  // Method to update selected year or months

  void updateSelectedYearMonth(String value) {
    selectYearMonthOption.value = value;
    log("Select Year or Months: ${selectYearMonthOption}");
  }

  // Method to update the selected value
  void updateSelected(String value) {
    selectedYearOption.value = value;
  }

  void clearFields() {
    // If incomeController, bonusController, and deductionController are TextEditingControllers
    incomeController.clear();
    bonusController.clear();
    deductionController.clear();

    // If selectedYearOption, selectStatusOption, and selectYearMonthOption are RxStrings
    selectedYearOption.value = ''; // Clear the selected year option
    selectStatusOption.value = ''; // Clear the selected status option
    selectYearMonthOption.value = ''; // Clear the year/month option
  }
}
