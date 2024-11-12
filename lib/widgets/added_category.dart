import 'package:flutter/material.dart';
import 'package:simple_tax/utils/colors.dart';
import 'package:simple_tax/utils/custom_text_styles.dart';
import 'package:simple_tax/utils/image_path.dart'; // Ensure this path contains the image assets

class AddedCategory extends StatelessWidget {
  const AddedCategory({
    super.key,
    required this.icon,
    required this.name,
    required this.colors,
    this.onTap,
  });

  final String icon; // The asset path for the icon
  final Color colors; // The color for the icon background
  final String name; // The name of the category
  final VoidCallback? onTap; // The optional onTap callback

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon Container for the difference icon
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.remove,
                color: AppColors.whiteColor,
                size: 24,
              ),
            ),
            SizedBox(width: 15),
            Container(
              height: 41,
              width: 41,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colors, // Use the dynamic color passed to the widget
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                icon, // Path to the icon image
                color: Colors.white,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                name,
                style: CustomTextStyles.f16W600(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
