import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.whiteColor,
            indent: 16,
            endIndent: 16,
          ),
        ),
      ],
    );
  }
}
