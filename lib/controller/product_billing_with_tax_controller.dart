
import 'package:get/get.dart';
import 'package:simple_tax/model/product.dart';

class ProductController extends GetxController {
  final RxList<Product> _products = <Product>[].obs;
  final RxString _customerName = ''.obs;
  final RxInt _editingIndex = (-1).obs;
  final RxBool _isProceed = false.obs;

  List<Product> get products => _products.toList();
  String get customerName => _customerName.value;
  int get editingIndex => _editingIndex.value;
  bool get isProceed => _isProceed.value;

  void setCustomerName(String name) => _customerName.value = name;

  void addOrUpdateProduct(String name, double rate, int quantity) {
    if (_editingIndex.value == -1) {
      _products.add(Product(name: name, rate: rate, quantity: quantity));
    } else {
      _products[_editingIndex.value] = Product(name: name, rate: rate, quantity: quantity);
      _editingIndex.value = -1;
    }
    _isProceed.value = true;
  }

  void proceed() {
    _isProceed.value = false;
  }

  void editProduct(int index) {
    _editingIndex.value = index;
    setCustomerName(_products[index].name);
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
  }

  void refresh() {
    _customerName.value = '';
    _products.clear();
    _editingIndex.value = -1;
    _isProceed.value = false;
  }

  double calculateSubtotal() {
    double subtotal = 0;
    for (var product in _products) {
      subtotal += product.rate / 1.13 * product.quantity;
    }
    return subtotal;
  }

  double calculateTaxableAmount() {
    return calculateSubtotal();
  }

  double calculateVAT() {
    return calculateTaxableAmount() * 0.13;
  }

  double calculateTotal() {
    double total = 0;
    for (var product in _products) {
      total += (product.rate / 1.13 * product.quantity) * 1.13;
    }
    return total;
  }
}
