import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/SavingGoalCalc/result_page.dart';
import 'package:simple_tax/controller/saving_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/widgets/custom/custom_textfield.dart';
import 'package:simple_tax/widgets/custom/elevated_button.dart';

class SavingGoalCalc extends StatelessWidget {
  SavingGoalCalc({super.key});
  final controller = Get.put(SavingScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Saving Goal Calc".tr,
          style: CustomTextStyles.f24W600(color: AppColors.whiteColor),
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
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * 1.3,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Interest Rate Section
                Text('Interest Rates, (%)',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    // Interest Rate Input Field
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(() => TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Rate(%)',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    double? rate = double.tryParse(value);
                                    if (rate != null) {
                                      controller.interestRate.value = rate;
                                    }
                                  },
                                  controller: TextEditingController(
                                    text: controller.interestRate.value
                                        .toString(),
                                  ),
                                )),
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_drop_up),
                                onPressed: controller.incrementRate,
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: controller.decrementRate,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    // Interest Type Dropdown
                    Expanded(
                      flex: 1,
                      child: Obx(() => DropdownButton<String>(
                            value: controller.interestType.value,
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.interestType.value = newValue;
                              }
                            },
                            items: controller.interestTypes
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Period Section
                Text('Period:', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    // Period Input Field
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(() => TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Period',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    int? period = int.tryParse(value);
                                    if (period != null) {
                                      controller.period.value = period;
                                    }
                                  },
                                  controller: TextEditingController(
                                    text: controller.period.value.toString(),
                                  ),
                                )),
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_drop_up),
                                onPressed: controller.incrementPeriod,
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: controller.decrementPeriod,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    // Period Type Dropdown
                    Expanded(
                      flex: 1,
                      child: Obx(() => DropdownButton<String>(
                            value: controller.periodType.value,
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.periodType.value = newValue;
                              }
                            },
                            items: controller.periodTypes
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ),
                  ],
                ),
              ],
            ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     // Customer Name
            //     Text("Initial Amount".tr,
            //         style:
            //             CustomTextStyles.f14W600(color: AppColors.borderColor)),
            //     SizedBox(height: 7),
            //     CustomTextField(
            //         hint: "initail_amount".tr,
            //         textInputAction: TextInputAction.done,
            //         textInputType: TextInputType.name),
            //     SizedBox(height: 20),

            //     // Product Name
            //     Text("Monthly Contribution".tr,
            //         style:
            //             CustomTextStyles.f14W600(color: AppColors.borderColor)),
            //     SizedBox(height: 7),
            //     CustomTextField(
            //         hint: "Monthly".tr,
            //         textInputAction: TextInputAction.done,
            //         textInputType: TextInputType.name),
            //     SizedBox(height: 20),

            //     // Product Price
            //     Text("Interest Rate %".tr,
            //         style:
            //             CustomTextStyles.f14W600(color: AppColors.borderColor)),
            //     SizedBox(height: 7),
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 8.0),
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //             color: AppColors.borderColor), // Light grey border
            //         borderRadius: BorderRadius.circular(5.0), // Rounded corners
            //       ),
            //       child: Row(
            //         children: [
            //           // Text field for "Rate (%)"
            //           Expanded(
            //             child: TextField(
            //               decoration: InputDecoration(
            //                 hintText: 'Rate %',
            //                 hintStyle: CustomTextStyles.f12W400(
            //                     color: AppColors.secondaryTextColor),
            //                 border: InputBorder.none, // Removes default border
            //               ),
            //               keyboardType: TextInputType.number,
            //             ),
            //           ),
            //           // Up/down arrow buttons
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment
            //                 .center, // Centers icons vertically
            //             children: [
            //               SizedBox(
            //                 width: 14.78, // Set width
            //                 height: 14.78, // Set height
            //                 child: Icon(
            //                   Icons.arrow_drop_up,
            //                   color: Colors.grey,
            //                   size: 25, // Icon size
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 14.78, // Set width
            //                 height: 14.78, // Set height
            //                 child: Icon(
            //                   Icons.arrow_drop_down,
            //                   color: Colors.grey,
            //                   size: 25, // Icon size
            //                 ),
            //               ),
            //             ],
            //           ),
            //           SizedBox(
            //               width:
            //                   8.0), // Space between icons and the next element

            //           // Blue Container to mimic the "Annual" button
            //           Container(
            //             padding: EdgeInsets.symmetric(
            //                 vertical: 16.0, horizontal: 50.0),
            //             decoration: BoxDecoration(
            //               color: Colors.blue, // Blue color for the container
            //               borderRadius: BorderRadius.circular(5.0),
            //             ),
            //             child: Text(
            //               'Annual',
            //               style: CustomTextStyles.f12W400(
            //                   color: Colors.white), // White text
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(height: 20),
            //     Text("Period",
            //         style:
            //             CustomTextStyles.f14W600(color: AppColors.borderColor)),
            //     SizedBox(
            //       height: 7,
            //     ),
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 5.0),
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //             color: AppColors.borderColor), // Light grey border
            //         borderRadius: BorderRadius.circular(8.0), // Rounded corners
            //       ),
            //       child: Row(
            //         children: [
            //           // Text field for "Rate (%)"
            //           Expanded(
            //             child: TextField(
            //               decoration: InputDecoration(
            //                 hintText: 'Period',
            //                 hintStyle: CustomTextStyles.f12W400(
            //                     color: AppColors.secondaryTextColor),
            //                 border: InputBorder.none, // Removes default border
            //               ),
            //               keyboardType: TextInputType.number,
            //             ),
            //           ),
            //           // Up/down arrow buttons
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment
            //                 .center, // Centers icons vertically
            //             children: [
            //               SizedBox(
            //                 width: 14.78, // Set width
            //                 height: 14.78, // Set height
            //                 child: Icon(
            //                   Icons.arrow_drop_up,
            //                   color: Colors.grey,
            //                   size: 25, // Icon size
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 14.78, // Set width
            //                 height: 14.78, // Set height
            //                 child: Icon(
            //                   Icons.arrow_drop_down,
            //                   color: Colors.grey,
            //                   size: 25, // Icon size
            //                 ),
            //               ),
            //             ],
            //           ),
            //           SizedBox(
            //               width:
            //                   8.0), // Space between icons and the next element

            //           // Blue Container to mimic the "Annual" button
            //           Container(
            //             padding: EdgeInsets.symmetric(
            //                 vertical: 15.0, horizontal: 50.0),
            //             decoration: BoxDecoration(
            //               color: Colors.blue, // Blue color for the container
            //               borderRadius: BorderRadius.circular(5.0),
            //             ),
            //             child: Text(
            //               'Years',
            //               style: CustomTextStyles.f12W400(
            //                   color: Colors.white), // White text
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),

            //     SizedBox(
            //       height: 20,
            //     ),

            //     SizedBox(height: 20),
            //     CustomElevatedButton(
            //         title: "submit".tr,
            //         onTap: () {
            //           Get.to(() => ResultPage());
            //         })
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
