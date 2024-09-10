import 'package:flutter/material.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/utils/image_path.dart';
import 'package:simple_tax/widgets/custom/custom_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome 👋',
                  style: CustomTextStyles.f14W600(color: AppColors.textColor1),
                ),
                SizedBox(height: 5),
                Text(
                  "Have a nice Day!",
                  style: CustomTextStyles.f12W600(color: AppColors.textColor),
                ),
              ],
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.language, color: AppColors.textColor),
              onSelected: (String value) {
                if (value == 'en') {
                  onLocaleChange(Locale('en'));
                } else if (value == 'ne') {
                  onLocaleChange(Locale('ne'));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'en',
                  child: Text(
                    'English',
                    style: CustomTextStyles.f12W600(color: AppColors.textColor),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'ne',
                  child: Text(
                    'नेपाली',
                    style: CustomTextStyles.f12W600(color: AppColors.textColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 142,
                width: 341,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.secondaryTextColor,
                      blurRadius: 4,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Simplify Your Finances with Instant Tax, Rate, and Billing Solutions.',
                              style: CustomTextStyles.f12W600(color: AppColors.textColor1),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 22,
                              width: 75,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor, // Background color
                                borderRadius: BorderRadius.circular(10), // Circular radius
                              ),
                              child: Center(
                                child: Text(
                                  "Explore",
                                  style: CustomTextStyles.f12W600(color: AppColors.whiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Image.asset(
                        ImagePath.first, // Ensure this path is correct
                        height: 105,
                        width: 108,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'What are you looking for?',
                style: CustomTextStyles.f14W600(color: AppColors.textColor1),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainer(imagePath: ImagePath.Incometaxcalc, containerName: "Income Tax", text2: 'Calculator'),
                  CustomContainer(imagePath: ImagePath.Interestcalc, containerName: "Interest Rate", text2: 'Calculator'),
                  CustomContainer(imagePath: ImagePath.Billing, containerName: "Product Billing", text2: 'With Tax')
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Testimonials',
                style: CustomTextStyles.f12W600(color: AppColors.textColor1),
              ),
              SizedBox(height: 8),
              _buildTestimonialCard('James P.',
                  'Highly recommend! This calculator made tax deductions and credits simple with clear explanations. A real lifesaver for tax season!'),
              SizedBox(height: 8),
              _buildTestimonialCard('Sarah R.',
                  'As someone with little financial knowledge, I was worried about understanding interest rates. This app simplifies everything, making it easy to calculate and compare. It’s saved me time and helped me avoid bad deals!'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialCard(String name, String review) {
    return Card(
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 53,
              width: 55,
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://feji.us/k18l6u'),
                radius: 27.5, // Radius is half of the height or width
              ),
            ),
            SizedBox(width: 30),
            // Column for name and star rating
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: CustomTextStyles.f12W600(color: AppColors.textColor1),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber,
                      );
                    }),
                  ),
                  SizedBox(height: 8),
                  // Review text
                  Text(
                    review,
                    style: CustomTextStyles.f12W400(color: AppColors.textColor1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // This function needs to be implemented to handle locale change
  void onLocaleChange(Locale locale) {
    // Implement the logic to change the locale in your app
    // You might use a localization library like GetX, Provider, or Flutter's built-in localization.
  }
}
