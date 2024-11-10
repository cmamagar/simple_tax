import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/expenses_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/utils/image_path.dart';
import 'package:simple_tax/widgets/expenses_widget.dart';

class ExpensesDetailsScreen extends StatelessWidget {
  ExpensesDetailsScreen({super.key});
  final controller = Get.put(ExpensesScreenController());

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
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 55,
                  width: 258,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.secondaryTextColor, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTabButton('Expense', 0),
                      buildTabButton('Income', 1),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  switch (controller.selectedIndex.value) {
                    case 0:
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 28),
                            Center(
                              child: AspectRatio(
                                aspectRatio: 1.3,
                                child: PieChart(
                                  PieChartData(
                                    centerSpaceRadius: 95,
                                    sectionsSpace: 2,
                                    borderData: FlBorderData(show: false),
                                    sections: controller.showingSections(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Expenses",
                              style: CustomTextStyles.f18W600(
                                  color: AppColors.textColor),
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
                              icon: Icons.travel_explore_outlined,
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
                                colors: Colors.red),
                          ],
                        ),
                      );
                    case 1:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            height: 204,
                            width: 353,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Total Balance",
                                    style: CustomTextStyles.f18W600(
                                        color: AppColors.whiteColor),
                                  ),
                                  SizedBox(
                                      height:
                                          10), // Adds space between the texts
                                  Text(
                                    "Rs 6,890,000",
                                    style: CustomTextStyles.f24W600(
                                        color: AppColors.whiteColor),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: AppColors.whiteColor,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons
                                                  .arrow_downward, // Use an icon that fits the context, e.g., money_off for expenses
                                              color: AppColors.lGrey,
                                              size: 24,
                                            ),
                                          ),

                                          SizedBox(
                                              width:
                                                  8), // Space between the icon and text
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Expenses",
                                                style: CustomTextStyles.f12W400(
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                              Text(
                                                "Rs - 1,190,000",
                                                style: CustomTextStyles.f12W600(
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height:
                                                35, // Size of the circular background
                                            width: 35,
                                            decoration: BoxDecoration(
                                              color: AppColors
                                                  .whiteColor, // Background color
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons
                                                  .arrow_upward, // Use an appropriate icon for income
                                              color:
                                                  AppColors.lGrey, // Icon color
                                              size: 24, // Icon size
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  8), // Space between the icon and text
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Income",
                                                style: CustomTextStyles.f12W400(
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                              Text(
                                                "Rs 3,900,000",
                                                style: CustomTextStyles.f12W600(
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "Income",
                            style: CustomTextStyles.f18W600(
                                color: AppColors.textColor),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ExpensesWidget(
                              icon: Icons.shopping_bag,
                              name: "Shopping",
                              amount: "51",
                              colors: Colors.amber),
                          SizedBox(
                            height: 20,
                          ),
                          ExpensesWidget(
                              icon: Icons.subscriptions,
                              name: "Subscriptions",
                              amount: "51",
                              colors: AppColors.primaryColor),
                          SizedBox(
                            height: 20,
                          ),
                          ExpensesWidget(
                              icon: Icons.food_bank,
                              name: "Food",
                              amount: "100",
                              colors: Colors.red)
                        ],
                      );
                    default:
                      return Container();
                  }
                }),
              )
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

  Widget buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(vertical: 11.5, horizontal: 22.0),
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? AppColors.primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              // Show icon for Expense tab when selected
              if (controller.selectedIndex.value == index && title == 'Expense')
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 18,
                ),
              // Show icon for Income tab when selected
              if (controller.selectedIndex.value == index && title == 'Income')
                Image.asset(
                  ImagePath.income,
                  color: AppColors.whiteColor,
                  height: 18,
                  width: 18,
                ),
              SizedBox(width: 10), // Spacing between icon and text
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  color: controller.selectedIndex.value == index
                      ? AppColors.whiteColor
                      : AppColors.textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
