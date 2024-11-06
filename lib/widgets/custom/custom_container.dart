import 'package:flutter/material.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';

Widget CustomContainer(
    {required String imagePath,
    required String containerName,
    required String text2}) {
  return Expanded(
    child: Container(
      width: 169,
      height: 52,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.border1Color)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              containerName,
              style: CustomTextStyles.f10W400(color: AppColors.textColor1),
            ),
          ),
          SizedBox(width: 3),
          Center(
            child: Text(
              text2,
              style: CustomTextStyles.f10W400(color: AppColors.textColor1),
            ),
          ),
          SizedBox(width: 10),
          Image.asset(imagePath, width: 36, height: 36),
        ],
      ),
    ),
  );
}
