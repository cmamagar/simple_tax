import 'package:get/get.dart';

class ExpensesScreenController extends GetxController {
  var isExpenseSelected = true.obs;

  // Function to toggle between Expense and Income
  void toggleExpenseIncome() {
    isExpenseSelected.value = !isExpenseSelected.value;
  }

  var touchedIndex = (-1).obs;
}
