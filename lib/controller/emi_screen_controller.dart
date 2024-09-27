import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiController extends GetxController {
  final TextEditingController loanAmountController = TextEditingController();
  final TextEditingController tenureYearsController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController emiAdvanceController = TextEditingController();
  final TextEditingController emiArrearsController = TextEditingController();
  final TextEditingController emiTypeController = TextEditingController();

  // Variables to hold the calculated EMI and related details
  var emiResult = 0.0.obs;
  var totalAmountWithInterest = 0.0.obs;
  var totalInterestAmount = 0.0.obs;

  var selectedEmiTypeOption = "".obs;
  final List<String> typeOptions = ['In Advance', 'In Arrear'];

  void updateSelected(String value) {
    selectedEmiTypeOption.value = value;
  }

  // Method to calculate EMI
  void calculateEmi() {
    // Try to parse the input, with a fallback value
    double loanAmount = double.tryParse(loanAmountController.text) ?? 0.0;
    double tenureYears = double.tryParse(tenureYearsController.text) ?? 0.0;
    double interestRate = double.tryParse(interestRateController.text) ?? 0.0;

    // Return early if any input is invalid
    if (loanAmount <= 0 || tenureYears <= 0 || interestRate <= 0) {
      emiResult.value = 0.0;
      totalAmountWithInterest.value = 0.0;
      totalInterestAmount.value = 0.0;
      return;
    }

    // Common parameters
    double monthlyInterestRate = interestRate / (12 * 100);
    double tenureMonths = tenureYears * 12;
    double emi = 0.0;

    // Check which EMI type is selected and apply the appropriate formula
    if (selectedEmiTypeOption.value == 'In Arrear') {
      // Formula for EMI in Arrears: EMI = [P * r * (1+r)^n] / [(1+r)^n-1]
      emi = (loanAmount *
              monthlyInterestRate *
              pow(1 + monthlyInterestRate, tenureMonths)) /
          (pow(1 + monthlyInterestRate, tenureMonths) - 1);
    } else if (selectedEmiTypeOption.value == 'In Advance') {
      // Formula for EMI in Advance: EMI = P * r * (1 + r)^n / [(1 + r)^n - 1]
      emi = (loanAmount *
              pow(1 + monthlyInterestRate, tenureMonths) *
              monthlyInterestRate) /
          (pow(1 + monthlyInterestRate, tenureMonths) - 1);
    }

    emiResult.value = emi.isNaN ? 0.0 : emi;
    totalAmountWithInterest.value = emiResult.value * tenureMonths;
    totalInterestAmount.value = totalAmountWithInterest.value - loanAmount;
  }

  // Clean up the controllers when the controller is disposed
  @override
  void onClose() {
    loanAmountController.dispose();
    tenureYearsController.dispose();
    interestRateController.dispose();
    emiTypeController.dispose();

    super.onClose();
  }
}
