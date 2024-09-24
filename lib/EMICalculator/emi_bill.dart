import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';

class EmiBill extends StatelessWidget {
  EmiBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "emi_bill".tr,
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.3,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
                height: 282,
                width: 319,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, top: 18, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "emi_month".tr,
                        style: CustomTextStyles.f14W400(
                            color: AppColors.whiteColor),
                      ),
                      Text("Rs.14,500".tr,
                          style: CustomTextStyles.f24W600(
                              color: AppColors.whiteColor)),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("loan_amount".tr,
                                  style: CustomTextStyles.f14W400(
                                      color: AppColors.whiteColor)),
                              Text("Rs 2,50,000".tr,
                                  style: CustomTextStyles.f18W600(
                                      color: AppColors.whiteColor)),
                            ],
                          ),
                          Column(
                            children: [
                              Text("tenure".tr,
                                  style: CustomTextStyles.f14W400(
                                      color: AppColors.whiteColor)),
                              Text("4 Years".tr,
                                  style: CustomTextStyles.f18W600(
                                      color: AppColors.whiteColor)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Interest Rate (%)".tr,
                                  style: CustomTextStyles.f14W400(
                                      color: AppColors.whiteColor)),
                              Text("12%".tr,
                                  style: CustomTextStyles.f18W600(
                                      color: AppColors.whiteColor)),
                            ],
                          ),
                          Column(
                            children: [
                              Text("emi_type".tr,
                                  style: CustomTextStyles.f14W400(
                                      color: AppColors.whiteColor)),
                              Text("in_advance".tr,
                                  style: CustomTextStyles.f18W600(
                                      color: AppColors.whiteColor)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "total_amount_with_interest".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.borderColor),
                        ),
                        Text(
                          "रु 7,20,000".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "interest_rate_year".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.borderColor),
                        ),
                        Text(
                          "9.2%".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "interest_rate_month".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.borderColor),
                        ),
                        Text(
                          "12%".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "total_interest_amount".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.borderColor),
                        ),
                        Text(
                          "Rs 1,12,000".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "yearly_interest_amount".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.borderColor),
                        ),
                        Text(
                          "Rs 17,000".tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
