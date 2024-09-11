import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/product_billing_with_tax_controller.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';

class Prodbilltaxcalc extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 64, 238),
        title: Text(
          'Product Input',
          style: CustomTextStyles.f24W600(color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: controller.refresh,
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Obx(() => TextFormField(
                  initialValue: controller.customerName,
                  decoration: InputDecoration(
                    labelText: 'Customer Name',
                    labelStyle: CustomTextStyles.f16W300(color: Colors.black),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) => controller.setCustomerName(value),
                )),
            SizedBox(height: 25),
            Obx(() => Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Product Name',
                          labelStyle:
                              CustomTextStyles.f16W300(color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) =>
                            controller.addOrUpdateProduct(value, 0, 0),
                      ),
                    ),
                    SizedBox(width: 20, height: 25),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Product Price',
                          labelStyle:
                              CustomTextStyles.f16W300(color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) => controller.addOrUpdateProduct(
                            '', double.tryParse(value) ?? 0, 0),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 25),
            Obx(() => Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Product Quantity',
                          labelStyle:
                              CustomTextStyles.f16W300(color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) => controller.addOrUpdateProduct(
                            '', 0, int.tryParse(value) ?? 0),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 25),
            Obx(() => SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: controller.isProceed
                        ? controller.proceed
                        : () {
                            final productName =
                                ''; // Add logic to get product name
                            final productPrice =
                                0.0; // Add logic to get product price
                            final productQuantity =
                                0; // Add logic to get product quantity
                            controller.addOrUpdateProduct(
                                productName, productPrice, productQuantity);
                          },
                    label: Text(
                      controller.isProceed
                          ? 'Proceed'
                          : controller.editingIndex == -1
                              ? 'Add Product'
                              : 'Update Product',
                      style: CustomTextStyles.f16W600(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 41, 64, 238),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                )),
            SizedBox(height: 20),
            Obx(() {
              if (!controller.isProceed && controller.products.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Added Products:',
                      style: CustomTextStyles.f18W600(color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final product = controller.products[index];
                        return Card(
                          color: Color.fromARGB(255, 41, 64, 238),
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              product.name,
                              style:
                                  CustomTextStyles.f14W400(color: Colors.white),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price: ${product.rate.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Quantity: ${product.quantity}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.edit),
                                  onPressed: () =>
                                      controller.editProduct(index),
                                ),
                                IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.delete),
                                  onPressed: () =>
                                      controller.deleteProduct(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    Table(
                      border: TableBorder.all(color: Colors.black),
                      columnWidths: {
                        0: FlexColumnWidth(4),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(3),
                      },
                      children: [
                        TableRow(
                          children: [
                            TableCell(child: Center(child: Text('Subtotal'))),
                            TableCell(
                                child: Center(child: Text('Taxable Amount'))),
                            TableCell(child: Center(child: Text('VAT (13%)'))),
                            TableCell(child: Center(child: Text('Total'))),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                                child: Center(
                                    child: Text(controller
                                        .calculateSubtotal()
                                        .toStringAsFixed(2)))),
                            TableCell(
                                child: Center(
                                    child: Text(controller
                                        .calculateTaxableAmount()
                                        .toStringAsFixed(2)))),
                            TableCell(
                                child: Center(
                                    child: Text(controller
                                        .calculateVAT()
                                        .toStringAsFixed(2)))),
                            TableCell(
                                child: Center(
                                    child: Text(controller
                                        .calculateTotal()
                                        .toStringAsFixed(2)))),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
