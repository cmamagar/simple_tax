import 'package:get/get.dart';

class BillScreenController extends GetxController {
  // Example list of products
  var _products = <Product>[].obs;

  // Assuming Product is a class with name, rate, and quantity
  void addProduct(String name, double rate, int quantity) {
    _products.add(Product(name: name, rate: rate, quantity: quantity));
  }

  // You can add more methods for subtotal, tax calculation, etc.
}

class Product {
  String name;
  double rate;
  int quantity;

  Product({required this.name, required this.rate, required this.quantity});
}
