// lib/screens/interest_calculator.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/interest_screen_controller.dart';
import 'package:simple_tax/l10n/nepali_numbers.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';

class InterestCalculator extends StatelessWidget {
  final controller = Get.put(InterestCalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ('Interest Rate Calculator'),
          style: CustomTextStyles.f18W600(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Principal Amount TextField
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: controller.principalController,
                    style: CustomTextStyles.f12W600(), // Apply text style
                    decoration: InputDecoration(
                      labelText: ('principal_amount'),
                      labelStyle: CustomTextStyles.f12W600(color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      String actualValue = controller.isNepali.value
                          ? convertToEnglishNumber(value ?? '')
                          : value ?? '';

                      if (actualValue.isEmpty) {
                        return ('enter_principal');
                      }
                      if (double.tryParse(actualValue) == null) {
                        return ('enter_principal');
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (controller.isNepali.value) {
                        String nepaliNumber = convertToNepaliNumber(value);
                        controller.principalController.value = TextEditingValue(
                          text: nepaliNumber,
                          selection: TextSelection.collapsed(
                              offset: nepaliNumber.length),
                        );
                      } else {
                        controller.principalController.value = TextEditingValue(
                          text: value,
                          selection:
                              TextSelection.collapsed(offset: value.length),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 16),
                // Interest Rate TextField
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: controller.rateController,
                    style: CustomTextStyles.f12W600(), // Apply text style
                    decoration: InputDecoration(
                      labelText: ('interest_rate'),
                      labelStyle: CustomTextStyles.f12W600(color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      String actualValue = controller.isNepali.value
                          ? convertToEnglishNumber(value ?? '')
                          : value ?? '';
                      if (actualValue.isEmpty) {
                        return ('enter_rate');
                      }
                      if (double.tryParse(actualValue) == null) {
                        return ('enter_rate');
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (controller.isNepali.value) {
                        String nepaliNumber = convertToNepaliNumber(value);
                        controller.rateController.value = TextEditingValue(
                          text: nepaliNumber,
                          selection: TextSelection.collapsed(
                              offset: nepaliNumber.length),
                        );
                      } else {
                        controller.rateController.value = TextEditingValue(
                          text: value,
                          selection:
                              TextSelection.collapsed(offset: value.length),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 16),
                // Time Period TextField with Dropdown
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          controller: controller.timeController,
                          style: CustomTextStyles.f12W600(), // Apply text style
                          decoration: InputDecoration(
                            labelText: ('time_period'),
                            labelStyle:
                                CustomTextStyles.f12W600(color: Colors.black),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            String actualValue = controller.isNepali.value
                                ? convertToEnglishNumber(value ?? '')
                                : value ?? '';
                            if (actualValue.isEmpty) {
                              return ('enter_time');
                            }
                            if (double.tryParse(actualValue) == null) {
                              return ('enter_time');
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (controller.isNepali.value) {
                              String nepaliNumber =
                                  convertToNepaliNumber(value);
                              controller.timeController.value =
                                  TextEditingValue(
                                text: nepaliNumber,
                                selection: TextSelection.collapsed(
                                    offset: nepaliNumber.length),
                              );
                            } else {
                              controller.timeController.value =
                                  TextEditingValue(
                                text: value,
                                selection: TextSelection.collapsed(
                                    offset: value.length),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 110,
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Obx(() => DropdownButton<String>(
                              value: controller.timePeriodType.value,
                              isExpanded: true,
                              items: [
                                DropdownMenuItem(
                                  value: 'Years',
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      ('years'),
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles.f12W600(),
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Months',
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      ('months'),
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles.f12W600(),
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                controller.timePeriodType.value =
                                    value ?? 'Years';
                                controller.isYearly.value = value == 'Years';
                              },
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Calculate Button
                ElevatedButton(
                  onPressed: controller.calculateInterest,
                  child: Text(
                    ('Submit'),
                    style: CustomTextStyles.f12W600(),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
                SizedBox(height: 16),
                // Result
                Obx(() => Text(
                      '${('result')}: ${controller.result.value} ${('currency')}',
                      style: CustomTextStyles.f18W600(),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
