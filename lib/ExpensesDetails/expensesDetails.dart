import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/expenses_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:simple_tax/widgets/custom/expenses_screen_widget.dart'; // Import the PieChart package

class ExpensesDetails extends StatelessWidget {
  ExpensesDetails({super.key});

  final ExpensesScreenController controller =
      Get.put(ExpensesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Expenses Details Calculator".tr,
          style: CustomTextStyles.f18W600(color: AppColors.whiteColor),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1.5,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 47,
                width: 250,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColors.secondaryTextColor, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                        ),
                        onPressed: () {},
                        child: Row(
                          // Use Row to place icon and text together
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: AppColors.whiteColor, // Set icon color
                            ),
                            const SizedBox(
                                width: 4), // Add spacing between icon and text
                            Text(
                              "Expenses",
                              style: CustomTextStyles.f16W600(
                                  color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Income",
                        style: CustomTextStyles.f16W600(
                            color: AppColors.textColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              Center(
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: PieChart(
                    PieChartData(
                        centerSpaceRadius: 95,
                        sectionsSpace: 2,
                        borderData: FlBorderData(show: false),
                        sections: _showingSections()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _showingSections() {
    return List.generate(3, (i) {
      final double radius = 45;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.primaryColor,
            value: 34.4,
            title: '',
            radius: radius,
            badgeWidget: donutPieChart(
                iconData: Icons.star, title: '34.4%', color: Colors.white),
            badgePositionPercentageOffset: 0.50, // Adjust the position
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.errorColor,
            value: 14.6,
            title: '',
            radius: radius,
            badgeWidget: donutPieChart(
                iconData: Icons.thumb_up, title: '14.6%', color: Colors.white),
            badgePositionPercentageOffset: 0.50,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.shopping,
            value: 51,
            title: '',
            radius: radius,
            badgeWidget: donutPieChart(
                iconData: Icons.pie_chart, title: '51%', color: Colors.white),
            badgePositionPercentageOffset: 0.50,
          );
        default:
          throw Error();
      }
    });
  }
}
