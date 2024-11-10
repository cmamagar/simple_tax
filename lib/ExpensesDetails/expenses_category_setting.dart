import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/widgets/expenses_settings.dart';

class ExpensesCategorySetting extends StatelessWidget {
  ExpensesCategorySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Category Settings",
          style: CustomTextStyles.f18W600(color: AppColors.whiteColor),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1.3,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
        ),
        child: Wrap(
          children: [
            ExpensesSettings(
              icon: Icons.shopping_bag,
              name: "Shopping",
              colors: Colors.amber,
            ),
            ExpensesSettings(
              icon: Icons.food_bank,
              name: "Food",
              colors: Colors.red,
            ),
            ExpensesSettings(
                icon: Icons.travel_explore,
                name: "Travel",
                colors: AppColors.primaryColor),
            ExpensesSettings(
                icon: Icons.document_scanner,
                name: "Eduction",
                colors: Colors.green),
            ExpensesSettings(
                icon: Icons.car_rental, name: "Car", colors: Colors.brown),
            ExpensesSettings(
                icon: Icons.car_crash,
                name: "Car",
                colors: Color.fromARGB(255, 250, 189, 210)),
            ExpensesSettings(
                icon: Icons.car_crash,
                name: "Car",
                colors: Color.fromARGB(255, 86, 9, 36))
          ],
        ),
      ),
    );
  }
}
