import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class WaitingStateWidget extends StatelessWidget {
  const WaitingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.greyColor));
  }
}
