import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/emi_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';

class EmiBill extends StatelessWidget {
  final EmiController emiController = Get.put(EmiController());

  final String loanAmount;
  final String tenureYears;
  final String interestRate;
  final String emiType;

  EmiBill({
    Key? key,
    required this.loanAmount,
    required this.tenureYears,
    required this.interestRate,
    required this.emiType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    emiController.calculateEmi();

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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "emi_month"
                                .tr, // Localized string for "EMI per month"
                            style: CustomTextStyles.f14W400(
                                color: AppColors.whiteColor),
                          ),
                          Text(
                            "EMI: Rs. ${emiController.emiResult.value.toStringAsFixed(2)}", // Display EMI result
                            style: CustomTextStyles.f24W600(
                                color: AppColors.whiteColor),
                          )
                        ],
                      ),
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
                              Text(
                                "Rs ${emiController.loanAmountController.text}",
                                style: CustomTextStyles.f18W600(
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("tenure".tr,
                                  style: CustomTextStyles.f14W400(
                                      color: AppColors.whiteColor)),
                              Text(
                                "${emiController.tenureYearsController.text} Years",
                                style: CustomTextStyles.f18W600(
                                    color: AppColors.whiteColor),
                              ),
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
                              Text(
                                "${emiController.interestRateController.text}%",
                                style: CustomTextStyles.f18W600(
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("emi_type".tr,
                                  style: CustomTextStyles.f14W400(
                                      color: AppColors.whiteColor)),
                              Text(
                                "${emiController.selectedEmiTypeOption.value}",
                                style: CustomTextStyles.f18W600(
                                    color: AppColors.whiteColor),
                              ),
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
                          "Rs ${emiController.totalAmountWithInterest.value.toStringAsFixed(2)}",
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
                          "${emiController.interestRateController.text}%",
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
                          "${(double.tryParse(emiController.interestRateController.text.isEmpty ? "0" : emiController.interestRateController.text) ?? 0) / 12}%",
                          style: CustomTextStyles.f12W600(
                              color: AppColors.secondaryTextColor),
                        )
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
                          "Rs ${emiController.totalInterestAmount.value.toStringAsFixed(2)}",
                          style: CustomTextStyles.f12W600(
                              color: AppColors.secondaryTextColor),
                        )
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
                          "Rs ${(emiController.totalInterestAmount.value / (double.tryParse(emiController.tenureYearsController.text.isEmpty ? "1" : emiController.tenureYearsController.text) ?? 1)).toStringAsFixed(2)}",
                          style: CustomTextStyles.f12W600(
                              color: AppColors.secondaryTextColor),
                        )
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
