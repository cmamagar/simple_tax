import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/home_screen_controller.dart';
import 'package:simple_tax/incomeTaxCalculator/incomeTaxCalc.dart';
import 'package:simple_tax/interestCalculator/interestCalc.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/utils/image_path.dart';
import 'package:simple_tax/widgets/custom/custom_container.dart';
import 'package:simple_tax/widgets/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  final c = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'welcome'.tr,
                          style: CustomTextStyles.f18W600(
                              color: AppColors.textColor1),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'have_a_nice_day'.tr,
                          style: CustomTextStyles.f12W600(
                              color: AppColors.textColor),
                        ),
                      ],
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.language, color: AppColors.textColor),
                      onSelected: (String value) {
                        if (value == 'en') {
                          Get.updateLocale(Locale('en'));
                        } else if (value == 'ne') {
                          Get.updateLocale(Locale('ne'));
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'en',
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/flags/usa.svg',
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'english_language'.tr,
                                style: CustomTextStyles.f12W600(
                                    color: AppColors.textColor),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'ne',
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/flags/nepal.svg',
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'nepali_lanaguage'.tr,
                                style: CustomTextStyles.f12W600(
                                    color: AppColors.textColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              HomeFirstImageWidget(),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 7, bottom: 14),
                child: Text(
                  'what_are_you_looking_for'.tr,
                  style: CustomTextStyles.f14W600(color: AppColors.textColor1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => IncomeTaxCalculator());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.Incometaxcalc,
                          containerName: "income_tax".tr,
                          text2: 'calculator'.tr,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => InterestCalculator());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.Interestcalc,
                          containerName: "interest_rate".tr,
                          text2: 'calculator'.tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => IncomeTaxCalculator());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.Billing,
                          containerName: "product_billing".tr,
                          text2: 'with_tax'.tr,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(() => InterestCalculator());
                        },
                        child: CustomContainer(
                          imagePath: ImagePath.Billing,
                          containerName: "product_billing".tr,
                          text2: 'with_tax'.tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 12),
                child: Text(
                  'testimonials'.tr,
                  style: CustomTextStyles.f14W600(color: AppColors.textColor1),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  SizedBox(width: 5),
                  buildTestimonialCard(
                      name: "james_p".tr, review: "testimonial_james".tr),
                  SizedBox(width: 15),
                  buildTestimonialCard(
                      name: "sara_r".tr, review: "testimonial_sarah".tr),
                  SizedBox(width: 15),
                  buildTestimonialCard(
                      name: "sara_r".tr, review: "testimonial_sarah".tr),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
