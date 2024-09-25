import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/EMICalculator/emi_bill.dart';
import 'package:simple_tax/controller/emi_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/widgets/custom/custom_textfield.dart';
import 'package:simple_tax/widgets/custom/elevated_button.dart';

class Emicalc extends StatelessWidget {
  final EmiController emiController = Get.put(EmiController());
  Emicalc({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "emi_calculator".tr,
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
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "loan_amount".tr,
                style: CustomTextStyles.f14W600(color: AppColors.borderColor),
              ),
              SizedBox(height: 7),
              CustomTextField(
                  controller:
                      emiController.loanAmountController, // Use the controller
                  hint: "loan_amount".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number),
              SizedBox(height: 20),
              Text(
                "tenure_years".tr,
                style: CustomTextStyles.f14W600(color: AppColors.borderColor),
              ),
              SizedBox(height: 7),
              CustomTextField(
                  controller:
                      emiController.tenureYearsController, // Use the controller
                  hint: "Year".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number),
              SizedBox(height: 20),
              Text(
                "Interest Rate (%)".tr,
                style: CustomTextStyles.f14W600(color: AppColors.borderColor),
              ),
              SizedBox(height: 7),
              CustomTextField(
                  controller: emiController
                      .interestRateController, // Use the controller
                  hint: "rate(%)".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number),
              SizedBox(height: 20),
              Text(
                "emi_type".tr,
                style: CustomTextStyles.f14W600(color: AppColors.borderColor),
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: emiController
                            .emiAdvanceController, // Use the controller
                        hint: "in_advance".tr,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.name),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomTextField(
                        controller: emiController
                            .emiArrearsController, // Use the controller
                        hint: "in_arrears".tr,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.name),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomElevatedButton(
                  title: "submit".tr,
                  onTap: () {
                    Get.to(() => EmiBill(
                          loanAmount: emiController.loanAmountController.text,
                          tenureYears: emiController.tenureYearsController.text,
                          interestRate:
                              emiController.interestRateController.text,
                          emiAdvance: emiController
                              .emiAdvanceController.text, // Add this if needed
                          emiArrears: emiController
                              .emiArrearsController.text, // Add this if needed
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
