import 'package:flutter/material.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';

Widget CustomContainer(
    {required String imagePath, required String containerName, required String text2}) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 102,
      height: 106,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 44, height: 44),
          SizedBox(height: 10),
          Center(
            child: Text(
              containerName,
              style: CustomTextStyles.f10W400(color: AppColors.textColor1),
            ),
          ),
          Center(
            child: Text(
              text2,
              style: CustomTextStyles.f10W400(color: AppColors.textColor1),
            ),
          ),
        ],
      ),
    ),
  );
}
