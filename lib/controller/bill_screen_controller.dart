import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BillScreenController extends GetxController {
  late final DateTime now; 
  late final String formattedDate;

  BillScreenController() {
    now = DateTime.now(); 
    formattedDate = DateFormat('yyyy-MM-dd').format(now);
  }
}
