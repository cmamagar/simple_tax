import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/income_screen_controller.dart';
import 'package:simple_tax/l10n/nepali_numbers.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/utils/image_path.dart';
import 'package:simple_tax/widgets/custom/custom_textfield.dart';
import 'package:simple_tax/widgets/custom/elevated_button.dart';
import 'package:simple_tax/widgets/income_slab_table_widget.dart';

class IncomeTextFieldWidget extends StatelessWidget {
  const IncomeTextFieldWidget({
    super.key,
    required this.controller,
  });

  final IncomeTaxController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * 1.3,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      ('selectYear').tr, // JSON key for "Select Year"
                      style: CustomTextStyles.f14W600(
                          color: AppColors.borderColor),
                    ),
                    SizedBox(width: 93),
                    Text(
                      ('selectStatus').tr, // JSON key for "Select Status"
                      style: CustomTextStyles.f14W600(
                          color: AppColors.borderColor),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Expanded(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(canvasColor: AppColors.whiteColor),
                        child: Obx(() => DropdownButtonFormField<String>(
                              value: controller.selectedYearOption.value.isEmpty
                                  ? null
                                  : controller.selectedYearOption.value,
                              hint: Text(
                                "Select year",
                                style: CustomTextStyles.f12W400(
                                    color: AppColors.secondaryTextColor),
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 1),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                              ),
                              icon: SvgPicture.asset(
                                ImagePath.textFieldIcon,
                                color: AppColors.borderColor,
                              ),
                              items: controller.yearOptions
                                  .map((option) => DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(option.tr),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.updateSelected(value!);
                              },
                              validator: (value) =>
                                  value == null ? 'Please select a year' : null,
                            )),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(canvasColor: AppColors.whiteColor),
                        child: Obx(() => DropdownButtonFormField<String>(
                              value: controller.selectStatusOption.value.isEmpty
                                  ? null
                                  : controller.selectStatusOption.value,
                              hint: Text(
                                "Select Status",
                                style: CustomTextStyles.f12W400(
                                    color: AppColors.secondaryTextColor),
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 1),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                              ),
                              icon: SvgPicture.asset(
                                ImagePath.textFieldIcon,
                                color: AppColors.borderColor,
                              ),
                              items: controller.statusOptions
                                  .map((option) => DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(option.tr),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.updateSelectedStatus(value!);
                              },
                              validator: (value) => value == null
                                  ? 'Please select a status'
                                  : null,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      ('enterIncome').tr, // JSON key for "Enter Income"
                      style: CustomTextStyles.f14W600(
                          color: AppColors.borderColor),
                    ),
                    SizedBox(width: 75),
                    Text(
                      ('selectTimePeriod')
                          .tr, // JSON key for "Select Time Period"
                      style: CustomTextStyles.f14W600(
                          color: AppColors.borderColor),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hint: "Enter Income",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                        controller: controller.incomeController,
                        validator: (value) {
                          String actualValue = controller.isNepali.value
                              ? convertToEnglishNumber(value ?? '')
                              : value ?? '';

                          if (actualValue.isEmpty) {
                            return 'Please enter income';
                          }
                          if (double.tryParse(actualValue) == null) {
                            return 'Invalid income';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (controller.isNepali.value && value.isNotEmpty) {
                            String nepaliNumber = convertToNepaliNumber(value);
                            if (nepaliNumber !=
                                controller.incomeController.text) {
                              controller.incomeController.text = nepaliNumber;
                              controller.incomeController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: controller
                                        .incomeController.text.length),
                              ); // Move cursor to the end
                            }
                          } else if (!controller.isNepali.value &&
                              value.isNotEmpty) {
                            String englishNumber =
                                convertToEnglishNumber(value);
                            if (englishNumber !=
                                controller.incomeController.text) {
                              controller.incomeController.text = englishNumber;
                              controller.incomeController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: controller
                                        .incomeController.text.length),
                              ); // Move cursor to the end
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(canvasColor: AppColors.whiteColor),
                        child: Obx(() => DropdownButtonFormField<String>(
                              value:
                                  controller.selectYearMonthOption.value.isEmpty
                                      ? null
                                      : controller.selectYearMonthOption.value,
                              hint: Text(
                                "Select Status",
                                style: CustomTextStyles.f12W400(
                                    color: AppColors.secondaryTextColor),
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 1),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                              ),
                              icon: SvgPicture.asset(
                                ImagePath.textFieldIcon,
                                color: AppColors.borderColor,
                              ),
                              items: controller.yearMonthOptions
                                  .map((option) => DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(option.tr),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.updateSelectedYearMonth(value!);
                              },
                              validator: (value) => value == null
                                  ? 'Please select year or months'
                                  : null,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  ('annualAddition')
                      .tr, // JSON key for "Annual Addition (Bonus)"
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                CustomTextField(
                    onChanged: (value) {
                      if (controller.isNepali.value && value.isNotEmpty) {
                        String nepaliNumber = convertToNepaliNumber(value);
                        if (nepaliNumber != controller.bonusController.value) {
                          controller.bonusController.text = nepaliNumber;
                          controller.bonusController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset:
                                      controller.bonusController.text.length));
                        }
                      } else if (!controller.isNepali.value &&
                          value.isNotEmpty) {
                        String englishNumber = convertToEnglishNumber(value);
                        if (englishNumber != controller.bonusController.text) {
                          controller.bonusController.text = englishNumber;
                          controller.bonusController.selection =
                              TextSelection.fromPosition(
                            TextPosition(
                                offset: controller.bonusController.text.length),
                          ); // Move cursor to the end
                        }
                      }
                    },
                    validator: (value) {
                      String actualValue = controller.isNepali.value
                          ? convertToEnglishNumber(value ?? '')
                          : value ?? '';
                      if (actualValue.isEmpty) {
                        return 'Invalid input';
                      }
                      if (double.tryParse(actualValue) == null) {
                        return 'Invalid input';
                      }
                      return null;
                    },
                    controller: controller.bonusController,
                    hint: "Enter Additional Bonus",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number),
                SizedBox(height: 16),
                Text(
                  ('annualDeduction')
                      .tr, // JSON key for "Annual Addition (Bonus)"
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                Text(
                  ('deductionsInfo')
                      .tr, // JSON key for "Annual Addition (Bonus)"
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 7),
                CustomTextField(
                  onChanged: (value) {
                    if (controller.isNepali.value && value.isNotEmpty) {
                      String nepaliNumber = convertToNepaliNumber(value);
                      if (nepaliNumber != controller.deductionController.text) {
                        controller.deductionController.text = nepaliNumber;
                        controller.deductionController.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                              offset:
                                  controller.deductionController.text.length),
                        ); // Move cursor to the end
                      }
                    } else if (!controller.isNepali.value && value.isNotEmpty) {
                      String englishNumber = convertToEnglishNumber(value);
                      if (englishNumber !=
                          controller.deductionController.text) {
                        controller.deductionController.text = englishNumber;
                        controller.deductionController.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                              offset: controller.incomeController.text.length),
                        ); // Move cursor to the end
                      }
                    }
                  },
                  validator: (value) {
                    String actualValue = controller.isNepali.value
                        ? convertToEnglishNumber(value ?? '')
                        : value ?? '';
                    if (actualValue.isEmpty) {
                      return 'Invalid input';
                    }
                    if (double.tryParse(actualValue) == null) {
                      return 'Invalid input';
                    }
                    return null;
                  },
                  hint: "Enter Deductions",
                  controller: controller.deductionController,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Text(
                  "slabs_and_rate".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 20),
                SlabRateTable(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        title: "submit".tr,
                        onTap: () {
                          if (controller.formKey.currentState?.validate() ??
                              false) {
                            controller.calculateTax();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomElevatedButton(
                        title: "reset".tr,
                        onTap: () {
                          if (controller.formKey.currentState?.validate() ??
                              false) {
                            controller
                                .clearFields(); // Assuming a reset method exists in your controller
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(
                  () => Text(
                    controller.result.value,
                    style: CustomTextStyles.f18W600(),
                    textAlign: TextAlign.center,
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
