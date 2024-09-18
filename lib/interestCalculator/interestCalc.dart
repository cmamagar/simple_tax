import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/interest_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/widgets/custom/custom_textfield.dart';
import 'package:simple_tax/widgets/custom/elevated_button.dart';

class Interestcalc extends StatelessWidget {
  final InterestCalculatorController controller =
      Get.put(InterestCalculatorController());

  Interestcalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Interest Rate Calculator'.tr,
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
        height: MediaQuery.of(context).size.height * 1.3,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Principal Amount'.tr,
                style: CustomTextStyles.f14W600(color: AppColors.borderColor),
              ),
              SizedBox(height: 7),
              CustomTextField(
                hint: 'Enter Principal'.tr,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                controller: controller.principalController,
              ),
              SizedBox(height: 20),
              Text(
                'Interest Rate (%)'.tr,
                style: CustomTextStyles.f14W600(color: AppColors.borderColor),
              ),
              SizedBox(height: 7),
              CustomTextField(
                hint: 'Enter Interest Rate'.tr,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                controller: controller.rateController,
              ),
              SizedBox(height: 20),
              Text(
                'Time Period'.tr,
                style: CustomTextStyles.f14W600(color: AppColors.borderColor),
              ),
              SizedBox(height: 7),
              CustomTextField(
                hint: 'Enter Time Period'.tr,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                controller: controller.timeController,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      title: 'reset'.tr,
                      textColor: AppColors.whiteColor,
                      onTap: controller.onClose,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomElevatedButton(
                      title: 'submit'.tr,
                      textColor: AppColors.whiteColor,
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller
                              .calculateInterest(); // Perform interest calculation
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Display the result
              Obx(() {
                return Text(
                  controller.result.value.isEmpty
                      ? ''
                      : 'Calculated Interest: ${controller.result.value}'.tr,
                  style:
                      CustomTextStyles.f16W600(color: AppColors.primaryColor),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
