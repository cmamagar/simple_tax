import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simple_tax/controller/home_screen_controller.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/utils/image_path.dart';
import 'package:simple_tax/widgets/custom/custom_container.dart';
import 'package:simple_tax/widgets/home_screen_widget.dart';

class HomePage extends StatelessWidget {
  final c = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'welcome'.tr, // Use the localized string
                          style: CustomTextStyles.f18W600(
                              color: AppColors.textColor1),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "have_a_nice_day".tr, // Use the localized string
                          style: CustomTextStyles.f12W600(
                              color: AppColors.textColor),
                        ),
                      ],
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.language, color: AppColors.textColor),
                      onSelected: (String value) {
                        if (value == 'en') {
                          c.onLocaleChange(Locale('en'));
                        } else if (value == 'ne') {
                          c.onLocaleChange(Locale('ne'));
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
                              SizedBox(width: 8),
                              Text(
                                'English',
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
                              SizedBox(width: 8),
                              Text(
                                'नेपाली',
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
                HomeFirstImageWidget(),
                SizedBox(height: 16),
                Text(
                  'what_are_you_looking_for'.tr, // Use the localized string
                  style: CustomTextStyles.f14W600(color: AppColors.textColor1),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                        imagePath: ImagePath.Incometaxcalc,
                        containerName: "income_tax_calculator".tr, // Localized
                        text2: 'Calculator'),
                    CustomContainer(
                        imagePath: ImagePath.Interestcalc,
                        containerName: "interest_rate_calculator".tr, // Localized
                        text2: 'Calculator'),
                    CustomContainer(
                        imagePath: ImagePath.Billing,
                        containerName: "product_billing_with_tax".tr, // Localized
                        text2: 'With Tax')
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'testimonials'.tr, // Localized
                  style: CustomTextStyles.f14W600(color: AppColors.textColor1),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    SizedBox(width: 5),
                    buildTestimonialCard(
                        name: "James P.",
                        review: "testimonial_james".tr), // Localized
                    SizedBox(width: 15),
                    buildTestimonialCard(
                        name: "Sarah R.",
                        review: "testimonial_sarah".tr), // Localized
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
