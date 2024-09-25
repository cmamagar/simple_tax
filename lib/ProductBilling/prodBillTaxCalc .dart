import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/ProductBilling/bill.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/widgets/custom/custom_textfield.dart';
import 'package:simple_tax/widgets/custom/elevated_button.dart';

class Prodbilltaxcalc extends StatelessWidget {
  Prodbilltaxcalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "adding_products".tr, // Changed to match the JSON key
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
                Text(
                  "customer_name".tr, // Changed to match the JSON key
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(
                  height: 7,
                ),
                CustomTextField(
                    hint: "enter_customer_name"
                        .tr, // Changed to match the JSON key
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.name),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "product_name".tr, // Changed to match the JSON key
                            style: CustomTextStyles.f14W600(
                                color: AppColors.borderColor),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          CustomTextField(
                              hint: "enter_product_name"
                                  .tr, // Changed to match the JSON key
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.name),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "product_price".tr, // Changed to match the JSON key
                            style: CustomTextStyles.f14W600(
                                color: AppColors.borderColor),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          CustomTextField(
                              hint: "enter_product_price"
                                  .tr, // Changed to match the JSON key
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.number),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "product_quantity".tr, // Changed to match the JSON key
                      style: CustomTextStyles.f14W600(
                          color: AppColors.borderColor),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                        hint: "enter_product_quantity"
                            .tr, // Changed to match the JSON key
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "discount".tr, // Changed to match the JSON key
                      style: CustomTextStyles.f14W600(
                          color: AppColors.borderColor),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                        hint: "enter_discount"
                            .tr, // Changed to match the JSON key
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "address".tr, // Changed to match the JSON key
                      style: CustomTextStyles.f14W600(
                          color: AppColors.borderColor),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                        hint:
                            "enter_address".tr, // Changed to match the JSON key
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                    title: "add_product".tr, // Changed to match the JSON key
                    onTap: () {
                      Get.to(() => Bill());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
