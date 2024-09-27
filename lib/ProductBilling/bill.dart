import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/bill_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/widgets/bill_screen_widget.dart';

class Bill extends StatelessWidget {
  final c = Get.put(BillScreenController());
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
                      "Date:${c.formattedDate}"
                          .tr, // Replaced with translation key
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
                  height: 15,
                ),
                BillWidget()
                // SizedBox(height: 20),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Text(
                //     "Signature".tr,
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
