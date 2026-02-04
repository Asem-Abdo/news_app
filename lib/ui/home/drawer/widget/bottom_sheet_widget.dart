import 'package:flutter/material.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.blackColor,
        border: Border.all(color: AppColors.whiteColor),
      ),
      child: Row(
        children: [
          Text(text, style: AppStyles.medium20White),
          Spacer(),
          InkWell(
            onTap: onPressed,
            child: Image.asset(AppAssets.bottom_sheet_icon),
          ),
        ],
      ),
    );
  }
}
