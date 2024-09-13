import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/income_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/widgets/income_text_field_widget.dart';

class IncomeTaxCalculator extends StatelessWidget {
  final IncomeTaxController controller = Get.put(IncomeTaxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          ('incomeTaxCalculator').tr,
          style: CustomTextStyles.f18W600(color: AppColors.whiteColor),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        child: incomeTextFieldWidget(controller: controller),
      ),
    );
  }
}
