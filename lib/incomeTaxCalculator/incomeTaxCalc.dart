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

class IncomeTaxCalculator extends StatelessWidget {
  final IncomeTaxController controller = Get.put(IncomeTaxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Income Tax Calculator',
          style: CustomTextStyles.f18W600(color: AppColors.whiteColor),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => DropdownButtonFormField(
                            value: controller.selectedYear.value,
                            decoration: InputDecoration(
                              labelText: ('SelectYear').tr,
                              labelStyle: CustomTextStyles.f16W400(
                                  color: AppColors.secondaryTextColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                            ),
                            icon: SvgPicture.asset(
                              ImagePath.textFieldIcon, // Path to your SVG file
                              height: 20, // Customize the size of the SVG
                              width: 20,
                            ),
                            items: [
                              DropdownMenuItem(
                                value:
                                    'year1', // Use non-translated keys for value
                                child: Text(('year1').tr),
                              ),
                              DropdownMenuItem(
                                value: 'year2',
                                child: Text(('year2').tr),
                              ),
                              DropdownMenuItem<String>(
                                value: 'year3',
                                child: Text(('year3').tr),
                              ),
                            ],
                            onChanged: (newValue) {
                              controller.selectedYear.value = newValue ?? '';
                            },
                            validator: (value) => value == null
                                ? ('selectYearAndStatus').tr
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            value: controller.selectedTaxStatus.value,
                            decoration: InputDecoration(
                              hintText: 'Select Status',
                              hintStyle: CustomTextStyles.f16W400(
                                  color: AppColors.secondaryTextColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                            ),
                            icon: SvgPicture.asset(
                              ImagePath.textFieldIcon, // Path to your SVG file
                              height: 20, // Customize the size of the SVG
                              width: 20,
                            ),
                            items: <String>['Single', 'Married']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.f16W400(),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              controller.selectedTaxStatus.value =
                                  newValue ?? '';
                            },
                            validator: (value) =>
                                value == null ? 'Please select a status' : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hint: "Enter Income",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          controller: TextEditingController(
                              text: controller.income.value),
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
                              String nepaliNumber =
                                  convertToNepaliNumber(value);
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
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            style: CustomTextStyles.f16W400(),
                            value: controller.selectedYear.value,
                            decoration: InputDecoration(
                              hintText: "Time Period",
                              hintStyle: CustomTextStyles.f16W400(
                                  color: AppColors.secondaryTextColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: EdgeInsets.all(16.0),
                            ),
                            icon: SvgPicture.asset(
                              ImagePath.textFieldIcon,
                              height: 20,
                              width: 20,
                            ),
                            items: <String>['Months', 'Years']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              controller.isYearly.value = newValue == 'Years';
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                      onChanged: (value) {
                        if (controller.isNepali.value && value.isNotEmpty) {
                          String nepaliNumber = convertToNepaliNumber(value);
                          if (nepaliNumber != controller.bonus.value) {
                            controller.bonus.value = nepaliNumber;
                          }
                        } else if (!controller.isNepali.value &&
                            value.isNotEmpty) {
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
                          return 'Invalid input';
                        }
                        if (double.tryParse(actualValue) == null) {
                          return 'Invalid input';
                        }
                        return null;
                      },
                      controller:
                          TextEditingController(text: controller.bonus.value),
                      hint: "Enter Additional Bonus",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number),
                  SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) {
                      if (controller.isNepali.value && value.isNotEmpty) {
                        String nepaliNumber = convertToNepaliNumber(value);
                        if (nepaliNumber != controller.deductions.value) {
                          controller.deductions.value = nepaliNumber;
                        }
                      } else if (!controller.isNepali.value &&
                          value.isNotEmpty) {
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
                        return 'Invalid input';
                      }
                      if (double.tryParse(actualValue) == null) {
                        return 'Invalid input';
                      }
                      return null;
                    },
                    hint: "Enter Deductions",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 24),
                  CustomElevatedButton(
                    title: "Submit",
                    onTap: () {
                      if (controller.formKey.currentState?.validate() ??
                          false) {
                        controller.calculateTax();
                      }
                    },
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
      ),
    );
  }
}
