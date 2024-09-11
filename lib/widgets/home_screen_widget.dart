import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/utils/image_path.dart';

class HomeFirstImageWidget extends StatelessWidget {
  const HomeFirstImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      height: 180,
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
                    "banner".tr,
                    style:
                        CustomTextStyles.f12W600(color: AppColors.textColor1),
                  ),
                  SizedBox(height: 25),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 38,
                    width: 150,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor, // Background color
                      borderRadius:
                          BorderRadius.circular(20), // Circular radius
                    ),
                    child: Center(
                      child: Text(
                        "explore".tr,
                        style: CustomTextStyles.f12W600(
                            color: AppColors.whiteColor),
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
    );
  }
}

class buildTestimonialCard extends StatelessWidget {
  const buildTestimonialCard(
      {super.key, required this.name, required this.review});
  final String name;
  final String review;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        height: 165,
        width: 235,
        decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: AppColors.borderColor),
            boxShadow: [
              BoxShadow(
                  color: AppColors.lGrey, blurRadius: 4, offset: Offset(2, 2))
            ]),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: ClipOval(
                    child: Image.asset(
                      ImagePath.pp,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
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
                        style: CustomTextStyles.f12W600(
                            color: AppColors.textColor1),
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              review,
              style: CustomTextStyles.f12W400(color: AppColors.textColor1),
            ),
          ],
        ));
  }
}
