import 'package:flutter/material.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class DropdownBottomItem<T> extends StatelessWidget {
  const DropdownBottomItem({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hint,
  });
  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T>> items;
  final String hint;
  final T value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.blackColor,
        border: Border.all(color: AppColors.whiteColor),
      ),
      child: DropdownButton<T>(
        hint: Text(hint, style: AppStyles.medium20White),

        borderRadius: BorderRadius.circular(16),
        dropdownColor: AppColors.blackColor,
        icon: Image.asset(AppAssets.bottom_sheet_icon),

        underline: SizedBox(),
        elevation: 2,
        isExpanded: true,
        style: TextStyle(
          color: AppColors.blackColor,
          backgroundColor: AppColors.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
