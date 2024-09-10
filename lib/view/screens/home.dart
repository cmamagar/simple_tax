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
                          'Welcome 👋',
                          style: CustomTextStyles.f18W600(
                              color: AppColors.textColor1),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Have a nice Day!",
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
                  'What are you looking for?',
                  style: CustomTextStyles.f14W600(color: AppColors.textColor1),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                        imagePath: ImagePath.Incometaxcalc,
                        containerName: "Income Tax",
                        text2: 'Calculator'),
                    CustomContainer(
                        imagePath: ImagePath.Interestcalc,
                        containerName: "Interest Rate",
                        text2: 'Calculator'),
                    CustomContainer(
                        imagePath: ImagePath.Billing,
                        containerName: "Product Billing",
                        text2: 'With Tax')
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Testimonials',
                  style: CustomTextStyles.f14W600(color: AppColors.textColor1),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    SizedBox(width: 5),
                    buildTestimonialCard(
                        name: "James P.",
                        review:
                            "Highly recommend! This calculator simplifies tax deductions and credits with clear explanations—truly a lifesaver during tax season!"),
                    SizedBox(width: 15),
                    buildTestimonialCard(
                        name: "Sarah R.",
                        review:
                            "As someone new to finance, I found this app easy to use for calculating and comparing interest rates. It saved me time and helped me avoid poor deals!")
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
