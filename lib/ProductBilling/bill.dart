import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Invoice".tr, // Replaced with translation key
                    style:
                        CustomTextStyles.f32W600(color: AppColors.primaryColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bill No:".tr, // Replaced with translation key
                      style: CustomTextStyles.f12W600(
                          color: AppColors.borderColor),
                    ),
                    Text(
                      "Date:".tr, // Replaced with translation key
                      style: CustomTextStyles.f12W600(
                          color: AppColors.borderColor),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                Text(
                  "Vat no:".tr, // Replaced with translation key
                  style: CustomTextStyles.f12W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 8),
                Text(
                  "Name of Buyers:".tr, // Replaced with translation key
                  style: CustomTextStyles.f12W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 8),
                Text(
                  "Address:".tr, // Replaced with translation key
                  style: CustomTextStyles.f12W600(color: AppColors.borderColor),
                ),

                SizedBox(
                  height: 30,
                ),
                Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: FixedColumnWidth(34.0),
                    1: FixedColumnWidth(55.0),
                    2: FixedColumnWidth(85.0),
                    3: FixedColumnWidth(38.0),
                    4: FixedColumnWidth(50.0),
                    5: FixedColumnWidth(70.0),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('S.N'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'HS Code'.tr, // Replaced with translation key
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Particulars'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Oty.'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Rate.'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Amount.'.tr,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Signature".tr,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
