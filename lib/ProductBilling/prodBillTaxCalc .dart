import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/widgets/custom/custom_textfield.dart';

class Prodbilltaxcalc extends StatelessWidget {
  Prodbilltaxcalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Adding Products",
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customer Name",
                style: CustomTextStyles.f14W600(color: AppColors.borderColor),
              ),
              SizedBox(
                height: 07,
              ),
              CustomTextField(
                  hint: "Enter Customer Name",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Name",
                          style: CustomTextStyles.f14W600(
                              color: AppColors.borderColor),
                        ),
                        SizedBox(
                          height: 07,
                        ),
                        CustomTextField(
                            hint: "Enter Product Name",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.name),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Price",
                          style: CustomTextStyles.f14W600(
                              color: AppColors.borderColor),
                        ),
                        SizedBox(
                          height: 07,
                        ),
                        CustomTextField(
                            hint: "Enter Product Price",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.number),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
