import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/ExpensesDetails/incomeDetails.dart';
import 'package:simple_tax/controller/expenses_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:simple_tax/utils/image_path.dart';
import 'package:simple_tax/widgets/custom/expenses_screen_widget.dart';
import 'package:simple_tax/widgets/expenses_widget.dart';

class ExpensesDetails extends StatefulWidget {
  ExpensesDetails({super.key});

  @override
  _ExpensesDetailsState createState() => _ExpensesDetailsState();
}

class _ExpensesDetailsState extends State<ExpensesDetails> {
  final ExpensesScreenController controller =
      Get.put(ExpensesScreenController());

  bool isExpensesSelected = true; // Track selected button

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
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 47,
                  width: 270,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.secondaryTextColor, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              isExpensesSelected
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isExpensesSelected = true;
                            });
                          },
                          child: Row(
                            children: [
                              if (isExpensesSelected)
                                Icon(
                                  Icons.shopping_cart,
                                  color: AppColors.whiteColor,
                                ),
                              const SizedBox(width: 4),
                              Text(
                                "Expenses",
                                style: CustomTextStyles.f16W600(
                                  color: isExpensesSelected
                                      ? AppColors.whiteColor
                                      : AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Income Button
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              !isExpensesSelected
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isExpensesSelected = false;
                            });
                            Get.to(() => Incomedetails());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!isExpensesSelected)
                                Image.asset(
                                  ImagePath.income,
                                  color: AppColors.whiteColor,
                                  height: 20,
                                  width: 20,
                                ),
                              const SizedBox(width: 4),
                              Text(
                                "Income",
                                style: CustomTextStyles.f16W600(
                                  color: !isExpensesSelected
                                      ? AppColors.whiteColor
                                      : AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 35),
              // Pie Chart Section
              Center(
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: PieChart(
                    PieChartData(
                      centerSpaceRadius: 95,
                      sectionsSpace: 2,
                      borderData: FlBorderData(show: false),
                      sections: _showingSections(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Expenses",
                style: CustomTextStyles.f24W600(color: AppColors.textColor),
              ),
              SizedBox(
                height: 20,
              ),
              ExpensesWidget(
                icon: Icons.shopping_bag,
                name: "Shopping",
                amount: "51",
                colors: Colors.amber,
              ),
              SizedBox(
                height: 20,
              ),
              ExpensesWidget(
                icon: Icons.travel_explore,
                name: "Travel",
                amount: "51",
                colors: Colors.blue,
              ),
              SizedBox(
                height: 20,
              ),
              ExpensesWidget(
                  icon: Icons.food_bank,
                  name: "Food",
                  amount: "51",
                  colors: Colors.red)
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: Icon(
          Icons.add,
          color: AppColors.whiteColor,
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
