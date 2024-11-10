import 'package:flutter/material.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';

class ExpensesSettings extends StatelessWidget {
  const ExpensesSettings({
    super.key,
    required this.icon,
    required this.name,
    required this.colors,
  });
  final IconData icon;
  final Color colors;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        children: [
          Container(
            height: 44,
            width: 44,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(height: 05),
          Text(
            name,
            style: CustomTextStyles.f12W600(
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
