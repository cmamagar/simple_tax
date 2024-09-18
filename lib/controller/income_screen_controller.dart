import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeTaxController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final incomeController = TextEditingController();
  final bonusController = TextEditingController();
  final deductionController = TextEditingController();
  RxString result = ''.obs;
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

      double totalIncome = incomeValue + bonusValue - deductionsValue;

      double taxAmount;
      if (selectYearMonthOption.value == 'Year') {
        taxAmount = totalIncome * 0.13 * 12; // Annual tax rate
      } else {
        taxAmount = totalIncome * 0.13; // Monthly tax rate
      }

      double effectiveTaxRate = (taxAmount / totalIncome) * 100;

      if (isNepali.value) {
        result.value =
            '${'Tax Amount'}: ${convertToNepaliNumber(taxAmount.toStringAsFixed(2))}\n${'Effective Tax Rate'}: ${convertToNepaliNumber(effectiveTaxRate.toStringAsFixed(2))}%';
      } else {
        result.value =
            '${'Tax Amount'}: Rs ${taxAmount.toStringAsFixed(2)}\n${'Effective Tax Rate'}: ${effectiveTaxRate.toStringAsFixed(2)}%';
      }
    } else {
      result.value = ''; // Clear the result if form validation fails
    }
  }

  String convertToNepaliNumber(String input) {
    const Map<String, String> englishToNepaliDigits = {
      '0': '०',
      '1': '१',
      '2': '२',
      '3': '३',
      '4': '४',
      '5': '५',
      '6': '६',
      '7': '७',
      '8': '८',
      '9': '९',
    };

    String nepaliNumber = input.split('').map((char) {
      return englishToNepaliDigits[char] ?? char;
    }).join();

    return nepaliNumber;
  }

  String convertToEnglishNumber(String nepaliNumber) {
    const Map<String, String> nepaliToEnglishDigits = {
      '०': '0',
      '१': '1',
      '२': '2',
      '३': '3',
      '४': '4',
      '५': '5',
      '६': '6',
      '७': '7',
      '८': '8',
      '९': '9'
    };

    final buffer = StringBuffer();

    for (int i = 0; i < nepaliNumber.length; i++) {
      String char = nepaliNumber[i];
      buffer.write(nepaliToEnglishDigits[char] ?? char);
    }

    return buffer.toString();
  }

  final List<String> yearOptions = ['2024', '2025', '2026'];
  final List<String> statusOptions = ['Single', 'Married'];
  final List<String> yearMonthOptions = ['Year', 'Month'];

  var selectedYearOption = "".obs;
  var selectYearMonthOption = "".obs;
  var selectStatusOption = "".obs;

  final singleSlabs = [
    ['1.', '0_500000', '1_percent', '5,000'],
    ['2.', '500000_700000', '10_percent', '20,000'],
    ['3.', '700000_1000000', '20_percent', '60,0000'],
    ['4.', '1000000_2000000', '30_percent', '3,00,000'],
    ['5.', '2000000_5000000', '36_percent(plus 30% : 20% added)', '10,80,000'],
    ['6.', 'above_5000000', '39_percent(plus 30% : 30% added)', '3,90,0000'],
  ];

  final marriedSlabs = [
    ['1.', '0_600000', '1_percent', '6,000'],
    ['2.', '600000_800000', '10_percent', '20,000'],
    ['3.', '800000_1100000', '20_percent', '60,0000'],
    ['4.', '1100000_2000000', '30_percent', '2,70,000'],
    ['5.', '2000000_5000000', '36_percent(plus 30% : 20% added)', '10,80,000'],
    ['6.', 'above_5000000', '39_percent(plus 30% : 30% added)', '3,90,0000'],
  ];

  List<List<String>> get currentSlabs =>
      selectStatusOption.value == 'Single' ? singleSlabs : marriedSlabs;

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
    selectYearMonthOption.value = '';
    result.value = "";
    // Clear the year/month option
  }
}
