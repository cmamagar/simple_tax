import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiController extends GetxController {
  final TextEditingController loanAmountController = TextEditingController();
  final TextEditingController tenureYearsController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController emiAdvanceController = TextEditingController();
  final TextEditingController emiArrearsController = TextEditingController();

  // Variables to hold the calculated EMI and related details
  var emiResult = 0.0.obs;
  var totalAmountWithInterest = 0.0.obs;
  var totalInterestAmount = 0.0.obs;

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

    // Formula to calculate EMI
    double monthlyInterestRate = interestRate / (12 * 100);
    double tenureMonths = tenureYears * 12;

    // EMI calculation using the formula: EMI = [P * r * (1+r)^n] / [(1+r)^n-1]
    double emi = (loanAmount *
            monthlyInterestRate *
            (pow(1 + monthlyInterestRate, tenureMonths))) /
        (pow(1 + monthlyInterestRate, tenureMonths) - 1);

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
    super.onClose();
  }
}
