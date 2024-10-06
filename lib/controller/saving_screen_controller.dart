import 'package:get/get.dart';

class SavingScreenController extends GetxController{
var interestRate = 5.0.obs;
  var period = 1.obs;
  var interestType = 'Annual'.obs;
  var periodType = 'Years'.obs;

  // Dropdown items for interest type and period type
  List<String> interestTypes = ['Annual', 'Monthly'];
  List<String> periodTypes = ['Years', 'Months'];

  // Methods to increment/decrement interest rate and period
  void incrementRate() {
    interestRate.value += 0.1;
  }

  void decrementRate() {
    interestRate.value -= 0.1;
  }

  void incrementPeriod() {
    period.value += 1;
  }

  void decrementPeriod() {
    period.value -= 1;
  }
}
