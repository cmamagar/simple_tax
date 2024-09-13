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

class incomeTextFieldWidget extends StatelessWidget {
  const incomeTextFieldWidget({
    super.key,
    required this.controller,
  });

  final IncomeTaxController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * 1.18,
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
                    SizedBox(
                      width: 93,
                    ),
                    Text(
                      ('selectStatus').tr, // JSON key for "Select Status"
                      style: CustomTextStyles.f14W600(
                          color: AppColors.borderColor),
                    ),
                  ],
                ),
                SizedBox(height: 2),
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
                    SizedBox(
                      width: 75,
                    ),
                    Text(
                      ('selectTimePeriod')
                          .tr, // JSON key for "Select Time Period"
                      style: CustomTextStyles.f14W600(
                          color: AppColors.borderColor),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hint: ('enterIncome').tr, // JSON key for "Enter Income"
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                        controller: TextEditingController(
                            text: controller.income.value),
                        validator: (value) {
                          String actualValue = controller.isNepali.value
                              ? convertToEnglishNumber(value ?? '')
                              : value ?? '';

                          if (actualValue.isEmpty) {
                            return ('enterIncome')
                                .tr; // JSON key for "Please enter income"
                          }
                          if (double.tryParse(actualValue) == null) {
                            return ('invalidIncome')
                                .tr; // JSON key for "Invalid income"
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (controller.isNepali.value && value.isNotEmpty) {
                            String nepaliNumber = convertToNepaliNumber(value);
                            if (nepaliNumber != controller.income.value) {
                              controller.income.value = nepaliNumber;
                            }
                          } else if (!controller.isNepali.value &&
                              value.isNotEmpty) {
                            String englishNumber =
                                convertToEnglishNumber(value);
                            if (englishNumber != controller.income.value) {
                              controller.income.value = englishNumber;
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
                              "Select option",
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
                    ))
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  ('annualAddition')
                      .tr, // JSON key for "Annual Addition (Bonus)"
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 2),
                CustomTextField(
                  hint: ('enterAdditionalBonus')
                      .tr, // JSON key for "Enter Additional Bonus"
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  controller:
                      TextEditingController(text: controller.bonus.value),
                  onChanged: (value) {
                    if (controller.isNepali.value && value.isNotEmpty) {
                      String nepaliNumber = convertToNepaliNumber(value);
                      if (nepaliNumber != controller.bonus.value) {
                        controller.bonus.value = nepaliNumber;
                      }
                    } else if (!controller.isNepali.value && value.isNotEmpty) {
                      String englishNumber = convertToEnglishNumber(value);
                      if (englishNumber != controller.bonus.value) {
                        controller.bonus.value = englishNumber;
                      }
                    }
                  },
                  validator: (value) {
                    String actualValue = controller.isNepali.value
                        ? convertToEnglishNumber(value ?? '')
                        : value ?? '';
                    if (actualValue.isEmpty) {
                      return ('invalidInput')
                          .tr; // JSON key for "Invalid input"
                    }
                    if (double.tryParse(actualValue) == null) {
                      return ('invalidInput')
                          .tr; // JSON key for "Invalid input"
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  ('annualDeduction').tr, // JSON key for "Annual Deduction"
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(height: 2),
                Text(
                  ('deductionsInfo')
                      .tr, // JSON key for "(EPF+SSF+CIT+insurance)"
                  style: CustomTextStyles.f12W400(
                      color: AppColors.secondaryTextColor),
                ),
                SizedBox(height: 2),
                CustomTextField(
                  hint:
                      ('enterDeductions').tr, // JSON key for "Enter Deductions"
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  controller:
                      TextEditingController(text: controller.deductions.value),
                  onChanged: (value) {
                    if (controller.isNepali.value && value.isNotEmpty) {
                      String nepaliNumber = convertToNepaliNumber(value);
                      if (nepaliNumber != controller.deductions.value) {
                        controller.deductions.value = nepaliNumber;
                      }
                    } else if (!controller.isNepali.value && value.isNotEmpty) {
                      String englishNumber = convertToEnglishNumber(value);
                      if (englishNumber != controller.deductions.value) {
                        controller.deductions.value = englishNumber;
                      }
                    }
                  },
                  validator: (value) {
                    String actualValue = controller.isNepali.value
                        ? convertToEnglishNumber(value ?? '')
                        : value ?? '';
                    if (actualValue.isEmpty) {
                      return ('invalidInput')
                          .tr; // JSON key for "Invalid input"
                    }
                    if (double.tryParse(actualValue) == null) {
                      return ('invalidInput')
                          .tr; // JSON key for "Invalid input"
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "slabs_and_rate".tr,
                  style: CustomTextStyles.f14W600(color: AppColors.borderColor),
                ),
                SizedBox(
                  height: 20,
                ),
                SlabRateTable(),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "effective_tax_rate".tr,
                        style: CustomTextStyles.f14W600(),
                      ),
                      Text(
                        "amount_in_hand".tr,
                        style: CustomTextStyles.f14W600(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
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
                                .result(); // Assuming a reset method exists in your controller
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
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
